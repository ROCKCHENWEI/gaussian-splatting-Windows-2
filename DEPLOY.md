# Seedance 2.0 视频生产成本计算器 - 部署指南

本项目是纯静态前端单文件应用，不依赖 Node.js 或数据库等后端环境，部署方式极其灵活。以下提供三种主流部署方案。

---

## 方案一：零成本云端托管（推荐）

适用于快速对外发布，无需购买服务器。免费静态托管平台自带 CDN 加速和 HTTPS。

**适用平台**：Vercel、Netlify、GitHub Pages

### 操作步骤（以 Vercel 为例）

1. 将 `calculator.html` 重命名为 `index.html`，或直接上传包含 `calculator.html` 的文件夹（Vercel 支持配置入口）。
2. 登录 [Vercel 官网](https://vercel.com)。
3. 点击 "Add New Project"。
4. 选择 "Deploy manually"（手动部署），直接把包含 `index.html` 或 `calculator.html` 的文件夹拖拽到网页中上传。
5. 等待约 10 秒，Vercel 会自动生成一个可供全球访问的公网链接（支持绑定自定义域名）。

### GitHub Pages

1. 将项目推送到 GitHub 仓库。
2. 在仓库 Settings → Pages 中，将 Source 设为 `main` 分支的根目录或 `/docs`。
3. 确保根目录有 `index.html`（可将 `calculator.html` 重命名或复制为 `index.html`）。

---

## 方案二：Docker 容器化封装部署（企业级）

适用于自有云服务器（如阿里云、腾讯云）或企业内网部署。

**前提条件**：服务器已安装 Docker。

### 操作步骤

1. 将 `calculator.html` 和 `Dockerfile` 放在同一目录下。
2. 在该目录打开终端，构建 Docker 镜像：

```bash
docker build -t seedance-calculator .
```

3. 运行容器，将服务器的 8080 端口映射到容器的 80 端口：

```bash
docker run -d -p 8080:80 --name my-calculator seedance-calculator
```

4. 部署完成。通过 `http://你的服务器IP:8080` 访问计算器。

### 停止与删除

```bash
docker stop my-calculator
docker rm my-calculator
```

---

## 方案三：传统 Nginx / 宝塔面板部署

适用于传统 Linux 服务器或虚拟主机。

### 操作步骤

1. 登录服务器（或宝塔面板）。
2. 在 `/www/wwwroot/` 或站点根目录下创建新站点文件夹。
3. 将 `calculator.html` 上传到该文件夹，并重命名为 `index.html`。
4. 在 Nginx 配置或宝塔后台中，将网站的「运行目录」或「根目录」指向该文件夹。
5. 访问配置的域名或 IP 即可使用。

---

## 开发维护建议

### 更新公式

若 Seedance 的计费规则变更，只需：

1. 用文本编辑器打开 `calculator.html`。
2. 搜索 `const tokens` 或 `const TOKENS_PER_SECOND` 等常量。
3. 修改公式逻辑后保存。
4. 重新上传覆盖即可生效，无需重新编译。

### SEO 优化

当前 HTML 的 `<head>` 中已包含基础 Meta 信息。如需更好收录，可在 `<head>` 中补充：

- `<meta name="keywords" content="...">`
- `<meta name="description" content="...">`
