# GitHub 仓库创建和推送脚本
# 作者: 杨臻宁
# 日期: 2026-06-01

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  GitHub 仓库自动创建和推送工具" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

$repoName = "english-translation-test"
$repoDesc = "英语翻译检测小程序 - 词组和词汇拼写练习工具（含智能提示和移动端优化）"
$githubUser = "Yangzn666"
$projectPath = "d:\学习\效率\英语翻译检测小程序"

Write-Host "📦 项目信息:" -ForegroundColor Green
Write-Host "  仓库名称: $repoName" -ForegroundColor White
Write-Host "  仓库描述: $repoDesc" -ForegroundColor White
Write-Host "  GitHub用户: $githubUser" -ForegroundColor White
Write-Host ""

# 检查是否已经存在远程仓库
Write-Host "🔍 检查远程仓库配置..." -ForegroundColor Yellow
cd $projectPath
$remoteExists = git remote get-url origin 2>$null

if ($remoteExists) {
    Write-Host "⚠️  已存在远程仓库: $remoteExists" -ForegroundColor Yellow
    $choice = Read-Host "是否删除并重新设置？(y/n)"
    if ($choice -eq 'y' -or $choice -eq 'Y') {
        git remote remove origin
        Write-Host "✅ 已删除旧的远程仓库配置" -ForegroundColor Green
    } else {
        Write-Host "❌ 操作已取消" -ForegroundColor Red
        exit
    }
}

# 提示用户输入 GitHub Token
Write-Host ""
Write-Host "🔑 请输入您的 GitHub Personal Access Token:" -ForegroundColor Yellow
Write-Host "   (如果还没有，请访问: https://github.com/settings/tokens)" -ForegroundColor Gray
Write-Host "   需要权限: repo (完整控制私有仓库)" -ForegroundColor Gray
Write-Host ""
$token = Read-Host "Token" -AsSecureString
$bstr = [Runtime.InteropServices.Marshal]::SecureStringToBSTR($token)
$plainToken = [Runtime.InteropServices.Marshal]::PtrToStringAuto($bstr)

Write-Host ""
Write-Host "🚀 正在创建 GitHub 仓库..." -ForegroundColor Yellow

# 使用 GitHub API 创建仓库
$headers = @{
    "Authorization" = "token $plainToken"
    "Accept" = "application/vnd.github.v3+json"
}

$body = @{
    name = $repoName
    description = $repoDesc
    private = $false
    auto_init = $false
} | ConvertTo-Json

try {
    $response = Invoke-RestMethod -Uri "https://api.github.com/user/repos" -Method Post -Headers $headers -Body $body -ContentType "application/json"
    
    Write-Host "✅ 仓库创建成功！" -ForegroundColor Green
    Write-Host "   仓库地址: $($response.html_url)" -ForegroundColor Cyan
    Write-Host ""
    
} catch {
    $errorMsg = $_.Exception.Message
    
    # 检查是否是仓库已存在的错误
    if ($errorMsg -match "already exists") {
        Write-Host "⚠️  仓库 '$repoName' 已存在！" -ForegroundColor Yellow
        $choice = Read-Host "是否使用现有仓库继续推送？(y/n)"
        if ($choice -ne 'y' -and $choice -ne 'Y') {
            Write-Host "❌ 操作已取消" -ForegroundColor Red
            exit
        }
        Write-Host "✅ 将使用现有仓库" -ForegroundColor Green
    } else {
        Write-Host "❌ 创建仓库失败: $errorMsg" -ForegroundColor Red
        Write-Host ""
        Write-Host "可能的原因:" -ForegroundColor Yellow
        Write-Host "1. Token 无效或过期" -ForegroundColor White
        Write-Host "2. Token 权限不足（需要 repo 权限）" -ForegroundColor White
        Write-Host "3. 网络连接问题" -ForegroundColor White
        Write-Host ""
        exit
    }
}

# 添加远程仓库
Write-Host ""
Write-Host "🔗 正在添加远程仓库..." -ForegroundColor Yellow
$repoUrl = "https://$githubUser:$plainToken@github.com/$githubUser/$repoName.git"
git remote add origin $repoUrl

if ($LASTEXITCODE -eq 0) {
    Write-Host "✅ 远程仓库添加成功" -ForegroundColor Green
} else {
    Write-Host "❌ 远程仓库添加失败" -ForegroundColor Red
    exit
}

# 切换到 main 分支
Write-Host ""
Write-Host "🌿 正在切换到 main 分支..." -ForegroundColor Yellow
git branch -M main

# 推送代码
Write-Host ""
Write-Host "📤 正在推送代码到 GitHub..." -ForegroundColor Yellow
git push -u origin main

if ($LASTEXITCODE -eq 0) {
    Write-Host ""
    Write-Host "========================================" -ForegroundColor Green
    Write-Host "  ✅ 推送成功！" -ForegroundColor Green
    Write-Host "========================================" -ForegroundColor Green
    Write-Host ""
    Write-Host "🌐 仓库地址:" -ForegroundColor Cyan
    Write-Host "   https://github.com/$githubUser/$repoName" -ForegroundColor White
    Write-Host ""
    Write-Host "📱 接下来请启用 GitHub Pages:" -ForegroundColor Yellow
    Write-Host "   1. 访问: https://github.com/$githubUser/$repoName/settings/pages" -ForegroundColor White
    Write-Host "   2. Source 选择: Deploy from a branch" -ForegroundColor White
    Write-Host "   3. Branch 选择: main / (root)" -ForegroundColor White
    Write-Host "   4. 点击 Save" -ForegroundColor White
    Write-Host ""
    Write-Host "⏳ 等待 1-3 分钟后，您的网站将可以通过以下地址访问:" -ForegroundColor Yellow
    Write-Host "   https://$githubUser.github.io/$repoName/" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "按任意键打开浏览器..." -ForegroundColor Gray
    $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
    
    # 打开浏览器
    Start-Process "https://github.com/$githubUser/$repoName/settings/pages"
    
} else {
    Write-Host ""
    Write-Host "❌ 推送失败！" -ForegroundColor Red
    Write-Host ""
    Write-Host "请检查:" -ForegroundColor Yellow
    Write-Host "1. 网络连接是否正常" -ForegroundColor White
    Write-Host "2. GitHub 账号是否已登录" -ForegroundColor White
    Write-Host "3. Token 是否有效" -ForegroundColor White
    Write-Host ""
}

Write-Host ""
pause
