# 星尘倒计时（Stardust Countdown）部署与交付包

本目录是一个**零依赖、纯静态单页网站**，包含完整前端代码（`index.html`）以及本地运行和部署到 GitHub Pages 的全部脚本与步骤。你可以直接把本压缩包交给其他 AI Agent / 自动化引擎，或按以下步骤手动部署。

## 文件清单
- `index.html`：星尘倒计时完整网页应用（单文件自包含，无需构建或安装依赖）。
- `.nojekyll`：告知 GitHub Pages 直接发布静态文件，跳过 Jekyll 构建。
- `deploy_local.sh` / `deploy_local.bat`：macOS/Linux 与 Windows 本地一键启动脚本。
- `deploy_github.sh`：使用 GitHub CLI (`gh`) 一键建仓、推送并开启 GitHub Pages 的脚本。
- `DEPLOY_GUIDE.md`：本部署说明文档。

---

## 一、本地部署成网址（Localhost）

在解压后的目录中任选一种方式：
1. **最简单**：直接双击 `index.html` 用浏览器打开。
2. **启动本地 HTTP 服务**（推荐）：
   - macOS / Linux：运行 `./deploy_local.sh`（或 `python3 -m http.server 8000`）
   - Windows：双击 `deploy_local.bat`（或运行 `python -m http.server 8000`）
   - 浏览器访问：`http://localhost:8000`

---

## 二、部署到 GitHub Pages（生成公网网址，所有人可访问）

### 方法 A：全自动一键部署（推荐给 AI Agent / 命令行）
前提：本机已安装 `git` 和 GitHub CLI (`gh`)，且已完成 `gh auth login`。

```bash
chmod +x deploy_github.sh
./deploy_github.sh stardust-countdown
```
执行完成后等待 1～2 分钟，即可通过以下公网网址访问：
`https://<你的GitHub用户名>.github.io/stardust-countdown/`

### 方法 B：标准 Git 命令行推送
1. 在 GitHub 新建一个公开（Public）空仓库，例如 `stardust-countdown`。
2. 在本目录执行：
   ```bash
   git init -b main
   git add index.html .nojekyll DEPLOY_GUIDE.md
   git commit -m "Initial deploy of Stardust Countdown"
   git remote add origin https://github.com/<你的GitHub用户名>/stardust-countdown.git
   git push -u origin main
   ```
3. 打开 GitHub 仓库页面：**Settings → Pages → Build and deployment**：
   - **Source** 选择 `Deploy from a branch`
   - **Branch** 选择 `main`，目录选择 `/ (root)`，点击 **Save**。
4. 等待 1～2 分钟刷新页面，顶部会出现已发布的公网链接。

### 方法 C：纯网页免命令行上传
1. 登录 GitHub → 点击右上角 `+` → **New repository** → 填仓库名（如 `stardust-countdown`）→ 选择 **Public** → 点击 **Create repository**。
2. 点击页面中的 **uploading an existing file**，把 `index.html` 和 `.nojekyll` 拖入上传区，点击 **Commit changes**。
3. 进入仓库 **Settings → Pages**，在 **Branch** 中选择 `main` 和 `/ (root)`，点击 **Save**。
4. 1～2 分钟后访问 `https://<你的GitHub用户名>.github.io/stardust-countdown/`。

---

## 三、交给其他 AI Agent / Engine 的执行指令参考
你可以直接把本文件夹路径和下面这段话发给其他引擎：

> 请读取当前目录的 `DEPLOY_GUIDE.md`：
> 1. 先帮我在本地用 `python3 -m http.server 8000` 启动并验证 `http://localhost:8000` 可以正常打开；
> 2. 再帮我把本目录下的 `index.html` 和 `.nojekyll` 推送到我的 GitHub 新建公开仓库 `stardust-countdown`，并开启 GitHub Pages（`main` 分支根目录），最后把生成的公网访问链接发给我。
