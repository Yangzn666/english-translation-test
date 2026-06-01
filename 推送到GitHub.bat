@echo off
chcp 65001 >nul
echo ========================================
echo   GitHub 推送助手
echo ========================================
echo.
echo 请按照以下步骤操作：
echo.
echo 1. 在 GitHub 上创建新仓库（公开仓库）
echo    推荐名称: english-translation-test
echo.
echo 2. 复制仓库地址，格式如：
echo    https://github.com/您的用户名/english-translation-test.git
echo.
pause

set /p REPO_URL="请输入您的 GitHub 仓库地址: "

echo.
echo 正在添加远程仓库...
git remote add origin %REPO_URL%

if errorlevel 1 (
    echo.
    echo 错误：添加远程仓库失败！
    echo 可能原因：
    echo 1. 仓库地址不正确
    echo 2. 已经存在名为 origin 的远程仓库
    echo.
    echo 如需重新设置，请先执行：git remote remove origin
    pause
    exit /b 1
)

echo.
echo 正在切换到 main 分支...
git branch -M main

echo.
echo 正在推送到 GitHub...
git push -u origin main

if errorlevel 1 (
    echo.
    echo 错误：推送失败！
    echo 请检查：
    echo 1. 网络连接是否正常
    echo 2. GitHub 账号是否已登录
    echo 3. 仓库地址是否正确
    pause
    exit /b 1
)

echo.
echo ========================================
echo   ✅ 推送成功！
echo ========================================
echo.
echo 接下来请在 GitHub 上启用 GitHub Pages：
echo 1. 打开仓库页面
echo 2. 点击 Settings 标签
echo 3. 找到 Pages 选项
echo 4. Source 选择 "Deploy from a branch"
echo 5. Branch 选择 "main"，Folder 选择 "/(root)"
echo 6. 点击 Save
echo.
echo 等待 1-3 分钟后，您的网站将可以通过以下地址访问：
echo https://您的用户名.github.io/english-translation-test/
echo.
pause
