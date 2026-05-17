@echo off
setlocal
set "POWERSHELL_EXE=%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe"

call :stopPort 8080 backend-port-8080.txt
call :stopPort 5173 frontend-port-5173.txt
exit /b 0

:stopPort
set "PORT=%~1"
set "PID_FILE=%TEMP%\%~2"
set "LISTENER_PID="

del "%PID_FILE%" >NUL 2>NUL
"%POWERSHELL_EXE%" -NoProfile -ExecutionPolicy Bypass -File "%~dp0find-listener.ps1" %PORT% > "%PID_FILE%"
set /p LISTENER_PID=<"%PID_FILE%" 2>NUL
del "%PID_FILE%" >NUL 2>NUL

if not defined LISTENER_PID exit /b 0

"%POWERSHELL_EXE%" -NoProfile -ExecutionPolicy Bypass -Command "Stop-Process -Id %LISTENER_PID% -Force -ErrorAction Stop" >NUL 2>NUL
if errorlevel 1 (
  echo Could not stop PID %LISTENER_PID% on port %PORT%.
  exit /b 0
)

echo Stopped PID %LISTENER_PID% on port %PORT%.
exit /b 0
