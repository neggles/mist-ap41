#!/bin/sh
hciattach -s 115200 ttyS1 bcm2035 115200 flow `mac.lua`
bluetoothd
