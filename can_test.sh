#!/bin/bash
echo "can test start"

sudo ip link set can0 down
sudo ip link set can0 type can bitrate 1000000 


for((i=1;i<=1000;i++));  
do   

echo "********${i}********"

echo "ip link set can0 up";
sudo ip link set can0 up
sleep 1s

echo "ip link set can0 down";    
sudo ip link set can0 down
sleep 1s

done 
