#!/bin/bash

echo "Initial workspace: ${HOME}/fs_ws/"
# workspace : ${HOME}/fs_ws/
cd ${HOME}
if [ ! -d "fs_ws" ]; then
  mkdir fs_ws
  cd fs_ws
fi



HEIGHT=15
WIDTH=40
CHOICE_HEIGHT=4
BACKTITLE="Backtitle here"
TITLE="Title here"
MENU="Choose one of the following options:"


OPTIONS=(1 "Change source"          2 "Update PL2303"          3 "Enable MCP251x"          4 "Test socket CAN"          5 "Install zsh"          6 "Install utils"          7 "Install Nomachine")

CHOICE=$(dialog --clear \
                --backtitle "$BACKTITLE" \
                --title "$TITLE" \
                --menu "$MENU" \
                $HEIGHT $WIDTH $CHOICE_HEIGHT \
                "${OPTIONS[@]}" \
                2>&1 >/dev/tty)

clear
case $CHOICE in
        1)
            change_source
            ;;
        2)
            update_pl2303
            ;;
        3)
            enable_mcp251x
            ;;
        4)
            test_socket_can
            ;;
        5)
            install_zsh
            ;;
        6)
            install_utils
            ;;
        7)
            install_nomachine
            ;;
esac



function change_source {
  echo "Change mirror source(Ubuntu 18.04) to USTC.edu.cn"

  wget - https://raw.githubusercontent.com/autolaborcenter/fast_scripts/main/sources.list && \
  mv /etc/apt/sources.list /etc/apt/sources.list.bak
  mv sources.list /etc/apt/sources.list;
  apt update;
}
function update_pl2303{
  echo "Update UNITEK's PL2303 driver"

  wget - https://raw.githubusercontent.com/autolaborcenter/fast_scripts/main/pl2303/pl2303.ko && \
  rmmod /lib/modules/4.9.253-tegra/kernel/drivers/usb/serial
  cp pl2303.ko /lib/modules/4.9.253-tegra/kernel/drivers/usb/serial/
  insmod /lib/modules/4.9.253-tegra/kernel/drivers/usb/serial
}
function enable_mcp251x {
  echo "Enable dtbo file for MCP251x CAN controller"

  wget - https://raw.githubusercontent.com/autolaborcenter/fast_scripts/main/mcp251x/jetson-mcp251x.dtbo && \
  cp jetson-mcp251x.dtbo /boot;
  mv tegra210-p3448-0000-p3449-0000-a02-mcp251x.dtbo /boot/tegra210-p3448-0000-p3449-0000-a02-mcp251x.dtbo.bak
  mv tegra210-p3448-0000-p3449-0000-a01-mcp251x.dtbo /boot/tegra210-p3448-0000-p3449-0000-a01-mcp251x.dtbo.bak
  /opt/nvidia/jetson-io/config-by-hardware.py -n "MCP251x CAN Controller"

}

function test_socket_can{
  echo "Test socket CAN "

  sh -c "$(wget https://raw.githubusercontent.com/autolaborcenter/fast_scripts/main/test_socket_can.sh -O -)"
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


 