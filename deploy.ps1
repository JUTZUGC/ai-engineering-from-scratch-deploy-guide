# AI Engineering from Scratch Skills CLI脚本（第三方指南）——按官方文档封装
# 官方文档：https://github.com/rohitg00/ai-engineering-from-scratch#quick-start
# 更新日期：2026-10-27
# 类型：script
$ErrorActionPreference = 'Stop'
Set-Location -Path $PSScriptRoot

if (-not (Get-Command git -ErrorAction SilentlyContinue)) { throw '需要先安装 Git' }
if (-not (Get-Command node -ErrorAction SilentlyContinue)) { throw '需要先安装 Node.js' }

New-Item -ItemType Directory -Force -Path .download | Out-Null
Set-Location -Path .download

npx.cmd -y skills add rohitg00/ai-engineering-from-scratch
npx.cmd -y skills list | Select-String 'ai-engineering'

Write-Host ''

Write-Host '部署完成：在客户端里用 /start-learning 开始，或直接让 Agent 调用该技能'
Write-Host '若结果异常或需要改配置，请参考官方文档：https://github.com/rohitg00/ai-engineering-from-scratch#quick-start'
