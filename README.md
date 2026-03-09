# Seedance 2.0 视频 Token 计算器

根据视频时长与计费模式，估算 [Seedance 2.0](https://seedance-2-ai.com/) 视频生成 API 的 Token 消耗与生产成本。

[![Vercel](https://img.shields.io/badge/Vercel-在线演示-black?logo=vercel)](https://260306.vercel.app)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

---

## 功能

- **多计费模式**：API 纯视频生成、API 视频编辑、Web 标准、Web HD
- **灵活输入**：支持分钟 + 秒，自定义重试次数
- **实时计算**：输入即得预估 tokens 与成本
- **零依赖**：单文件 HTML，无后端、无构建

## 在线使用

**[https://260306.vercel.app](https://260306.vercel.app)**

## 计费参考

| 模式 | 定价 |
|------|------|
| API - 纯视频生成 | 46 元/百万 tokens |
| API - 视频编辑 | 28 元/百万 tokens |
| Web 平台 - 标准 | 180 积分/条 |
| Web 平台 - HD | 240 积分/条 |

*定价来源于公开信息，以官方为准。*

## 本地运行

```bash
# 克隆仓库
git clone https://github.com/ROCKCHENWEI/seedance-calculator.git
cd seedance-calculator

# 用浏览器直接打开
open calculator.html

# 或启动本地服务
python3 -m http.server 8080
# 访问 http://localhost:8080/calculator.html
```

## 部署

### Vercel（推荐）

```bash
vercel
```

### Docker

```bash
docker build -t seedance-calculator .
docker run -d -p 8080:80 --name my-calculator seedance-calculator
# 访问 http://localhost:8080
```

### 其他方式

详见 [DEPLOY.md](DEPLOY.md)。

## 项目结构

```
seedance-calculator/
├── calculator.html   # 计算器主文件（单文件，含样式与逻辑）
├── Dockerfile       # Docker 镜像
├── vercel.json      # Vercel 路由配置
├── DEPLOY.md        # 部署指南
└── README.md
```

## 公式维护

计费规则变更时，编辑 `calculator.html`，搜索 `const TOKENS_PER_SECOND` 或 `const PRICE_` 修改对应常量即可。

## License

[MIT](LICENSE)
