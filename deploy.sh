#!/bin/bash
set -e

echo "🔨 建立 Docker 映像"
docker build -t vue-preview-app .

echo "🧹 停掉舊容器"
docker rm -f vue-preview-app || true

echo "🚀 啟動新容器（使用 3001 port）"
docker run -d --name vue-preview-app -p 3001:80 vue-preview-app
