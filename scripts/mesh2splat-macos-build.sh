#!/usr/bin/env bash
# Mesh2Splat macOS 一键构建脚本
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

# 确定 mesh2splat 目录
if [[ -d "$REPO_ROOT/mesh2splat" ]] && [[ -f "$REPO_ROOT/mesh2splat/CMakeLists.txt" ]]; then
    MESH2SPLAT_DIR="$REPO_ROOT/mesh2splat"
else
    echo "错误：未找到 mesh2splat 目录，请先执行:"
    echo "  git clone https://github.com/electronicarts/mesh2splat.git"
    exit 1
fi

# 检查依赖
for cmd in cmake brew; do
    if ! command -v $cmd &>/dev/null; then
        echo "错误：未找到 $cmd，请安装: brew install cmake"
        exit 1
    fi
done

if ! brew list glfw &>/dev/null || ! brew list glew &>/dev/null; then
    echo "安装 Homebrew 依赖: glfw, glew"
    brew install glfw glew
fi

# 应用补丁（若尚未应用）
cd "$MESH2SPLAT_DIR"
if ! grep -q "APPLE" CMakeLists.txt 2>/dev/null; then
    echo "应用 macOS 补丁..."
    "$SCRIPT_DIR/mesh2splat-macos-patch.sh" || true
fi

# 构建
mkdir -p build
cd build
CMAKE_PREFIX="$(brew --prefix glfw);$(brew --prefix glew)"
cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_PREFIX_PATH="$CMAKE_PREFIX"
cmake --build . -j"$(sysctl -n hw.ncpu)"

echo ""
echo "构建完成。可执行文件: $MESH2SPLAT_DIR/bin/Release/Mesh2Splat 或 build/Mesh2Splat"
if [[ -f "$MESH2SPLAT_DIR/bin/Release/Mesh2Splat" ]]; then
    echo "运行: $MESH2SPLAT_DIR/bin/Release/Mesh2Splat"
fi
