# fast_scripts
Some scripts for deploy, install, development, test.

## 使用

[Jetson nano ](jetson_nano.sh): 拷贝并执行

```
sudo bash -c "$(wget https://raw.githubusercontent.com/autolaborcenter/fast_scripts/main/jetson_nano.sh -O -)"
```

## 目录

* [camera](camera):
    * 适配mipi csi 相机的设备树源码（dts）及设备树覆盖结果程序（dtbo）

* [pl2303](pl2303)
    *  优越者RS232-USB线的驱动程序

* [mcp251x](mcp251x):
    * 适配mcp251x的设备树源码（dts）及设备树覆盖结果程序（dtbo）

* [.zshrc](.zshrc)
    *  ZSH配置文件

* [source.list](sources.list)
    *  国内镜像源列表，Ubuntu port 18.04



