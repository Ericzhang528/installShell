# Linux常用自动安装脚本
## Ubuntu指南
### 在Ubuntu系统中安装Python3.10和pip
请使用以下命令安装Python3.10和pip：install-python-3.10-pip.sh
```bash
bash <(curl -s https://raw.githubusercontent.com/Ericzhang528/installShell/main/Ubuntu-Install-python-3.10-pip.sh)
```
### 安装稳定版扩散自动安装脚本
#### 步骤1
您必须使用Ubuntu系统，并且必须使用GPU云服务器。该脚本不会安装GPU驱动程序，请您自行手动安装驱动程序。

#### 步骤2
您必须在系统中安装Python3.10和pip 23.x版本。
如果尚未安装，请运行以下命令进行安装：

```bash
bash <(curl -s https://raw.githubusercontent.com/Ericzhang528/installShell/main/Ubuntu-Install-python-3.10-pip.sh)
```

#### 步骤3
请使用以下命令安装稳定版扩散自动安装脚本：Install-stable-diffusion.sh

```bash
bash <(curl -s https://raw.githubusercontent.com/Ericzhang528/installShell/main/Ubuntu-Install-stable-diffusion.sh)
```
安装模型，请参阅Install-models.text文件

### 安装chatGLM-6B自动安装脚本
在Centos系统中安装Python3.10和pip（请勿使用此有问题的版本。）
请使用以下命令安装Python3.10和pip：Centos7-Install-python3.10-pip.sh

```bash
bash <(curl -s https://raw.githubusercontent.com/Ericzhang528/installShell/main/Centos7-Install-python3.10-pip.sh)
```

## 常用脚本
### 在Linux系统中安装Screen

请使用以下命令安装Screen：linux-install-screen.sh

```bash
bash <(curl -s https://raw.githubusercontent.com/Ericzhang528/installShell/main/linux-install-screen.sh)
```
