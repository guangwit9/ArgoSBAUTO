# ArgoSBAUTO

自动化安装 ArgosB 并将数据推送到 GitLab 的一键部署脚本。

## 使用方法

将下面命令中的内容替换成你自己的参数，复制粘贴即可执行：

```bash
uuid=你的uuid \
vmpt=你的端口 \
agn=idx.witile.org \
agk=ey开头的密钥 \
TOKEN=你的GitLab访问Token \
GIT_USER=你的Git用户名 \
GIT_EMAIL=你的Git邮箱 \
PROJECT=你的GitLab项目名 \
bash <(curl -Ls https://raw.githubusercontent.com/guangwit9/ArgoSBAUTO/main/ArgoSBAUTO.sh)
