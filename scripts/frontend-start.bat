@echo off
setlocal
set "ROOT_DIR=%~dp0.."
set "POWERSHELL_EXE=%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe"
set "PID_FILE=%TEMP%\frontend-port-5173.txt"
set "PORT_5173_PID="

del "%PID_FILE%" >NUL 2>NUL
"%POWERSHELL_EXE%" -NoProfile -ExecutionPolicy Bypass -File "%~dp0find-listener.ps1" 5173 > "%PID_FILE%"
set /p PORT_5173_PID=<"%PID_FILE%" 2>NUL
del "%PID_FILE%" >NUL 2>NUL

if defined PORT_5173_PID (
  echo Port 5173 is already in use by PID %PORT_5173_PID%.
  echo Run scripts\stop-dev.bat first, or stop that process and try again.
  exit /b 1
)

cd /d "%ROOT_DIR%\frontend"
if not exist node_modules (
  call npm.cmd install
  if errorlevel 1 exit /b %ERRORLEVEL%
)

call npm.cmd run dev -- --host
