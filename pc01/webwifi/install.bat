@echo off
setlocal

set "SCRIPT_DIR=%~dp0"
set "XML=%SCRIPT_DIR%Wi-Fi-NTSU-802.1x.xml"

if not exist "%XML%" (
  echo Cannot find Wi-Fi profile XML: "%XML%"
  pause
  exit /b 1
)

net session >nul 2>&1
if %errorlevel% neq 0 (
  echo Requesting administrator permission...
  powershell -NoProfile -ExecutionPolicy Bypass -Command "Start-Process -FilePath '%~f0' -Verb RunAs"
  exit /b
)

echo Installing NTSU-802.1x Wi-Fi profile...
netsh wlan add profile filename="%XML%" user=all

echo.
echo Installed. Now click Wi-Fi, choose NTSU-802.1x, then enter your school account and password.
echo.
pause
