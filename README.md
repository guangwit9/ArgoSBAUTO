# ArgoSBAUTO

## 📦 项目简介

本项目是甬哥 [yonggekkk](https://github.com/yonggekkk) 的 [ArgoSB](https://github.com/yonggekkk/ArgoSB) 项目配套自动化工具。

通过本脚本，可一键完成：

1. 安装 ArgoSB 隧道服务；
2. 自动配置并上传订阅文件至 GitLab；
3. 自动跳过说明确认，**实现无人值守、零交互**自动化部署。

适用于自用节点定期刷新、服务器启动自动初始化、或小白用户简化流程。

**🔁 当前仅支持上传并覆盖 `jh.txt` 文件，Clash_Meta 与 sing-box 的适配功能尚在开发中，暂不可用。**

---


## 🛠 使用前准备

### 🔐 GitLab 设置提醒

  请在你的 GitLab 项目设置中完成以下配置：

  - 打开：`Settings → Repository → Protected branches`
  - 启用：**Allow force push**
  - 使用 Token 时，建议设置为最小权限（仅允许 push），并注意 Token 的有效期与保存方式

### 请提前准备以下信息（均为必填）：

- `uuid`：你的节点唯一标识
- `vmpt`：端口号
- `agn`：固定域名
- `agk`：以 `ey` 开头密钥
- `TOKEN`：你的GitLab 项目 Token
- `GIT_USER`：你的 GitLab 用户名
- `GIT_EMAIL`：你的 GitLab 邮箱
- `PROJECT`：你的 GitLab 项目名

---

## 🚀 一行命令自动部署（推荐）

带`nix`的方式："甬哥的reset之后不用再输命令的，等有时间我去瞅瞅怎么放进来"

```bash
nix=y uuid="你的uuid" vmpt="你的端口" agn="固定域名" agk="ey开头的密钥" \
TOKEN="你的token" GIT_USER="你的用户名" GIT_EMAIL="你的邮件" PROJECT="你的项目" \
bash <(curl -Ls https://raw.githubusercontent.com/guangwit9/ArgoSBAUTO/main/ArgoSBAUTO.sh)
```

将以下命令中的参数替换为你的实际信息，即可一键完成所有流程：

```bash
uuid="你的uuid" vmpt="你的端口" agn="固定域名" agk="ey开头的密钥" \
TOKEN="你的token" GIT_USER="你的用户名" GIT_EMAIL="你的邮件" PROJECT="你的项目" \
bash <(curl -Ls https://raw.githubusercontent.com/guangwit9/ArgoSBAUTO/main/ArgoSBAUTO.sh)
```

✅ 特点：

- 会自动 `sudo` 安装 ArgoSB
- 会跳过 Git 上传脚本的说明确认，直接上传 `jh.txt`
- 全流程无交互，适合远程自动运行

---

## 🧰 高级用法：自动脚本集成

你也可以将该工具集成至开机启动任务（如 systemd、rc.local），或自建的远程配置系统中，实现服务器重启后自动部署隧道。

建议使用如下结构：

```bash
#!/bin/bash
export uuid="你的uuid"
export vmpt="你的端口"
export agn="你的域名"
export agk="你的agk密钥"
export TOKEN="你的GitLab Token"
export GIT_USER="你的GitLab用户名"
export GIT_EMAIL="你的邮箱"
export PROJECT="你的GitLab项目名"

bash <(curl -Ls https://raw.githubusercontent.com/guangwit9/ArgoSBAUTO/main/ArgoSBAUTO.sh)
```

---

## 📚 技术来源与参考

- [yonggekkk/ArgoSB](https://github.com/yonggekkk/ArgoSB)
- [guangwit9/ArgoSBgit](https://github.com/guangwit9/ArgoSBgit)

本项目由 ChatGPT 辅助生成，结合原始 ArgoSB 与 GitLab 自动推送逻辑，帮助用户轻松构建一套全自动的订阅更新解决方案。

---

## 🧭 安全与隐私说明

- 本脚本完全本地执行，不上传、不回传、不存储任何你的配置或 GitLab 凭据。
- GitLab Token 仅用于你的 Git 操作，不会泄露给他人。
- 你可使用以下命令查看源码：

```bash
curl -Ls https://raw.githubusercontent.com/guangwit9/ArgoSBAUTO/main/ArgoSBAUTO.sh | less
```

建议使用最小权限 Token，必要时手动撤销以保证安全。
