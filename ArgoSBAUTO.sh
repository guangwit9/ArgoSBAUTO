#!/bin/bash

# 必需参数检查
: "${uuid:?必须提供 uuid}"
: "${vmpt:?必须提供 vmpt}"
: "${agn:?必须提供 agn}"
: "${agk:?必须提供 agk}"
: "${TOKEN:?必须提供 TOKEN}"
: "${GIT_USER:?必须提供 GIT_USER}"
: "${GIT_EMAIL:?必须提供 GIT_EMAIL}"
: "${PROJECT:?必须提供 PROJECT}"

echo "[1/3] 安装 ArgosB（需要 sudo 权限）..."
sudo bash -c "uuid='${uuid}' vmpt='${vmpt}' agn='${agn}' agk='${agk}' bash <(curl -Ls https://raw.githubusercontent.com/yonggekkk/argosb/main/argosb.sh)"

echo "[2/3] 等待 5 秒..."
sleep 5

echo "[3/3] 上传至 GitLab..."
TOKEN="${TOKEN}" GIT_USER="${GIT_USER}" GIT_EMAIL="${GIT_EMAIL}" PROJECT="${PROJECT}" \
bash <(curl -Ls https://raw.githubusercontent.com/guangwit9/ArgoSBgit/main/ArgoSBgit.sh)

echo "✅ 所有步骤完成。"
