#!/bin/bash

if [[ -f /etc/os-release ]]; then
    # 从 /etc/os-release 获取操作系统信息
    source /etc/os-release

    # 根据操作系统进行包管理器的安装
    if [[ $ID == "ubuntu" || $ID == "debian" || $ID_LIKE == "debian" ]]; then
        sudo apt update
        sudo apt install screen
    elif [[ $ID == "centos" || $ID == "fedora" || $ID == "rhel" ]]; then
        sudo dnf update
        sudo dnf install screen
    elif [[ $ID == "opensuse" || $ID == "suse" ]]; then
        sudo zypper refresh
        sudo zypper install screen
    elif [[ $ID == "arch" || $ID_LIKE == "arch" ]]; then
        sudo pacman -Syu screen
    else
        echo "无法确定您的操作系统或不支持自动安装，请手动安装 screen。"
        exit 1
    fi
else
    echo "无法确定您的操作系统或不支持自动安装，请手动安装 screen。"
    exit 1
fi

# 显示安装结果
screen --version
