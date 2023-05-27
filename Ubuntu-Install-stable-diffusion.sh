#!/bin/bash
echo -e "\033[34m是否安装 Python-3.10 和 pip？\033[0m"
echo -e "\033[34m此操作会将 Python 命令更换为 Python3 的环境，并将 pip 升级到最新版本。（yes/no）\033[0m"
read DownloadPython

case ${DownloadPython:0:1} in
    y|Y )
        echo -e "$DownloadPython"
        echo -e "bash <(curl -s https://raw.githubusercontent.com/Ericzhang528/installShell/main/Ubuntu-Install-python-3.10-pip.sh)"
        bash <(curl -s https://raw.githubusercontent.com/Ericzhang528/installShell/main/Ubuntu-Install-python-3.10-pip.sh)
        echo -e "\033[32m安装完成！！\033[0m"
        echo -e "\033[32m Please to key in ENTER to continue...\033[0m"
        read
        ;;
    * )
        echo -e "$DownloadPython"
        ;;
esac
# Step 0
echo -e "\033[34m拉取 stable-diffusion-webui 项目\033[0m"

# Step 1
echo -e "git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui.git"
git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui.git

# Step 2
echo -e "\033[34m切换到 stable-diffusion-webui 目录\033[0m"
echo -e "cd stable-diffusion-webui"
cd stable-diffusion-webui

# Step 3
echo -e "\033[34m新建 repositories 文件夹\033[0m"
echo -e "mkdir repositories"
mkdir repositories

# Step 4
echo -e "\033[34m拉取 StableDiffusion 依赖模型\033[0m"
git clone https://github.com/CompVis/stable-diffusion.git repositories/stable-diffusion

# Step 5
echo -e "\033[34m拉取 taming-transformers 依赖模型\033[0m"
git clone https://github.com/CompVis/taming-transformers.git repositories/taming-transformers

# Step 6
echo -e "\033[34m拉取 CodeFormer 依赖模型\033[0m"
git clone https://github.com/sczhou/CodeFormer.git repositories/CodeFormer

# Step 7
echo -e "\033[34m你是否要允许公网访问？（y/n）\033[0m"
read answer

echo -e "\033[34m请输入您要使用的端口号：\033[0m"
read PORT

if [[ $PORT == "" ]]; then
  PORT="8080"
fi

pip install torch==2.0.1 torchvision==0.15.2 --extra-index-url https://download.pytorch.org/whl/cu118

if [[ $answer =~ ^[Yy]$ ]]; then
  echo -e "\033[34m 启动Stable diffusion 按ENTER键继续，Ctrl+C退出 \033[0m"
  read
  COMMANDLINE_ARGS="--medvram --always-batch-cond-uncond --enable-insecure-extension-access  --port $PORT --listen" REQS_FILE="requirements.txt" python launch.py 
  $COMMANDLINE_ARGS $REQS_FILE
else
  COMMANDLINE_ARGS="--medvram --always-batch-cond-uncond --enable-insecure-extension-access --port $PORT" REQS_FILE="requirements.txt" python launch.py 
  $COMMANDLINE_ARGS $REQS_FILE
fi
