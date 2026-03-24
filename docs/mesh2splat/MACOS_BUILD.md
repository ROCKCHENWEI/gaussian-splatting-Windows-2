# Mesh2Splat macOS 构建指南

官方仓库仅提供 Windows 构建说明，macOS 需自行处理 CMake `else()` 分支中的 `#todo`。以下为基于 Homebrew 依赖的构建流程。

## 1. 前置依赖

```bash
# Xcode Command Line Tools（如未安装）
xcode-select --install

# Homebrew 依赖（可选跳过自动更新以加快安装）
HOMEBREW_NO_AUTO_UPDATE=1 brew install cmake glfw glew
```

## 2. 克隆仓库

```bash
git clone https://github.com/electronicarts/mesh2splat.git
cd mesh2splat
```

## 3. 应用 CMake 与源码修改

**本仓库 `ugs/mesh2splat/`** 已包含 CMake 与源码可移植性修改，可直接跳到第 4 节构建。若使用上游纯净克隆，需先应用 CMake 补丁，并合入 [MACOS_SOURCE_CHANGES.md](./MACOS_SOURCE_CHANGES.md) 所列源码改动。

仅 CMake：在 mesh2splat 仓库根目录执行：

```bash
cd mesh2splat
../scripts/mesh2splat-macos-patch.sh
```

或手动应用：

```bash
cd mesh2splat
patch -p1 < ../patches/mesh2splat-cmake-macos.patch
```

若 mesh2splat 位于 ugs 外，将 `../patches/` 改为实际补丁路径。

## 4. 构建

```bash
mkdir -p build && cd build

# 使用 Homebrew 的 glfw/glew
cmake .. \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_PREFIX_PATH="$(brew --prefix glfw);$(brew --prefix glew)"

cmake --build . -j$(sysctl -n hw.ncpu)
```

## 5. 运行

可执行文件位于 `bin/Release/Mesh2Splat` 或 `build/Mesh2Splat`（依 CMake 输出目录配置）：

```bash
./bin/Release/Mesh2Splat
# 或
./build/Mesh2Splat
```

## 6. 常见问题

| 问题 | 处理方式 |
|------|----------|
| 找不到 glfw/glew | 确认 `brew --prefix glfw` 和 `brew --prefix glew` 有输出，并传入 `CMAKE_PREFIX_PATH` |
| 链接错误（undefined OpenGL） | 确保已应用补丁，使 `-framework OpenGL` 等被正确链接 |
| GLEW_STATIC 冲突 | 本仓库 CMake 仅在 `WIN32` 下定义 `GLEW_STATIC`，与 Homebrew 动态 GLEW 兼容 |
| 构建多次失败 | 建议使用 Parallels / VMware 或云 Windows 环境按 [BUILD_WINDOWS.md](./BUILD_WINDOWS.md) 构建 |
| Homebrew 安装失败 | 网络受限时 `brew install glfw glew` 可能失败，可尝试配置镜像或改用 Windows 环境 |

## 7. MVP 验收

与 Windows 相同，参见 [BUILD_WINDOWS.md](./BUILD_WINDOWS.md) 第 4 节。
