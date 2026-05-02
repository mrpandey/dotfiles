#!/bin/bash
locked_wallpapers_path=$HOME/Pictures/wallpapers/others
swaylock -f -i `find $locked_wallpapers_path -type f | shuf -n 1`
systemctl suspend
