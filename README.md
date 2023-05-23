# Common install auto shell for Linux

## Ubuntu instructions 
### Install python3.10 and pip in ubuntu system
Install python3.10 and pip please use: __install-python-3.10-pip.sh__
```bash
bash <(curl -s https://raw.githubusercontent.com/Ericzhang528/installShell/main/Ubuntu-Install-python-3.10-pip.sh)
```
### Install stable diffusion auto shell

#### step1
You must use ubuntu system, And you must use GPU Cloud.
The shell don't have install GPU driver, Please manually install the driver yourself.
#### step2
You must installed python3.10 and pip 23.x in your system.
If you don't install, please Run
```bash
bash <(curl -s https://raw.githubusercontent.com/Ericzhang528/installShell/main/Ubuntu-Install-python-3.10-pip.sh)
```
to install.
#### step3
Install stable diffusion auto shell please use: __Install-stable-diffusion.sh__
```bash
bash <(curl -s https://raw.githubusercontent.com/Ericzhang528/installShell/main/Ubuntu-Install-stable-diffusion.sh)
```
#### install models please read Install-models.text

### Install chatGLM-6B auto shell
This shell script must be executed in the ubuntu system, and has only been attempted on Tencent Cloud's GPU server. And you must first execute the __sudo su root__ command before executing this script. Otherwise, an error will be reported.

```bash
bash <(curl -s https://raw.githubusercontent.com/Ericzhang528/installShell/main/Ubuntu-Install-chatGLM-6B.sh)
```
