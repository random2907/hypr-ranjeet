#!/bin/sh

dir="$wallpaper_path"
BG="$(find "$dir" -name '*.jpg' -o -name '*.png' | shuf -n1)"

trans_type="wipe"
# trans_type="center"
# Name of the program to check
PROGRAM="swww-daemon"

# Check if the program is running
if pgrep "$PROGRAM" >/dev/null; then
	swww img "$BG" --transition-fps 255 --transition-type $trans_type --transition-duration 2
	wal -i $BG -s 
	killall dunst
	killall -USR2 cava
	killall -SIGUSR2 waybar
else
	swww init
fi
