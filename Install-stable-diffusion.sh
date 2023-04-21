#!/bin/bash

# Step 0
echo -e "\033[34m拉取 stable-diffusion-webui 项目\033[0m"

# Step 1
git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui.git

# Step 2
echo -e "\033[34m切换到 stable-diffusion-webui 目录\033[0m"
cd stable-diffusion-webui

# Step 3
echo -e "\033[34m新建 repositories 文件夹\033[0m"
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
echo -e "\033[34m请输入您要使用的端口号：\033[0m"
read PORT
COMMANDLINE_ARGS="--medvram --always-batch-cond-uncond --port $PORT" REQS_FILE="requirements.txt" python launch.py
