#!/bin/bash
echo "socket CAN test start"

CANBAUD = 250000

echo "set CAN bitrate ${CANBAUD}"
sudo ifconfig can0 down
sudo ip link set can0 type can bitrate  CANBAUD 


for((i=1;i<=1000;i++));  
do   

echo "********${i}********"

echo "ifconfig can0 up";
sudo ifconfig can0 up
sleep 1s

echo "cansend can0 123##FF "
cansend can0 123##FF
sleep 1s

echo "ifconfig can0 down";    
sudo ifconfig can0 down
sleep 1s

done 

sudo ip link set can0 type can bitrate 1000000 loopback on
candump can0
cansend can0 123#99.95.42.07.2B.96.66.6E
