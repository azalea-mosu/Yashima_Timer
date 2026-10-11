' Yashima Timer を Chrome のアプリ用ウィンドウ（アドレスバーなし）で起動する
' このファイルと同じフォルダにある index.html を開くので、フォルダごと移動・コピーしても使える
Option Explicit
Dim fso, sh, dir, url, chrome, candidates, c

Set fso = CreateObject("Scripting.FileSystemObject")
Set sh = CreateObject("WScript.Shell")

dir = fso.GetParentFolderName(WScript.ScriptFullName)
url = "file:///" & Replace(fso.BuildPath(dir, "index.html"), "\", "/")

candidates = Array( _
    sh.ExpandEnvironmentStrings("%ProgramFiles%\Google\Chrome\Application\chrome.exe"), _
    sh.ExpandEnvironmentStrings("%ProgramFiles(x86)%\Google\Chrome\Application\chrome.exe"), _
    sh.ExpandEnvironmentStrings("%LocalAppData%\Google\Chrome\Application\chrome.exe"))

chrome = ""
For Each c In candidates
    If fso.FileExists(c) Then
        chrome = c
        Exit For
    End If
Next

If chrome = "" Then
    MsgBox "Chrome が見つかりませんでした。", vbExclamation, "Yashima Timer"
    WScript.Quit 1
End If

sh.Run """" & chrome & """ --app=""" & url & """ --window-size=1280,720", 1, False
