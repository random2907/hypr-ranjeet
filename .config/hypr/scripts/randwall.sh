#!/bin/sh

BG="$(find $wallpaper_path | shuf -n 1)"

trans_type="grow"
# trans_type="center"
# Name of the program to check
PROGRAM="swww-daemon"

# Check if the program is running
if pgrep "$PROGRAM" >/dev/null; then
	swww img "$BG" --transition-type $trans_type
	wal -i $BG -s
	killall dunst
	killall -USR2 cava
	killall -SIGUSR2 waybar
else
	swww init
fi
