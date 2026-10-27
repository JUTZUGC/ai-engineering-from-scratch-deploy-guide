#!/usr/bin/env bash
set -euo pipefail
# AI Engineering from Scratch Skills CLI脚本（第三方指南）——按官方文档封装
# 官方文档：https://github.com/rohitg00/ai-engineering-from-scratch#quick-start
# 更新日期：2026-10-27
# 类型：script
cd "$(dirname "${BASH_SOURCE[0]}")"

command -v git >/dev/null 2>&1 || { echo "需要先安装 Git"; exit 1; }
command -v node >/dev/null 2>&1 || { echo "需要先安装 Node.js"; exit 1; }

mkdir -p .download
cd .download

npx -y skills add rohitg00/ai-engineering-from-scratch
npx -y skills list | grep -qi 'ai-engineering' && echo '课程技能已安装' || echo '未检测到，重跑安装并选择客户端'

echo ""

echo "部署完成：在客户端里用 /start-learning 开始，或直接让 Agent 调用该技能"
echo "若结果异常或需要改配置，请参考官方文档：https://github.com/rohitg00/ai-engineering-from-scratch#quick-start"
