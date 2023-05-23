#!/bin/bash

echo -e "\033[34m 当前脚本由CloudSeaSky Studio提供 \033[0m"
echo -e "\033[34m 本脚本仅适用于腾讯云的Ubuntu系统 \033[0m"
echo -e "\033[34m 其他系统暂未尝试，本脚本仅适用于海外服务器 \033[0m"
echo -e "\033[34m【0】Screen 安装，【1】默认安装\033[0m"
echo -e "\033[34m【2】启动（默认端口），【3】自定义端口启动\033[0m"
echo -e "\033[34m【4】安装Python 3.10和最新版本pip并连接到python和pip命令\033[0m"
echo -e "\033[34m 如若未安装请先安装ChatGLM \033[0m"
echo -e "\033[34m 如果是Screen安装请输入screen -r GLM 然后按Ctrl+C终止进程 \033[0m"
echo -e "\033[34m 请输入0 - 4执行脚本 \033[0m"
read -p "请输入：" num

# 检查命令是否存在
if ! command -v python &> /dev/null || ! command -v pip &> /dev/null; then
  echo "Python或pip命令未找到，请确保已安装Python并正确设置环境变量"
  exit 1
fi
# 比较版本号
function compare_versions {
    local version1=$1
    local version2=$2
    local IFS=.
    local arr1=($version1)
    local arr2=($version2)

    for ((i=0; i<${#arr1[@]}; i++)); do
        if [[ ${arr1[i]} -lt ${arr2[i]} ]]; then
            echo -1
            return
        elif [[ ${arr1[i]} -gt ${arr2[i]} ]]; then
            echo 1
            return
        fi
    done

    echo 0
}

# 获取当前Python版本
current_python_version=$(python --version 2>&1 | awk '{print $2}')

# 获取当前pip版本
current_pip_version=$(pip --version | awk '{print $2}')

# 定义所需的Python版本和pip版本
required_python_version="3.10"
required_pip_version="23.0.2"

# 检查Python版本是否大于等于所需版本
python_version_check=$(compare_versions $current_python_version $required_python_version)

# 检查pip版本是否大于等于所需版本
pip_version_check=$(compare_versions $current_pip_version $required_pip_version)



if [[ $num == 0 || $num == 1 || $num == 4 ]]; then
  echo -e "\033[34m 检测Python版本和Pip版本 \033[0m"
  if [[ $python_version_check -ge 0 && $pip_version_check -ge 0  ]]; then
    echo "Python版本和pip版本符合要求，继续执行下一步操作..."
    if [[ $num == 4 ]]; then
      echo "Python版本："
      python --version
      echo "Pip版本："
      pip --version
      echo "退出脚本..."
    fi
  else
    echo "Python版本或pip版本低于要求，是否执行安装脚本？（y/n）"
    read -r answer
    if [[ $answer =~ ^[Yy]$ ]]; then
      echo "执行安装脚本..."
      bash <(curl -s https://raw.githubusercontent.com/Ericzhang528/installShell/main/Ubuntu-Install-python-3.10-pip.sh)
    else
      echo "已取消安装，退出脚本"
      exit 0
    fi
  fi
fi

if [[ $num == 0 ]]; then
  echo -e "\033[34m 检测Python版本和Pip版本 \033[0m"
  if [[ $python_version_check -ge 0 && $pip_version_check -ge 0  ]]; then
    echo "Python版本和pip版本符合要求，继续执行下一步操作..."
  else
    echo "Python版本或pip版本低于要求，是否执行安装脚本？（y/n）"
    read -r answer
    if [[ $answer =~ ^[Yy]$ ]]; then
      echo "执行安装脚本..."
       bash <(curl -s https://raw.githubusercontent.com/Ericzhang528/installShell/main/Ubuntu-Install-python-3.10-pip.sh)
    else
      echo "已取消安装，退出脚本"
      exit 0
    fi
  fi
  echo "执行Screen安装操作"
  echo -e "\033[34m 检测Screen安装 \033[0m"
  # 检查 screen 是否已安装
  if command -v screen &> /dev/null; then
    echo -e "\033[34m screen 已安装，执行下一步操作... \033[0m"
    # 执行下一步的 Bash 文件或命令
    echo -e "\033[34m 创建GLM的Screen窗口 \033[0m"
    screen -dmS GLM bash -c 'echo "This is running in the GLM screen session"'
    echo -e "\033[34m GLM的Screen窗口创建完成，执行下一步操作... \033[0m"
  else
    echo -e "\033[34m screen 未安装，正在执行安装步骤... \033[0m"
    apt update
    apt install screen
    screen --version
    echo -e "\033[34m screen 安装完成，执行下一步操作... \033[0m"
    echo -e "\033[34m 创建GLM的Screen窗口 \033[0m"
    screen -dmS GLM
    echo -e "\033[34m GLM的Screen窗口创建完成，执行下一步操作... \033[0m"
  fi
elif [[ $num == 1 ]]; then
  echo "执行默认安装操作"
  # 执行默认安装脚本的命令
elif [[ $num == 2 ]]; then
  echo "执行重新启动（默认端口）操作"
  # 执行重新启动（默认端口）脚本的命令
  echo "是否运行Screen GLM？（y/n）"
  read -r answer
  if [[ $answer =~ ^[Yy]$ ]]; then

    if  'screen -ls | grep -q GLM'; then
        echo "已检测到名为 GLM 的 Screen，切换到该 Screen 的 Bash 脚本..."
        screen -r GLM
    else
        echo "未检测到名为 GLM 的 Screen，创建 GLM 并执行下一步操作..."
        screen -dmS GLM
    fi
  else
    echo "已取消运行Screen GLM"

  fi
  cd ChatGLM-6B
  while true; do
    echo -e "\033[34m 请输入端口号：\033[0m"
    read -p "请输入：" port

    if [[ $port =~ ^[0-9]+$ ]]; then
      break
    else
      echo -e "\033[31m 端口号无效，请重新输入 \033[0m"
    fi
  done

  python streamlit run ./web_demo2.py --server.port $port --server.address 0.0.0.0
  # 执行Python 3.10和最新版本pip安装脚本的命令
  echo "http://0.0.0.0:$port"
elif [[ $num == 3 ]]; then
  echo "执行重新启动（默认端口）操作"
  # 执行重新启动（默认端口）脚本的命令
  echo "是否运行Screen GLM？（y/n）"
  read -r answer
  if [[ $answer =~ ^[Yy]$ ]]; then
    if screen -ls | grep -q GLM; then
      echo "已检测到名为 GLM 的 Screen，切换到该 Screen 的 Bash 脚本..."
      screen -r GLM
    else
      echo "未检测到名为 GLM 的 Screen，创建 GLM 并执行下一步操作..."
      screen -dmS GLM bash -c 'echo "This is running in the GLM screen session"'
    fi
  else
    echo "已取消运行Screen GLM"
  fi
  cd ChatGLM-6B
  while true; do
    echo -e "\033[34m 请输入端口号：\033[0m"
    read -p "请输入：" port

    if [[ $port =~ ^[0-9]+$ ]]; then
      break
    else
      echo -e "\033[31m 端口号无效，请重新输入 \033[0m"
    fi
  done

  python streamlit run ./web_demo2.py --server.port $port --server.address 0.0.0.0
  # 执行Python 3.10和最新版本pip安装脚本的命令
  echo "http://0.0.0.0:$port"
else
  echo "输入无效，退出脚本"
  exit 0
fi

if [[ $num == 1 || $num == 0 ]]; then
  echo -e "\033[34m 开始下载GLM \033[0m"
  echo -e "git clone https://github.com/Ericzhang528/ChatGLM-6B.git"
  git clone https://github.com/Ericzhang528/ChatGLM-6B.git
  echo -e "\033[34m GLM下载完成，执行下一步操作... \033[0m"
  cd ChatGLM-6B
  if grep -q "chardet" requirements.txt && grep -q "streamlit" requirements.txt && grep -q "streamlit-chat" requirements.txt; then
    echo "requirements.txt 文件已包含 chardet、streamlit 和 streamlit-chat 依赖项，继续执行下一步操作..."
    # 执行下一步的 Bash 脚本或命令
  else
    echo "requirements.txt 文件缺少 chardet、streamlit 或 streamlit-chat 依赖项，正在添加..."
    echo "chardet" >> requirements.txt
    echo "streamlit" >> requirements.txt
    echo "streamlit-chat" >> requirements.txt
    echo "依赖项已添加至 requirements.txt 文件"
    # 执行下一步的 Bash 脚本或命令
  fi
  echo -e " pip install -r requirements.txt"
  pip install -r requirements.txt
  echo -e "\033[34m 开始运行ChatGLM-6B \033[0m"
  while true; do
    echo -e "\033[34m 请输入端口号：\033[0m"
    read -p "请输入：" port

    if [[ $port =~ ^[0-9]+$ ]]; then
      break
    else
      echo -e "\033[31m 端口号无效，请重新输入 \033[0m"
    fi
  done

  python streamlit run ./web_demo2.py --server.port $port --server.address 0.0.0.0
else
  echo -e "\033[34m 退出脚本 \033[0m"
  exit 0
fi


