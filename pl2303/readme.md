## 简介

* 适用于在jetson nano上安装优越者pl2303的驱动安装。
* jetson nano的linux 内核虽然集成了pl2303的驱动，但是按照优越者官方的说法，linux自带的驱动无法使用，需要使用优越者提供的源码自行编译、安装驱动。

### 文件介绍
* `Makefile` 构建描述（不重要）
* `pl2303.c` 适配kernel4.9版本的驱动源码
* `pl2303.h` 适配kernel4.9版本的驱动源码的头文件
* `pl2303.ko` 适配kernel4.9版本的驱动程序（由以上两个源码在jetson nano上编译得到的结果）

## 使用方法

1. **直接安装、无需编译**（需要设置开机脚本实现自动挂载驱动）

  * 卸载驱动 rmmod /lib/modules/4.9.253-tegra/kernel/drivers/usb/serial
  * 将pl2303.ko文件拷贝至jetson nano中的`/lib/modules/4.9.253-tegra/kernel/drivers/usb/serial/`目录，覆盖掉原来的pl2303.ko文件。
  * 更新驱动 insmod /lib/modules/4.9.253-tegra/kernel/drivers/usb/serial

2. **源码安装、官方方法**（需要设置开机脚本实现自动挂载驱动）

  * 找出与jetson nano系统内核对应的pl2303驱动源码（一般在压缩包内的文件夹名字形如`X.X_ok`）
  * 进入驱动源码目录后执行`make all`，生成pl2303.ko文件
  * 将`pl2303.ko` 拷贝至`/lib/modules/4.9.253-tegra/kernel/drivers/usb/serial/`目录，覆盖掉原来的pl2303.ko文件


3. **编译到内核**（不需要设置开机脚本来挂载驱动）
  * 在nvidia官网下载`L4T`的源码 https://developer.nvidia.com/embedded/linux-tegra ，并在jetson nano上解压
  * 在优越者官网下载驱动源码：https://www.unitek-it.com/download/download.php?class2=138
  * 找出与jetson nano系统内核对应的pl2303驱动源码（一般在压缩包内的文件夹名字形如`X.X_ok`），并将.c 和 .h 文件拷贝到（源码目录）`kernel/kernel-4.9/drivers/usb/serial/`(将原有的pl2303.c和pl2303.h文件替换)
  * 进入源码目录，执行 `./nvbuild.sh`
  * 将生成的内核镜像烧录到jetson nano中
