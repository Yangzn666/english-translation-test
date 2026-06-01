# GitHub Pages 部署指南

## 📋 前置准备

### 1. 创建 GitHub 仓库

请按照以下步骤在 GitHub 上创建新仓库：

#### 步骤 1：登录 GitHub
访问 https://github.com 并登录您的账户

#### 步骤 2：创建新仓库
1. 点击右上角的 **+** 号，选择 **New repository**
2. 填写仓库信息：
   - **Repository name**: `english-translation-test`（或其他您喜欢的名称）
   - **Description**: `英语翻译检测小程序 - 词组和词汇拼写练习工具`
   - **Visibility**: ✅ Public（必须公开才能使用 GitHub Pages）
   - ❌ 不要勾选 "Initialize this repository with a README"
3. 点击 **Create repository**

#### 步骤 3：获取仓库地址
创建完成后，复制仓库的 HTTPS 地址，格式类似：
```
https://github.com/您的用户名/english-translation-test.git
```

---

## 🚀 推送代码到 GitHub

### 方法一：使用命令行（推荐）

在终端中执行以下命令（替换为您的仓库地址）：

```bash
cd "d:\学习\效率\英语翻译检测小程序"

# 添加远程仓库（替换为您的实际仓库地址）
git remote add origin https://github.com/您的用户名/english-translation-test.git

# 推送到 GitHub
git branch -M main
git push -u origin main
```

### 方法二：使用图形化工具

如果您使用 GitHub Desktop 或其他 Git 客户端：
1. 克隆刚创建的空仓库到本地
2. 将 `英语翻译检测小程序` 文件夹中的所有文件复制到克隆的仓库中
3. 提交并推送

---

## 🌐 启用 GitHub Pages

### 步骤 1：进入仓库设置
1. 在 GitHub 上打开您的仓库
2. 点击顶部的 **Settings** 标签
3. 在左侧菜单中找到 **Pages**（可能在 "Code and automation" 部分）

### 步骤 2：配置 GitHub Pages
1. 在 **Source** 下拉菜单中选择：**Deploy from a branch**
2. 在 **Branch** 部分：
   - Branch: 选择 **main**
   - Folder: 选择 **/(root)**
3. 点击 **Save**

### 步骤 3：等待部署
- GitHub 会自动构建您的网站
- 通常需要 1-3 分钟
- 刷新页面后，顶部会显示您的网站地址

### 步骤 4：获取网站地址
部署成功后，您会看到类似这样的地址：
```
https://您的用户名.github.io/english-translation-test/
```

这就是您独立的网址！✨

---

## ✅ 验证部署

### 检查清单
1. ✅ 访问 GitHub Pages 网址
2. ✅ 确认页面正常加载
3. ✅ 测试所有功能：
   - 模式切换（词组/词汇）
   - 答题功能
   - 提示功能
   - 进度保存
   - 移动端适配

### 常见问题

#### 问题 1：页面显示 404
**解决方案**：
- 等待几分钟，GitHub Pages 可能需要时间部署
- 检查是否选择了正确的分支和文件夹
- 确认仓库是公开的（Public）

#### 问题 2：样式加载失败
**解决方案**：
- 检查浏览器控制台是否有错误
- Tailwind CSS 通过 CDN 加载，确保网络连接正常
- 尝试硬刷新（Ctrl + F5）

#### 问题 3：中文显示乱码
**解决方案**：
- 检查 HTML 文件的编码是否为 UTF-8
- 通常 GitHub 会自动处理，一般不会出现此问题

---

## 🔄 更新网站

当您修改了代码后，推送更新：

```bash
cd "d:\学习\效率\英语翻译检测小程序"

# 提交更改
git add .
git commit -m "描述您的更新内容"

# 推送到 GitHub（自动触发重新部署）
git push
```

GitHub Pages 会在几分钟后自动更新。

---

## 📱 分享您的网站

部署成功后，您可以：
1. 将网址分享给朋友和同学
2. 在手机浏览器中访问（已完美适配移动端）
3. 添加到手机主屏幕（PWA 支持）
4. 在任何设备上使用，无需安装

---

## 🔒 独立于主项目

### 重要说明
✅ 这个仓库完全独立于您的 `效率` 主项目
✅ 不会影响效率网站的正常运行
✅ 有独立的网址和部署流程
✅ 可以单独更新和维护

### 两个项目的关系
```
效率网站 (kaoyan-platform)
└── GitHub: 您的主仓库
    └── 网址: https://您的用户名.github.io/kaoyan-platform/

英语翻译检测小程序 (english-translation-test) ← 新项目
└── GitHub: 独立仓库
    └── 网址: https://您的用户名.github.io/english-translation-test/
```

两者互不干扰，完全独立！

---

## 💡 高级选项

### 自定义域名（可选）
如果您有自己的域名，可以：
1. 在 DNS 设置中添加 CNAME 记录
2. 在 GitHub Pages 设置中配置自定义域名
3. 创建 CNAME 文件

### 私有仓库 + Actions（高级）
如果需要私有仓库：
1. 使用 GitHub Actions 自动部署
2. 需要配置 Personal Access Token
3. 详见 GitHub Actions 文档

---

## 📞 需要帮助？

如果在部署过程中遇到问题：
1. 检查 GitHub Pages 构建日志（Settings → Pages）
2. 查看浏览器控制台的错误信息
3. 参考 GitHub Pages 官方文档：https://docs.github.com/pages

---

**祝您部署顺利！** 🎉
