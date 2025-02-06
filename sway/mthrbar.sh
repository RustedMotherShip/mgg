#!/bin/sh

echo "[ 󰔄 $(sensors | grep 'Core 0' | awk '{print $3}') ][   $(top -n 1 | grep 'CPU:' | awk '{print $2}') ][ $(free | grep Mem | awk '{printf "  %.1f%\n", $3/$2 * 100}') ][ $(date +"%X %Y-%m-%d") ][ $(hostname) ]"
#For Intel
#echo "[ sensors | grep 'Tctl' | awk '{print $2}' ][   $(top -n 1 | grep 'CPU:' | awk '{print $2}') ][ $(free | grep Mem | awk '{printf "  %.1f%\n", $3/$2 * 100}') ][ $(date +"%X %Y-%m-%d") ][ $(hostname) ]"	
#For AMD
