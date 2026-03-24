# Mesh2Splat MVP 验收清单

依据 Mesh2Splat 本地部署 PRD 第 8 节验收清单。

## 验收步骤

### 1. 构建与启动

- [ ] **Windows**：`bin\Release\Mesh2Splat.exe` 或 `bin\Debug\Mesh2Splat.exe` 可正常启动
- [ ] **macOS**：`bin/Release/Mesh2Splat` 或 `build/Mesh2Splat` 可正常启动

### 2. 加载 GLB 模型

- [ ] 通过应用内文件对话框打开至少一个 `.glb` 文件
- [ ] 推荐样本（README 示例）：[SciFi Helmet](https://github.com/KhronosGroup/glTF-Sample-Assets/raw/main/Models/SciFiHelmet/glTF/SciFiHelmet.glb) — 直接下载链接
- [ ] 模型加载后无崩溃，可看到 3DGS 渲染画面

### 3. 采样密度调节

- [ ] 调节采样密度（Sampling density）滑块
- [ ] 滑块变化能观察到画面质量或密度变化

### 4. 可视化模式

- [ ] 至少验证 **两种** 可视化模式，例如：
  - albedo
  - normals
  - depth
  - geometry
  - overdraw
  - PBR properties
- [ ] 切换模式时渲染结果明显不同

### 5. 可选：性能与兼容性

- [ ] 可选开启「Enable mesh-gaussian depth test」
- [ ] 记录 GPU 型号、驱动版本与平均转换耗时，便于对标

## 通过标准

满足 1–4 即为 MVP 通过。第 5 项为加分项。
