#!/bin/sh

temp_intel_cpu=$(sensors | grep 'Core 0' | awk '{print " "$3}')

temp_amd_cpu=$(sensors | grep 'Tctl' | awk '{print " "$2}')

cpu=$(top -bn1 | grep '%Cpu(s):' -m 1 | awk '{printf "  %.1f%%\n", 100 - $8}')

ram=$(free | grep Mem | awk '{printf " %.1f%\n", $3/$2 * 100}')

hostname=$(hostnamectl hostname)

hostname_alpine=$(hostname)

disk=$(df -h / | awk '$NF ~ /^\// {print " " $4}')

datetime=$(date +" %Y %b %d ][ %H:%M:%S")

volume=$(pamixer --get-volume-human | awk '{print " " $0}')

git_commit_changes_count=0
git_not_push_count=0
cd /home/d337/git || exit
for dir in */; do
    if [ -d "$dir/.git" ]; then
        changes=$(git -C "$dir" status --porcelain | wc -l)
        git_commit_changes_count=$((git_commit_changes_count + changes))
        local_commits=$(git -C "$dir" rev-list --count @{u}..HEAD 2>/dev/null)
        git_not_push_count=$((git_not_push_count + local_commits))
    fi
done

if [ "$git_commit_changes_count" -eq 0 ]; then
    git_commit_changes_count=""
fi

if [ "$git_not_push_count" -eq 0 ]; then
    git_not_push_count=""
fi
git="  $git_commit_changes_count   $git_not_push_count "

if [ "$1" = "--mini" ]; then
    echo "[ $git ][ $temp_intel_cpu ][ $cpu ][ $ram ][ $volume ][ $datetime ]"
else
	echo "[ $git ][ $temp_intel_cpu ][ $cpu ][ $ram ][ $disk ][ $volume ][ $datetime ][ $hostname ]"
fi
