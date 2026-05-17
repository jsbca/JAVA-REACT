@echo off
setlocal

set "MVNW_DIR=%~dp0"
set "POWERSHELL_EXE=%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe"
set "WHERE_EXE=%SystemRoot%\System32\where.exe"
set "MAVEN_VERSION=3.9.9"
set "MAVEN_DIST_NAME=apache-maven-%MAVEN_VERSION%"
set "MAVEN_HOME=%MVNW_DIR%.mvn\wrapper\dists\%MAVEN_DIST_NAME%"
set "MAVEN_BIN=%MAVEN_HOME%\bin\mvn.cmd"
set "MAVEN_ZIP=%MVNW_DIR%.mvn\wrapper\dists\%MAVEN_DIST_NAME%-bin.zip"
set "MAVEN_URL=https://archive.apache.org/dist/maven/maven-3/%MAVEN_VERSION%/binaries/%MAVEN_DIST_NAME%-bin.zip"

if not exist "%POWERSHELL_EXE%" (
  echo PowerShell was not found at %POWERSHELL_EXE%
  exit /b 1
)

"%WHERE_EXE%" mvn >NUL 2>NUL
if %ERRORLEVEL% EQU 0 (
  mvn %*
  exit /b %ERRORLEVEL%
)

if not exist "%MAVEN_BIN%" (
  if not exist "%MVNW_DIR%.mvn\wrapper\dists" (
    mkdir "%MVNW_DIR%.mvn\wrapper\dists"
  )

  "%POWERSHELL_EXE%" -NoProfile -ExecutionPolicy Bypass -Command ^
    "$ErrorActionPreference = 'Stop';" ^
    "$ProgressPreference = 'SilentlyContinue';" ^
    "[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12;" ^
    "Invoke-WebRequest -Uri '%MAVEN_URL%' -OutFile '%MAVEN_ZIP%';" ^
    "Expand-Archive -Path '%MAVEN_ZIP%' -DestinationPath '%MVNW_DIR%.mvn\wrapper\dists' -Force"

  if errorlevel 1 (
    echo Failed to download Maven from %MAVEN_URL%
    exit /b 1
  )

  del /q "%MAVEN_ZIP%" >NUL 2>NUL
)

"%MAVEN_BIN%" %*
exit /b %ERRORLEVEL%
