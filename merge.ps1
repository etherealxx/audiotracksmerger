# Takes a video with two audio tracks (as recorded when split by programs such as ShadowPlay),
# and muxes both tracks into one output video.
# To call this script through Powershell: "./merge.ps1"
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


echo "Where should this be saved?"

$DesktopPath = [Environment]::GetFolderPath("Desktop")
$SaveChooser = New-Object -Typename System.Windows.Forms.SaveFileDialog
$SaveChooser.initialDirectory = $DesktopPath
$SaveChooser.filter = "Video Files| *.mp4"
$SaveChooser.ShowDialog()

$output = $SaveChooser.filename

echo "Saving to $output"

ffmpeg -i "$vid" -c:v copy -filter_complex "[0:1][0:2]amerge=inputs=2" -movflags faststart -y "$output"

echo "Finished."

