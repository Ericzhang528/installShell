#!/bin/bash

# 检查当前用户是否为 root 用户
if [[ $EUID -eq 0 ]]; then
   echo "请不要使用 root 用户运行此脚本！"
   exit 1
fi

# 设置安装目录和文件名
INSTALL_DIR="$HOME/miniconda"
INSTALL_SCRIPT="Miniconda3-latest-Linux-x86_64.sh"

# 下载 Miniconda 安装脚本
wget https://repo.anaconda.com/miniconda/$INSTALL_SCRIPT -O $INSTALL_SCRIPT

# 运行安装脚本
bash $INSTALL_SCRIPT -b -p $INSTALL_DIR

# 配置环境变量
echo "export PATH=\"$INSTALL_DIR/bin:\$PATH\"" >> ~/.bashrc
source ~/.bashrc

# 删除安装脚本
rm $INSTALL_SCRIPT

echo "Miniconda 安装完成！请重新打开终端或执行 'source ~/.bashrc' 生效。"
