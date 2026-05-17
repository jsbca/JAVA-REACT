@echo off
setlocal
set "ROOT_DIR=%~dp0.."
set "POWERSHELL_EXE=%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe"
set "PID_FILE=%TEMP%\backend-port-8080.txt"
set "PORT_8080_PID="

del "%PID_FILE%" >NUL 2>NUL
"%POWERSHELL_EXE%" -NoProfile -ExecutionPolicy Bypass -File "%~dp0find-listener.ps1" 8080 > "%PID_FILE%"
set /p PORT_8080_PID=<"%PID_FILE%" 2>NUL
del "%PID_FILE%" >NUL 2>NUL

if defined PORT_8080_PID (
  echo Port 8080 is already in use by PID %PORT_8080_PID%.
  echo Run scripts\stop-dev.bat first, or stop that process and try again.
  exit /b 1
)

call "%ROOT_DIR%\backend\mvnw.cmd" -f "%ROOT_DIR%\backend\pom.xml" spring-boot:run
