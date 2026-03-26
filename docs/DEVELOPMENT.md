# 深化开发路线图（建议）

当前仓库定位为 **EA Mesh2Splat 的 fork + 文档 + 构建脚本**，以下为可演进方向，按优先级与工作量排序。

## 短期（维护）

- [ ] 跟踪上游 [electronicarts/mesh2splat](https://github.com/electronicarts/mesh2splat) 发版，合并 tag 并解决与本 fork 的 `CMakeLists.txt` / `utils` 冲突。
- [ ] 在 `mesh2splat/` 内用 `clang-format` / `.clang-format` 统一风格（需与上游 diff 最小化）。
- [ ] Windows：补充 `CMake` 命令行构建说明（不依赖 bat），便于 CI。

## 中期（体验）

- [ ] GitHub Actions：自托管或云 Windows runner 跑 `run_build_release.bat`（或 CMake+Ninja）做**冒烟编译**。
- [ ] 导出 3DGS 为通用 `.ply` / `.splat` 的文档化说明（若上游已支持，则只补中文步骤）。
- [ ] 案例资源：在 `docs/` 放小型测试用 `.glb` 链接清单（不存大文件进仓库）。

## 长期（方向探索）

- [ ] **不**在浏览器内移植完整 Mesh2Splat；若需「在线看高斯」，采用独立 Web 查看器 + 导出数据。
- [ ] 与 DCC 工具链对接（Blender 导出 glb → 本工具）的流程图与脚本。

## 参与贡献

上游为 EA 开源，贡献需 [CLA](https://github.com/electronicarts/mesh2splat)。本 fork 的文档与脚本改进可直接在本仓库提 PR。
