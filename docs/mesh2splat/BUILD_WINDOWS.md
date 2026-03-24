# Mesh2Splat Windows 构建与运行

前提：已完成 [WINDOWS_SETUP.md](./WINDOWS_SETUP.md) 中的环境准备。

## 1. 克隆仓库

```cmd
git clone https://github.com/electronicarts/mesh2splat.git
cd mesh2splat
```

## 2. 构建

在项目根目录执行：

**Release 构建（推荐，用于正式使用）：**
```cmd
run_build_release.bat
```

**Debug 构建（用于调试）：**
```cmd
run_build_debug.bat
```

## 3. 运行

- Release 可执行文件：`bin\Release\Mesh2Splat.exe`
- Debug 可执行文件：`bin\Debug\Mesh2Splat.exe`

双击运行，或在 `cmd` 中执行：
```cmd
bin\Release\Mesh2Splat.exe
```

## 4. MVP 验证步骤

1. 启动 Mesh2Splat
2. 通过应用内文件对话框打开 `.glb` 模型（如 [SciFi Helmet](https://github.com/KhronosGroup/glTF-Sample-Assets/tree/main/Models/SciFiHelmet/glTF)）
3. 调节采样密度滑块，观察质量变化
4. 切换可视化模式（albedo、normals、depth、PBR 等）
5. 可选：开启「Enable mesh-gaussian depth test」以测试遮挡
