# Mesh2Splat 本地部署（Windows / macOS）

中文文档、脚本与验收清单，用于在本地构建与使用 [Electronic Arts Mesh2Splat](https://github.com/electronicarts/mesh2splat)（网格快速转为 3D Gaussian Splatting）。

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

## 快速入口

| 用途 | 链接 |
|------|------|
| Windows 最快测试 | [docs/mesh2splat/WINDOWS_QUICKSTART.md](docs/mesh2splat/WINDOWS_QUICKSTART.md) |
| 文档总览 | [docs/mesh2splat/README.md](docs/mesh2splat/README.md) |
| MVP 验收 | [docs/mesh2splat/MVP_ACCEPTANCE.md](docs/mesh2splat/MVP_ACCEPTANCE.md) |

## 仓库结构

```
├── mesh2splat/        # EA Mesh2Splat 源码 + macOS 可移植性修改（见 docs/mesh2splat/MACOS_SOURCE_CHANGES.md）
├── docs/mesh2splat/   # 部署与构建说明
├── scripts/           # Windows PowerShell / macOS Shell
├── patches/           # CMake macOS 补丁（与已合入 mesh2splat/CMakeLists.txt 对照用）
├── LICENSE
└── README.md
```

## 说明

- **可执行程序**需在本地编译生成（`mesh2splat/bin/Release/`，该目录已 `.gitignore`）。
- **Windows**：进入 `mesh2splat` 运行 `run_build_release.bat`，或使用仓库根目录 `scripts/mesh2splat-win-build.ps1`。
- **macOS**：见 [docs/mesh2splat/MACOS_BUILD.md](docs/mesh2splat/MACOS_BUILD.md)；或执行 `./scripts/mesh2splat-macos-build.sh`（默认使用本仓库内 `mesh2splat/`）。

## Git 与远程

推送与 `origin` / `gaussian-splatting` 分工见 **[docs/GIT_WORKFLOW.md](docs/GIT_WORKFLOW.md)**。主代码请推送到 **gaussian-splatting-Windows-2**。

## 深化开发

路线图与后续工作见 **[docs/DEVELOPMENT.md](docs/DEVELOPMENT.md)**。

## License

[MIT](LICENSE)
