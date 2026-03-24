# Mesh2Splat 克隆与构建总览

## 前置条件

- **Windows**：完成 [WINDOWS_SETUP.md](./WINDOWS_SETUP.md)
- **macOS**：完成 [MACOS_BUILD.md](./MACOS_BUILD.md) 中依赖安装

## 克隆仓库

```bash
git clone https://github.com/electronicarts/mesh2splat.git
cd mesh2splat
```

若网络受限，可尝试镜像或配置代理后重试。

## 构建方式

| 平台 | 方式 |
|------|------|
| Windows | `run_build_release.bat` 或 `scripts\mesh2splat-win-build.ps1` |
| macOS | 见 [MACOS_BUILD.md](./MACOS_BUILD.md) |

## 可执行文件位置

- Windows Release: `bin/Release/Mesh2Splat.exe`
- Windows Debug:   `bin/Debug/Mesh2Splat.exe`
- macOS: `bin/Release/Mesh2Splat` 或 `build/Mesh2Splat`
