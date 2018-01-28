#!/bin/bash

echo 1020 > /sys/class/gpio/export
echo out > /sys/class/gpio/gpio1020/direction

