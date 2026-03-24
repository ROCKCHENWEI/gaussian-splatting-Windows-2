# macOS 源码级可移植性修改说明

上游 [mesh2splat](https://github.com/electronicarts/mesh2splat) 以 Windows 为主；本工作区内的 `mesh2splat/` 在应用 [mesh2splat-cmake-macos.patch](../../patches/mesh2splat-cmake-macos.patch) 等价修改之外，还包含以下改动，方可在 Apple Clang 上完整通过编译。

| 文件 | 说明 |
|------|------|
| `CMakeLists.txt` | `APPLE` 下用 `pkg-config` 链接 glfw/glew 与 OpenGL/Cocoa 等 framework；`GLFW` 目录大小写；`GLEW_STATIC` 仅 `WIN32` |
| `src/utils/utils.hpp` | `crtdbg.h` / `windows.h` 仅 `_WIN32`；非 Windows 使用 `<filesystem>` 与 `namespace fs = std::filesystem` |
| `src/utils/utils.cpp` | `getExecutablePath()`：`__APPLE__` 用 `_NSGetExecutablePath` + `realpath`；Linux 用 `/proc/self/exe` |
| `src/utils/glUtils.hpp` | `fs` 别名在非 Windows 下指向 `std::filesystem` |
| `src/imGuiUi/ImGuiUi.hpp` | 类内声明去掉非法的 `ImGuiUI::` 前缀（Clang 报 extra qualification） |

若你从上游全新 `git clone`，需将上述修改合入后再按 [MACOS_BUILD.md](./MACOS_BUILD.md) 构建。

验证构建产物：

```bash
ls -la mesh2splat/bin/Release/Mesh2Splat
./mesh2splat/bin/Release/Mesh2Splat
```
