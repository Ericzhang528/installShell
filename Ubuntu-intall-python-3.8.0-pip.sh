#!/bin/bash

# Update package list
echo -e "\033[34mRunning apt-get update\033[0m"
sudo apt-get update

# Install dependencies for building Python
echo -e "\033[34mInstall dependencies for building Python\033[0m"
sudo apt-get install -y build-essential libffi-dev libssl-dev zlib1g-dev liblzma-dev libsqlite3-dev libreadline-dev libncursesw5-dev libgdbm-dev libc6-dev tk-dev libbz2-dev libffi-dev libssl-dev

# Download Python 3.8.0 source code
echo -e "\033[34mDownload Python 3.8.0 source code\033[0m"
wget https://www.python.org/ftp/python/3.8.0/Python-3.8.0.tgz

# Extract the tarball
echo -e "\033[34mExtract the tarball\033[0m"

tar -xvf Python-3.8.0.tgz

# Navigate to the Python source directory
echo -e "\033[34mNavigate to the Python source directory\033[0m"

cd Python-3.8.0

# Configure the build
echo -e "\033[34mConfigure the build\033[0m"

./configure --enable-optimizations

# Build and install Python
echo -e "\033[34mBuild and install Python\033[0m"
sudo make -j $(nproc) altinstall

# Install pip
echo -e "\033[34mInstall pip\033[0m"
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
sudo python3.8.0 get-pip.py

# Create a symlink from python to python3
echo -e "\033[34mCreate a symlink from python to python3\033[0m"
sudo ln -s /usr/local/bin/python3.8.0 /usr/local/bin/python

# Verify installation
echo -e "\033[34mVerify installation\033[0m"
python --version
pip --version
