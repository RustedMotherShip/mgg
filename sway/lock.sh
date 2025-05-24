#!/bin/bash

FOCUSED_COLOR="#689d6a"
UNFOCUSED_COLOR="#282828"
URGENT_COLOR="#cc241d"
FOCUSED_INACTIVE_COLOR="#282828"

# Запуск swaylock с заданными цветами
swaylock \
    --color $UNFOCUSED_COLOR \
    --inside-color $FOCUSED_COLOR \
    --ring-color $FOCUSED_COLOR \
    --line-color $UNFOCUSED_COLOR \
    --key-hl-color $FOCUSED_COLOR \
    --bs-hl-color $URGENT_COLOR \
    --inside-color $FOCUSED_INACTIVE_COLOR \
    --ring-color $FOCUSED_COLOR \
    --line-color $UNFOCUSED_COLOR\
	--ring-ver-color $FOCUSED_COLOR \
	--line-ver-color $UNFOCUSED_COLOR
	--inside-ver-color $FOCUSED_COLOR \
	--text-ver-color $TEXT_COLOR 
