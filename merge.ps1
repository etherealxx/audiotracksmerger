Function Get-FileName($initialDirectory){   
	[System.Reflection.Assembly]::LoadWithPartialName("System.windows.forms") |
	Out-Null
	$OpenFileDialog = New-Object System.Windows.Forms.OpenFileDialog
	$OpenFileDialog.initialDirectory = $initialDirectory
	$OpenFileDialog.filter = "All files (*.*)| *.*"
	$OpenFileDialog.ShowDialog() | Out-Null
	$OpenFileDialog.filename
} #end function Get-FileName


clear

echo "Select a file to merge its audio tracks:"

$videos = [Environment]::GetFolderPath("MyVideos")
$vid = Get-FileName -initialDirectory $videos

if($vid -eq ""){
	echo "No input file!"
	exit
}

#$ui = ffprobe -show_entries stream=index,codec_type:stream_tags=language -of compact "$vid" -v 0 | Select-String -Pattern 'audio' -AllMatches | Select-Object -ExpandProperty Line | Out-GridView -PassThru -Title "Select the streams to merge:"

$ui = ffprobe -show_entries stream=index,codec_type:stream_tags=language -of compact "$vid" -v 0 | 
	% {'{"'+ $_.replace('stream|','').replace("|",'", "').replace(":","-").replace("=",'":"') +'"}'} | # Convert to a JSON format via text-manipulation.
	Select-String -Pattern 'audio' -AllMatches  | #Screen audio channels only.
	ConvertFrom-Json | # Build object from JSON string
	Out-gridView -PassThru -Title "Select which track(s) to merge (hold ctrl for multiple), then click 'OK' in the bottom right."| #Prompt
	Select -ExpandProperty Index # Fetch 'Index' property.
echo "$ui"

$track_matches = Select-String -Pattern "(\d)" -input "$ui" -AllMatches
$tracks = @()
$tracklist = ""
Foreach ($track in $track_matches.matches){
	$tracks+= $track.value
	$tracklist+="[0:$($track.value)]"
}

if($tracks.Length -eq 0){
	echo "No tracks selected!"
	exit
}

echo "Tracks: $tracks"
echo $tracklist

echo "Where should this be saved?"

$DesktopPath = [Environment]::GetFolderPath("Desktop")
$SaveChooser = New-Object -Typename System.Windows.Forms.SaveFileDialog
$SaveChooser.initialDirectory = $DesktopPath
$SaveChooser.filter = "Video Files| *.mp4"
$SaveChooser.ShowDialog()

$output = $SaveChooser.filename

if($output -eq ""){
	echo "No output file!"
	exit
}

echo "Saving to $output"

ffmpeg -i "$vid" -c:v copy -filter_complex "$($tracklist)amerge=inputs=$($tracks.Length)" -movflags faststart -y "$output"

echo "Finished."

