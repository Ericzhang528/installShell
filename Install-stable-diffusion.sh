#!/bin/bash

# Step 0
echo "拉取 stable-diffusion-webui 项目"

# Step 1
git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui.git

# Step 2
echo "切换到 stable-diffusion-webui 目录"
cd stable-diffusion-webui

# Step 3
echo "新建 repositories 文件夹"
mkdir repositories

# Step 4
echo "拉取 StableDiffusion 依赖模型"
git clone https://github.com/CompVis/stable-diffusion.git repositories/stable-diffusion

# Step 5
echo "拉取 taming-transformers 依赖模型"
git clone https://github.com/CompVis/taming-transformers.git repositories/taming-transformers

# Step 6
echo "拉取 CodeFormer 依赖模型"
git clone https://github.com/sczhou/CodeFormer.git repositories/CodeFormer

# Step 7
echo "请输入您要使用的端口号："
read PORT
COMMANDLINE_ARGS="--medvram --always-batch-cond-uncond --port $PORT" REQS_FILE="requirements.txt" python launch.py
