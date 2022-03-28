#!/bin/bash

echo "Initial workspace: ${HOME}/fs_ws/"
# workspace : ${HOME}/fs_ws/
cd ${HOME}
if [ ! -d "fs_ws" ]; then
  mkdir fs_ws
  cd fs_ws
fi


function change_source {
echo "Change mirror source(Ubuntu 18.04) to USTC.edu.cn"

wget - https://raw.githubusercontent.com/autolaborcenter/fast_scripts/main/sources.list && \
mv /etc/apt/sources.list /etc/apt/sources.list.bak
mv sources.list /etc/apt/sources.list;
apt update;
}

function enable_mcp251x {
echo "Enable dtbo file for MCP251x CAN controller"

wget - https://raw.githubusercontent.com/autolaborcenter/fast_scripts/main/mcp251x/jetson-mcp251x.dtbo && \
cp jetson-mcp251x.dtbo /boot;
mv tegra210-p3448-0000-p3449-0000-a02-mcp251x.dtbo /boot/tegra210-p3448-0000-p3449-0000-a02-mcp251x.dtbo.bak
mv tegra210-p3448-0000-p3449-0000-a01-mcp251x.dtbo /boot/tegra210-p3448-0000-p3449-0000-a01-mcp251x.dtbo.bak
/opt/nvidia/jetson-io/config-by-hardware.py -n "MCP251x CAN Controller"

}

function test_mcp251x{
echo "Test MCP251x CAN controller "

sh -c "$(wget https://raw.githubusercontent.com/autolaborcenter/fast_scripts/main/cantest.sh -O -)"
}

function install_zsh {
echo "Install zsh & omz & config "

apt install zsh

sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions 
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting 

mv ~/.zshrc ~/.zshrc_bkp
wget - https://raw.githubusercontent.com/autolaborcenter/fast_scripts/main/.zshrc &&\
cp .zshrc ~/.zshrc;
source .zshrc
}

function install_utils {
echo "Install utils"

apt install nano nload htop
}
function install_nomachine {
echo "Install Nomachine"

wget - https://download.nomachine.com/download/7.8/Arm/nomachine_7.8.2_1_arm64.deb && \
dpkg -i nomachine*.deb;
}

PS3="Enter an option: "
select option in  "Change source"\
                  "Enable MCP251x"\
                  "Test MCP251x"\
                  "Install zsh"
                  "Install utils" \
                  "Install Nomachine" \
do
	case $option in
	"Change source")
		change_source ;;
	"Enable MCP251x")
		enable_mcp251x ;;
	"Test MCP251x")
		test_mcp251x ;;
	"Install zsh"）
		install_zsh ;;
	"Install utils"）
		install_utils ;;
	"Install Nomachine"）
		install_nomachine ;;
	*)
		clear
		echo "Sorry, wrong selection";;
	esac
done
clear

 
