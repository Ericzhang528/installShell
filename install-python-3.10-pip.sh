#!/bin/bash

# Update package list
sudo apt-get update

# Install dependencies for building Python
sudo apt-get install -y build-essential libffi-dev libssl-dev zlib1g-dev liblzma-dev libsqlite3-dev libreadline-dev libncursesw5-dev libgdbm-dev libc6-dev tk-dev libbz2-dev libffi-dev libssl-dev

# Download Python 3.10 source code
wget https://www.python.org/ftp/python/3.10.0/Python-3.10.0.tgz

# Extract the tarball
tar -xvf Python-3.10.0.tgz

# Navigate to the Python source directory
cd Python-3.10.0

# Configure the build
./configure --enable-optimizations

# Build and install Python
sudo make -j $(nproc) altinstall

# Install pip
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
sudo python3.10 get-pip.py

# Create a symlink from python to python3
sudo ln -s /usr/local/bin/python3.10 /usr/local/bin/python

# Verify installation
python --version
pip --version
