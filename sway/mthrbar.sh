#!/bin/sh

		echo "[   $(top -n 1 | grep 'CPU:' | awk '{print $2}') ][ $(free | grep Mem | awk '{printf "  %.1f%\n", $3/$2 * 100}') ][ $(date +"%X %Y-%m-%d") ][ $(hostname) ]"
