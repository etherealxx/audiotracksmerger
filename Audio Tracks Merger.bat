@echo on
color 0b

if exist C:\ffmpeg.exe set ffpath="C:" && goto found
if exist C:\ffmpeg\ffmpeg.exe set ffpath="C:\ffmpeg" && goto found
if exist C:\ffmpeg\bin\ffmpeg.exe set ffpath="C:\ffmpeg\bin" && goto found
if exist "C:\Program Files\ffmpeg\bin\ffmpeg.exe" set ffpath="C:\Program Files\ffmpeg\bin" && goto found
if exist "C:\Program Files\FFmpeg\bin\ffmpeg.exe" set ffpath="C:\Program Files\FFmpeg\bin" && goto found
if exist "C:\Users\%USERNAME%\Downloads\ffmpeg.exe" set ffpath="C:\Users\%USERNAME%\Downloads" && goto found
if exist "C:\Users\%USERNAME%\Downloads\ffmpeg\bin\ffmpeg.exe" set ffpath="C:\Users\%USERNAME%\Downloads\ffmpeg\bin" && goto found
if exist "%cd%\ffmpeg.exe" set ffpath="%cd%" && goto found
if exist C:\Windows\System32\ffmpeg.exe set ffpath="C:\Windows\System32" && goto found
goto notfound

:notfound
@echo off
echo -------------------------------------------------------
echo ffmpeg not found
echo make sure you install/download it first before you continue to use this script/app
echo -------------------------------------------------------
pause
exit

:found
@echo off
for %%F in ("%ffpath%") do set ffpathx=%%~F
cls
echo ffmpeg found in %ffpathx%
goto intro

:intro
echo -------------------------------------------------------
echo Audio Tracks Merger by etherealxx
echo Inspired from a powershell script by shadowmoose
echo Select your video file with more than one audio tracks:

set dialog="about:<input type=file id=FILE><script>FILE.click();new ActiveXObject
set dialog=%dialog%('Scripting.FileSystemObject').GetStandardStream(1).WriteLine(FILE.value);
set dialog=%dialog%close();resizeTo(0,0);</script>"

for /f "tokens=* delims=" %%p in ('mshta.exe %dialog%') do set "filepath=%%p"
for %%F in ("%filepath%") do set "filenameonly=%%~nF"
for %%F in ("%filepath%") do set "fileext=%%~xF"
for %%F in ("%filepath%") do set "filenameext=%%~nxF"
for %%F in ("%filepath%") do set "filedrivepath=%%~dpF"
if defined filepath goto next
exit

:next
cls
echo Audio Tracks Merger by etherealxx
echo Inspired from a powershell script by shadowmoose
echo -------------------------------------------------------
echo Selected video path: "%filepath%"
echo Selected video name: "%filenameext%"
echo Selected video extension: "%fileext%"
echo -------------------------------------------------------
echo The audio tracks on this file will be merged
echo Make sure you have FFmpeg installed
echo -------------------------------------------------------
pause
color 0f

cd /d %ffpathx%
ffmpeg.exe -i "%filepath%" -c:v copy -filter_complex "[0:1][0:2]amerge=inputs=2" -movflags faststart -y "%filedrivepath%%filenameonly%_merged%fileext%"

echo.
color 0b
echo.
echo -------------------------------------------------------
echo Audio merged
echo The filename is "%filenameonly%_merged%fileext%"
echo Located in %filedrivepath%
echo If the output file isn't there, then the selected video only has one audio track
echo -------------------------------------------------------
pause