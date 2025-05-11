#!/bin/bash

# 检查必需参数
: "${uuid:?必须提供 uuid}"
: "${vmpt:?必须提供 vmpt}"
: "${agn:?必须提供 agn}"
: "${agk:?必须提供 agk}"
: "${TOKEN:?必须提供 TOKEN}"
: "${GIT_USER:?必须提供 GIT_USER}"
: "${GIT_EMAIL:?必须提供 GIT_EMAIL}"
: "${PROJECT:?必须提供 PROJECT}"

echo "[1/3] 切换到 root 权限..."
sudo -i

sleep 2

echo "[2/3] 执行 ArgosB 安装脚本..."
bash <(curl -Ls https://raw.githubusercontent.com/yonggekkk/argosb/main/argosb.sh)

sleep 5

echo "[3/3] 执行 Git 上传脚本..."
bash <(curl -Ls https://raw.githubusercontent.com/guangwit9/ArgoSBgit/main/ArgoSBgit.sh)

echo "✅ 所有步骤已完成。"
