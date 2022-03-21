#!/bin/bash

echo "Deploy environment quickly for jetson nano (Jetpack 4.6.1)"


echo "1.Initial workspace"
# workspace : ${HOME}/fast_scripts/
cd ${HOME}
if [ ! -d "fast_scripts" ]; then
  mkdir fast_scripts
  cd fast_scripts
fi


echo "2.Change mirror source(Ubuntu 18.04) to USTC.edu.cn"

mv /etc/apt/sources.list /etc/apt/sources.list.bak

cat >/etc/apt/sources.list<<EOF
# 默认注释了源码仓库，如有需要可自行取消注释
deb https://mirrors.ustc.edu.cn/ubuntu-ports/ bionic main restricted universe multiverse
# deb-src https://mirrors.ustc.edu.cn/ubuntu-ports/ bionic main main restricted universe multiverse
deb https://mirrors.ustc.edu.cn/ubuntu-ports/ bionic-updates main restricted universe multiverse
# deb-src https://mirrors.ustc.edu.cn/ubuntu-ports/ bionic-updates main restricted universe multiverse
deb https://mirrors.ustc.edu.cn/ubuntu-ports/ bionic-backports main restricted universe multiverse
# deb-src https://mirrors.ustc.edu.cn/ubuntu-ports/ bionic-backports main restricted universe multiverse
deb https://mirrors.ustc.edu.cn/ubuntu-ports/ bionic-security main restricted universe multiverse
# deb-src https://mirrors.ustc.edu.cn/ubuntu-ports/ bionic-security main restricted universe multiverse

# 预发布软件源，不建议启用
# deb https://mirrors.ustc.edu.cn/ubuntu-ports/ bionic-proposed main restricted universe multiverse
# deb-src https://mirrors.ustc.edu.cn/ubuntu-ports/ bionic-proposed main restricted universe multiverse
EOF

echo "3.Update your apt software list"
apt update

echo "4.Install some software"
apt install nano

wget - https://download.nomachine.com/download/7.8/Arm/nomachine_7.8.2_1_arm64.deb && dpkg -i nomachine*.deb
