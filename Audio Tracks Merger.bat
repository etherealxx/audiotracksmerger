::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAjk
::fBw5plQjdCyDJGyX8VAjFD5ARAGQOWq2OpET6/326uSTsXFcf+07cYHc5rKPNukQ5UuqfJUitg==
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSDk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSDk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpCI=
::egkzugNsPRvcWATEpCI=
::dAsiuh18IRvcCxnZtBJQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+IeA==
::cxY6rQJ7JhzQF1fEqQJgZkoaHGQ=
::ZQ05rAF9IBncCkqN+0xwdVsEAlXMbAs=
::ZQ05rAF9IAHYFVzEqQIRPR9dQ0S2Lmq5DaZcxe3p6O+Vwg==
::eg0/rx1wNQPfEVWB+kM9LVsJDCWXOGK1RoEO6evw/Kqqp18aUfBf
::fBEirQZwNQPfEVWB+kM9LVsJDAWXOGK1Eqcd6+Po4u+VpUgPNA==
::cRolqwZ3JBvQF1fEqQIdLQlTSUSPKWeuD6UQ7aj6+u6OrQ0JRuM8c5yb07rOIaAF40HhetYk2G5V2MQCCXs=
::dhA7uBVwLU+EWFyQ/EciLRpYVBzi
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATElA==
::ZQ0/vhVqMQ3MEVWAtB9wSA==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRnk
::Zh4grVQjdCyDJGyX8VAjFD5ARAGQOWq2OpET6/326uSTsXFcf+07cYHc5pWbJOkcqnH2dJUmxTp3ndkLCQkYNgrzOEZ6rHZH1g==
::YB416Ek+ZG8=
::
::
::978f952a14a936cc963da21a135fa983
@echo off
color 0b

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

ffmpeg -i "%filepath%" -c:v copy -filter_complex "[0:1][0:2]amerge=inputs=2" -movflags faststart -y "%filedrivepath%%filenameonly%_merged%fileext%"

echo.
color 0b
echo.
echo -------------------------------------------------------
echo Audio merged
echo The filename is %filenameonly%_merged%fileext%
echo Located in %filedrivepath%
echo If the output file isn't there, then the selected video only has one audio track
echo -------------------------------------------------------
pause