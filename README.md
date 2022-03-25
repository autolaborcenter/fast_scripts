# fast_scripts
Some scripts for deploy ,install ,development

## 使用方法

1. [Jetson nano deploy](jetson_nano_deploy.sh):

```
sudo sh -c "$(wget https://raw.githubusercontent.com/autolaborcenter/fast_scripts/main/jetson_nano_deploy.sh -O -)"
```
2. [CAN test](can_test.sh):
> 测试canbus功能完整性，以及硬件故障检查

```
sudo sh -c "$(wget https://raw.githubusercontent.com/autolaborcenter/fast_scripts/main/cantest.sh -O -)"
```


## 驱动

* [pl2303](pl2303)
    *  优越者RS232-USB线的驱动程序

* [mcp251x](mcp251x):
    * 一款SPI-CAN控制器的驱动程序
