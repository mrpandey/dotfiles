#!/bin/bash

# first arg tells whether to increase brightness or decrease
# 0 = decrease by delta
# 1 = increase by delta
# x = set brightness to x if within range

# reading current, max and min brighness
file="/sys/class/backlight/intel_backlight/brightness"
current_b=$(cat "$file")
max_b=$(cat "/sys/class/backlight/intel_backlight/max_brightness")
min_b=5

# delta is value by which brightness is inc/dec
delta=10

inc=$((current_b + delta))
dec=$((current_b - delta))

if [ "$1" == "1" ]
then
    if [ $inc -gt $max_b ]
    then
        echo "$max_b" | sudo tee $file
    else
        echo "$inc" | sudo tee $file
    fi
elif [ "$1" == "0" ]
then
    if [ $dec -lt $min_b ]
    then
        echo "$min_b" | sudo tee $file
    else
        echo "$dec" | sudo tee $file
    fi
elif [ $1 -ge $min_b ] && [ $1 -le $max_b ]
then
    echo "$1" | sudo tee $file
else
    exit 1
fi
