# Mesh2Splat Windows 构建脚本
# 用法：在 mesh2splat 仓库根目录执行 .\scripts\mesh2splat-win-build.ps1
# 或：cd mesh2splat; ..\scripts\mesh2splat-win-build.ps1

$ErrorActionPreference = "Stop"
$mesh2splatRoot = if (Test-Path "run_build_release.bat") {
    Get-Location
} elseif (Test-Path "mesh2splat\run_build_release.bat") {
    Join-Path (Get-Location) "mesh2splat"
} elseif ($PSScriptRoot -and (Test-Path (Join-Path (Split-Path $PSScriptRoot -Parent) "mesh2splat\run_build_release.bat"))) {
    Join-Path (Split-Path $PSScriptRoot -Parent) "mesh2splat"
} else {
    $null
}
if (-not $mesh2splatRoot -or -not (Test-Path (Join-Path $mesh2splatRoot "run_build_release.bat"))) {
    Write-Error "请在 mesh2splat 仓库根目录执行，或先 git clone https://github.com/electronicarts/mesh2splat.git"
    exit 1
}
Set-Location $mesh2splatRoot

Write-Host "构建 Mesh2Splat (Release)..."
& cmd /c run_build_release.bat

if ($LASTEXITCODE -ne 0) {
    Write-Error "构建失败"
    exit $LASTEXITCODE
}

$exe = Join-Path $mesh2splatRoot "bin\Release\Mesh2Splat.exe"
if (Test-Path $exe) {
    Write-Host "构建成功: $exe"
    Write-Host "运行: $exe"
} else {
    Write-Warning "可执行文件未找到，请检查 bin\Release\"
}
