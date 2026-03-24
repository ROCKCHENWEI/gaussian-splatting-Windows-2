#!/usr/bin/env bash
# 在 mesh2splat 仓库根目录应用 macOS CMake 补丁
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
PATCH_FILE="$REPO_ROOT/patches/mesh2splat-cmake-macos.patch"

# 确定 mesh2splat 目录
if [[ -f "CMakeLists.txt" ]] && grep -q "Mesh2Splat" CMakeLists.txt 2>/dev/null; then
    MESH2SPLAT_DIR="$(pwd)"
elif [[ -d "$REPO_ROOT/mesh2splat" ]] && [[ -f "$REPO_ROOT/mesh2splat/CMakeLists.txt" ]]; then
    MESH2SPLAT_DIR="$REPO_ROOT/mesh2splat"
else
    echo "错误：请在 mesh2splat 仓库根目录执行，或确保 mesh2splat 子目录存在"
    echo "  cd mesh2splat && ../scripts/mesh2splat-macos-patch.sh"
    exit 1
fi

if [[ ! -f "$PATCH_FILE" ]]; then
    echo "错误：补丁文件不存在: $PATCH_FILE"
    exit 1
fi

cd "$MESH2SPLAT_DIR"
if patch -p1 --dry-run < "$PATCH_FILE" 2>/dev/null; then
    patch -p1 < "$PATCH_FILE"
    echo "补丁已成功应用"
else
    echo "补丁可能已应用或 CMakeLists.txt 已修改，请检查"
    echo "可手动参考: $PATCH_FILE"
    exit 1
fi
