# Mesh2Splat Windows 最快测试（约 10 分钟）

目标：在本机跑出官方 [electronicarts/mesh2splat](https://github.com/electronicarts/mesh2splat)，加载 `.glb` 做功能验证。

## 1. 环境（一次性）

1. 安装 [Visual Studio 2022](https://visualstudio.microsoft.com/)，工作负载勾选 **使用 C++ 的桌面开发**。
2. 安装 [CMake 3.21+](https://cmake.org/download/)，安装时勾选 **Add CMake to PATH**。
3. 确认显卡驱动较新（需支持 OpenGL）。

## 2. 克隆与构建

在 **cmd** 或 **PowerShell** 中：

```cmd
git clone https://github.com/electronicarts/mesh2splat.git
cd mesh2splat
run_build_release.bat
```

成功后运行：

```cmd
bin\Release\Mesh2Splat.exe
```

（可选）若本仓库 `seedance-calculator` 已 clone 到同级目录，也可在 `mesh2splat` 根目录执行：

```powershell
..\seedance-calculator\scripts\mesh2splat-win-build.ps1
```

## 3. 快速验收

1. 下载样本 [SciFiHelmet.glb](https://github.com/KhronosGroup/glTF-Sample-Assets/raw/main/Models/SciFiHelmet/glTF/SciFiHelmet.glb)。
2. 在应用内打开该 `.glb`。
3. 拖动 **采样密度** 滑块，切换 **albedo / normals** 等视图。

更完整说明见 [WINDOWS_SETUP.md](./WINDOWS_SETUP.md)、[BUILD_WINDOWS.md](./BUILD_WINDOWS.md)、[MVP_ACCEPTANCE.md](./MVP_ACCEPTANCE.md)。
