@echo off
setlocal
set "ROOT_DIR=%~dp0.."

cd /d "%ROOT_DIR%\frontend"
if not exist node_modules (
  call npm.cmd install
  if errorlevel 1 exit /b %ERRORLEVEL%
)

call npm.cmd run build:backend
if errorlevel 1 exit /b %ERRORLEVEL%

cd /d "%ROOT_DIR%"
call scripts\dev-start.bat
