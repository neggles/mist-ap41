#!/bin/sh
# cause a panic dump for testing
echo 1 > /proc/sys/kernel/sysrq
echo c > /proc/sysrq-trigger
