#!/bin/sh
if [ -z "$1" ]; then
BG="$(find $wallpaper_path | shuf -n 1)"
else
	BG="$1"
fi

trans_type="wipe"
# trans_type="center"
# Name of the program to check
PROGRAM="swww-daemon"

# Check if the program is running
if pgrep "$PROGRAM" >/dev/null; then
	swww img "$BG" --transition-type none
	wal -i $BG -n -s
	killall dunst
	killall -USR2 cava
else
	swww-daemon &
fi
