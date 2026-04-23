#!/usr/bin/env bash
# 一键发布脚本
# 用法:
#   ./publish.sh              使用默认 commit message
#   ./publish.sh "自定义说明"   使用自定义 commit message
#   ./publish.sh -p           只本地预览(不提交、不推送)
#   ./publish.sh -b           只本地 build 验证(不提交、不推送)

set -e

cd "$(dirname "$0")"

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

info()  { echo -e "${GREEN}==>${NC} $1"; }
warn()  { echo -e "${YELLOW}==>${NC} $1"; }
error() { echo -e "${RED}==>${NC} $1"; }

# 预览模式: 本地开服务器实时看效果
if [ "$1" = "-p" ] || [ "$1" = "--preview" ]; then
  info "启动本地预览 (http://localhost:8080)"
  node quartz/bootstrap-cli.mjs build -d MyBlog --serve
  exit 0
fi

# Build 验证模式: 只构建不推送,确认没报错
if [ "$1" = "-b" ] || [ "$1" = "--build" ]; then
  info "本地构建验证"
  node quartz/bootstrap-cli.mjs build -d MyBlog
  info "构建成功,产物在 public/"
  exit 0
fi

# 1. 检查是否有改动
if [ -z "$(git status --porcelain)" ]; then
  warn "没有检测到任何改动,退出"
  exit 0
fi

info "检测到以下改动:"
git status --short
echo

# 2. 本地 build 验证 (跑不通就不发)
info "本地构建验证..."
if ! node quartz/bootstrap-cli.mjs build -d MyBlog > /tmp/quartz-build.log 2>&1; then
  error "构建失败! 详见 /tmp/quartz-build.log"
  tail -30 /tmp/quartz-build.log
  exit 1
fi
info "构建成功"

# 3. commit message
if [ -n "$1" ]; then
  MSG="$1"
else
  MSG="Site updated: $(date '+%Y-%m-%d %H:%M:%S')"
fi

# 4. 提交并推送
info "提交: $MSG"
git add -A
git commit -m "$MSG"

info "推送到 main 分支..."
git push origin main

info "完成! GitHub Actions 会自动构建并部署到 www.cai-like.com"
info "查看部署状态: https://github.com/$(git config --get remote.origin.url | sed -E 's#.*github.com[:/](.+)\.git#\1#')/actions"
