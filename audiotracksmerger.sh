#!/bin/bash
clear

echo -------------------------------------------------------
echo Audio Tracks Merger by etherealxx
echo Inspired from a powershell script by shadowmoose
echo Select your video file with more than one audio tracks:
sleep 2

fullfile=`zenity --file-selection --title="Select a Video File"`
filename=$(basename -- "$fullfile")
extension="${filename##*.}"
filename="${filename%.*}"
filepath="$(dirname "${fullfile}")"
output="${filepath}/${filename}_merged.${extension}"

#if [ -z "$var" ] then exit

clear
echo Audio Tracks Merger by etherealxx
echo Inspired from a powershell script by shadowmoose
echo -------------------------------------------------------
echo Selected video path: "$fullfile"
echo Selected video name: "$filename"
echo Selected video extension: "$extension"
echo -------------------------------------------------------
echo The audio tracks on this file will be merged
echo Make sure you have FFmpeg installed
echo -------------------------------------------------------
read -rsp $'Press any key to continue...\n' -n 1

cd /d %ffpathx%
ffmpeg -i "$fullfile" -c:v copy -filter_complex "[0:1][0:2]amerge=inputs=2" -movflags faststart -y "$output"

echo
echo
echo -------------------------------------------------------
echo Audio merged
echo The filename is "${filename}_merged.${extension}"
echo Located in $filepath
echo "If the output file isn't there, then the selected video only has one audio track"
echo -------------------------------------------------------
read -rsp $'Press any key to continue...\n' -n 1
clear
exit
