#!/bin/sh

temp_amd_cpu=$(sensors | grep 'Tctl' | awk '{print $2}')

cpu=$(top -bn 1 | grep '%Cpu' | awk '{printf " " $2 "%"}')

ram=$(free | grep Mem | awk '{printf " %.1f%\n", $3/$2 * 100}')

hostname=$(hostnamectl hostname)

datetime=$(date +" %Y %b %d ][ %H:%M:%S")

echo "[ $temp_amd_cpu ][ $cpu ][ $ram ][ $datetime ][ $hostname ]"
