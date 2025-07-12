#!/bin/bash

# 参数检查（nix 为可选）
: "${uuid:?必须提供 uuid}"
: "${vmpt:?必须提供 vmpt}"
: "${argo:?必须提供 argo}"
: "${agn:?必须提供 agn}"
: "${agk:?必须提供 agk}"
: "${TOKEN:?必须提供 TOKEN}"
: "${GIT_USER:?必须提供 GIT_USER}"
: "${GIT_EMAIL:?必须提供 GIT_EMAIL}"
: "${PROJECT:?必须提供 PROJECT}"

echo "[1/3] 安装 ArgosB..."

# 构建安装命令，只有在 nix 被设置时才加入
install_cmd="uuid='${uuid}' vmpt='${vmpt}' argo='${argo}' agn='${agn}' agk='${agk}'"
[ -n "${nix}" ] && install_cmd="nix='${nix}' $install_cmd"

sudo bash -c "$install_cmd bash <(curl -Ls https://raw.githubusercontent.com/yonggekkk/argosb/main/argosb.sh)"

sleep 5

echo "[2/3] 自动跳过 Git 上传脚本说明，开始上传..."
echo | TOKEN="${TOKEN}" GIT_USER="${GIT_USER}" GIT_EMAIL="${GIT_EMAIL}" PROJECT="${PROJECT}" \
bash <(curl -Ls https://raw.githubusercontent.com/guangwit9/ArgoSBgit/main/ArgoSBgit.sh)

echo "✅ 所有步骤完成。"
