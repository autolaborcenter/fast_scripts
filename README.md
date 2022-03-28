# fast_scripts
Some scripts for deploy ,install ,development

## 使用方法

[Jetson nano deploy](jetson_nano_deploy.sh):

```
sudo sh -c "$(wget https://raw.githubusercontent.com/autolaborcenter/fast_scripts/main/jetson_nano_deploy.sh -O -)"
```

## 简介

* [.zshrc](.zshrc)
    *  ZSH配置文件

* [can_test](can_test.sh)
    *  Linux socketCAN设备测试脚本

* [pl2303](pl2303)
    *  优越者RS232-USB线的驱动程序

* [mcp251x](mcp251x):
    * 适配jetson nano的设备树源码（dts）及设备树覆盖结果程序（dtbo）
