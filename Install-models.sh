#!/bin/bash

echo -e "\033[34m你是否要安装DreamShaper？（y/n）\033[0m"
read InstallDreamShaper

if [[ $InstallDreamShaper =~ ^[Yy]$ ]]; then
    timeout 3 curl -OJL https://civitai.com/api/download/models/43888
fi

echo -e "\033[34m你是否要安装 MeinaMix？（y/n）\033[0m"
read InstallMeinaMix

if [[ $InstallMeinaMix =~ ^[Yy]$ ]]; then
    timeout 3 curl -OJL https://civitai.com/api/download/models/46137
fi

echo -e "\033[34m你是否要安装 realdosmix？（y/n）\033[0m"
read realdosmix

if [[ $realdosmix =~ ^[Yy]$ ]]; then
    timeout 3 curl -OJL https://civitai.com/api/download/models/43888
fi

echo -e "\033[34m你是否要安装 GuoFeng3？（y/n）\033[0m"
read GuoFeng3

if [[ $GuoFeng3 =~ ^[Yy]$ ]]; then
    timeout 3 curl -OJL https://civitai.com/api/download/models/36644
fi

echo -e "\033[34m你是否要安装 LOFI？（y/n）\033[0m"
read LOFI

if [[ $LOFI =~ ^[Yy]$ ]]; then
    timeout 3 curl -OJL https://civitai.com/api/download/models/44882
fi
