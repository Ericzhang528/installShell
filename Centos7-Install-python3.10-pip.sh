#!/bin/bash

# Update package list
echo -e "\033[34mRunning yum update\033[0m"
sudo yum update -y

# Install dependencies for building Python
echo -e "\033[34mInstall dependencies for building Python\033[0m"
sudo yum install -y gcc openssl-devel bzip2-devel libffi-devel zlib-devel readline-devel sqlite-devel

# Download Python 3.10 source code
echo -e "\033[34mDownload Python 3.10 source code\033[0m"
wget https://www.python.org/ftp/python/3.10.0/Python-3.10.0.tgz

# Extract the tarball
echo -e "\033[34mExtract the tarball\033[0m"
tar -xvf Python-3.10.0.tgz

# Navigate to the Python source directory
echo -e "\033[34mNavigate to the Python source directory\033[0m"
cd Python-3.10.0

# Configure the build
echo -e "\033[34mConfigure the build\033[0m"
./configure --enable-optimizations

# Build and install Python
echo -e "\033[34mBuild and install Python\033[0m"
sudo make -j$(nproc) altinstall

# Install pip
echo -e "\033[34mInstall the latest version of pip\033[0m"
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
sudo python3.10 get-pip.py

# Create symlinks for python and pip commands
echo -e "\033[34mCreate symlinks for python and pip commands\033[0m"
sudo ln -sf /usr/local/bin/python3.10 /usr/local/bin/python
sudo ln -sf /usr/local/bin/pip3.10 /usr/local/bin/pip

# Verify installation
echo -e "\033[34mVerify installation\033[0m"
python --version
pip --version
