#!/usr/bin/env bash
# $1 - menu program

cliphist list | $1 -dmenu | cliphist decode | wl-copy

if [[ $(hyprctl activewindow -j | jq -r '.class') == "com.mitchellh.ghostty" ]]; then
	# ctrl-shift-v
	ydotool key 29:1 42:1 47:1 47:0 42:0 29:0
else
	# ctrl-v
	ydotool key 29:1 47:1 47:0 29:0
fi
