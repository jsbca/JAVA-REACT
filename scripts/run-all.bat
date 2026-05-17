@echo off
setlocal
set "ROOT_DIR=%~dp0.."
set "CMD_EXE=%SystemRoot%\System32\cmd.exe"

start "Backend" "%CMD_EXE%" /k "cd /d \"%ROOT_DIR%\" && scripts\dev-start.bat"
start "Frontend" "%CMD_EXE%" /k "cd /d \"%ROOT_DIR%\" && scripts\frontend-start.bat"

echo Started backend and frontend in separate windows.
