Set WshShell = CreateObject("WScript.Shell")
Set fso = CreateObject("Scripting.FileSystemObject")

' 获取当前脚本所在目录
scriptPath = fso.GetParentFolderName(WScript.ScriptFullName)
htmlPath = scriptPath & "\index.html"

' 使用默认浏览器打开HTML文件
WshShell.Run """" & htmlPath & """", 1, False
