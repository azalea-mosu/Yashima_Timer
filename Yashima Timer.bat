@echo off
rem Yashima Timer を Chrome のアプリ用ウィンドウ（アドレスバーなし）で起動する
set "HTML=%~dp0index.html"
set "CHROME=%ProgramFiles%\Google\Chrome\Application\chrome.exe"
if not exist "%CHROME%" set "CHROME=%ProgramFiles(x86)%\Google\Chrome\Application\chrome.exe"
if not exist "%CHROME%" set "CHROME=%LocalAppData%\Google\Chrome\Application\chrome.exe"
start "" "%CHROME%" --app="file:///%HTML:\=/%" --window-size=1280,720
