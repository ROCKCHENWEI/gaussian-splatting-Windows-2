# Mesh2Splat 本地部署

基于 [electronicarts/mesh2splat](https://github.com/electronicarts/mesh2splat) 的 Windows / macOS 本地部署文档与脚本。

## 文档索引

| 文档 | 说明 |
|------|------|
| [WINDOWS_QUICKSTART.md](./WINDOWS_QUICKSTART.md) | Windows 最快上手（优先用于尽快测试） |
| [WINDOWS_SETUP.md](./WINDOWS_SETUP.md) | Windows 环境准备（VS、CMake、OpenGL） |
| [BUILD_WINDOWS.md](./BUILD_WINDOWS.md) | Windows 构建与运行步骤 |
| [MACOS_BUILD.md](./MACOS_BUILD.md) | macOS 构建指南（非官方，需 Homebrew） |
| [MACOS_SOURCE_CHANGES.md](./MACOS_SOURCE_CHANGES.md) | 相对上游的 macOS 源码改动清单 |
| [CLONE_AND_BUILD.md](./CLONE_AND_BUILD.md) | 克隆与构建总览 |
| [MVP_ACCEPTANCE.md](./MVP_ACCEPTANCE.md) | MVP 验收清单 |

## 脚本

| 脚本 | 平台 | 用途 |
|------|------|------|
| `scripts/mesh2splat-win-build.ps1` | Windows | 调用官方 bat 构建 Release |
| `scripts/mesh2splat-macos-build.sh` | macOS | 安装依赖、应用补丁、CMake 构建 |
| `scripts/mesh2splat-macos-patch.sh` | macOS | 单独应用 CMake macOS 补丁 |

## 快速开始

1. 克隆 mesh2splat：`git clone https://github.com/electronicarts/mesh2splat.git`
2. **Windows**：按 [WINDOWS_SETUP.md](./WINDOWS_SETUP.md) 准备环境，然后 `cd mesh2splat && run_build_release.bat`
3. **macOS**：`brew install cmake glfw glew`，然后执行 `scripts/mesh2splat-macos-build.sh`
4. 运行可执行文件，加载 `.glb`，按 [MVP_ACCEPTANCE.md](./MVP_ACCEPTANCE.md) 验收
