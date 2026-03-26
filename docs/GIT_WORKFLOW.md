# Git 远程与推送约定

## 主代码仓（请推这里）

| 远程名 | 仓库 | 用途 |
|--------|------|------|
| `gaussian-splatting` | [ROCKCHENWEI/gaussian-splatting-Windows-2](https://github.com/ROCKCHENWEI/gaussian-splatting-Windows-2) | **默认推送目标**：含 `mesh2splat/` 源码、文档、脚本 |

```bash
git push gaussian-splatting mesh2splat-deploy-docs:main
# 或设置上游后
git push gaussian-splatting
```

## `origin`（seedance-calculator）

| 分支 | 说明 |
|------|------|
| `main` | 仅保留「已迁移」说明 README，**不要**用含 `mesh2splat/` 的提交覆盖 |
| `mesh2splat-deploy-docs` | 可选：与本开发分支同名的**备份分支**（若需与主仓双备份） |

```bash
# 仅当需要更新备份分支时
git push origin mesh2splat-deploy-docs
```

## 建议：默认上游指向 gaussian-splatting

在开发分支上执行一次：

```bash
git branch -u gaussian-splatting/main mesh2splat-deploy-docs
```

之后 `git status` 与 `git push` 以 **gaussian-splatting-Windows-2** 为准。
