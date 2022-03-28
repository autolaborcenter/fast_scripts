## 简介

* jetson-mcp251x.dts 设备树源码
* jetson-mcp251x.dtbo 设备树overlay程序，16M晶振，Jetpack4.6.1编译通过

## 使用方法

* 将jetson nano的/boot目录下的/boot/tegra210-p3448-0000-p3449-0000-a01-mcp251x.dtbo and /boot/tegra210-p3448-0000-p3449-0000-a02-mcp251x.dtbo 文件删除（或改名）
* 将jetson-mcp251x.dtbo拷贝至/boot/
* 运行`sudo /opt/nvidia/jetson-io/config-by-hardware.py -n "MCP251x CAN Controller"` 将dtbo文件覆盖安装到设备
* 重启后生效

## 诊断方法

* 如果重启后没生效，使用`dmesg | grep mcp`，查看系统初始化时的日志
