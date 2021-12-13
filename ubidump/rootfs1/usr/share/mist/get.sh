#!/bin/sh

#IP=192.168.1.2
IP=10.2.10.165

APFW=/home/jasonh/work/apfw
APH=$APFW/output/aph

#scp jasonh@$IP:$APH/target/lib/modules/3.10.84/extra/pace.ko /lib/modules/3.10.84/extra/pace.ko

rw
pidof pace | xargs kill
scp jasonh@$IP:$APH/target/usr/sbin/pace /usr/sbin/pace
