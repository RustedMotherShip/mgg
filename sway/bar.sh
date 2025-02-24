#!/bin/sh

temp_amd_cpu=$(sensors | grep 'Tctl' | awk '{print $2}')

cpu=$(top -bn 1 | grep 'CPU:' -m 1 | awk '{printf " " $2 "%"}')

ram=$(free | grep Mem | awk '{printf " %.1f%\n", $3/$2 * 100}')

hostname=$(hostnamectl hostname)

hostname_alpine=$( hostname)

datetime=$(date +" %Y %b %d ][ %H:%M:%S")

volume=$(pamixer --get-volume-human | awk '{print " " $0}')


if [ "$1" = "--mini" ]; then
    echo "[ $temp_amd_cpu ][ $cpu ][ $ram ][ $volume ][ $datetime ]"
else
	echo "[ $temp_amd_cpu ][ $cpu ][ $ram ][ $disk ][ $volume ][ $datetime ][ $hostname_alpine ]"
	
fi
