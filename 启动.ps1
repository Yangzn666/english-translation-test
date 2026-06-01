# 英语翻译检测小程序启动器
$ErrorActionPreference = "SilentlyContinue"

Write-Host ""
Write-Host "========================================"
Write-Host "  英语翻译检测小程序"
Write-Host "========================================"
Write-Host ""
Write-Host "正在启动..."
Write-Host ""

# 获取当前脚本所在目录
$scriptPath = Split-Path -Parent $MyInvocation.MyCommand.Path
$htmlPath = Join-Path $scriptPath "index.html"

# 使用默认浏览器打开
Start-Process $htmlPath

Write-Host ""
Write-Host "程序已启动，请查看浏览器窗口"
Write-Host ""
Write-Host "如果显示错误页面，请右键 index.html 选择浏览器打开"
Write-Host ""
Write-Host "按任意键退出..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
