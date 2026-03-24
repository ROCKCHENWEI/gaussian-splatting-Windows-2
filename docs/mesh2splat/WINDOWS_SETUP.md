# Mesh2Splat Windows 本地部署指南

按 [electronicarts/mesh2splat](https://github.com/electronicarts/mesh2splat) 官方 README 整理的 Windows 环境准备与验证步骤。

## 1. 依赖安装

### 1.1 Visual Studio 2019 或 2022

1. 下载：<https://visualstudio.microsoft.com/downloads/>
2. 安装时勾选工作负载：**使用 C++ 的桌面开发（Desktop development with C++）**
3. 确认包含：MSVC、Windows SDK、C++ CMake 工具（可选，见下）

### 1.2 CMake ≥ 3.21.1

- **重要**：使用 VS2022 时必须 CMake ≥ 3.21.1，否则无法识别生成器
- 安装方式任选其一：
  - 使用 Visual Studio 自带的 CMake（需安装「使用 C++ 的桌面开发」）
  - 独立安装：<https://cmake.org/download/>
- 验证：`cmake --version` 输出 ≥ 3.21.1

### 1.3 OpenGL 兼容 GPU 与驱动

- 确保显卡驱动为最新（NVIDIA / AMD / Intel 官网）
- 系统需支持 OpenGL 4.x（几何着色器、SSBO 等）

## 2. 环境自检清单

运行以下命令确认环境就绪：

```cmd
:: 检查 CMake
cmake --version

:: 检查 Visual Studio（以 VS2022 为例）
where cl
```

若 `cl` 未找到，打开「x64 Native Tools Command Prompt for VS 2022」后再试，或从 VS 安装目录执行 `vcvars64.bat`。

## 3. 后续步骤

完成上述安装后，执行 [BUILD_WINDOWS.md](./BUILD_WINDOWS.md) 中的构建与运行步骤。
