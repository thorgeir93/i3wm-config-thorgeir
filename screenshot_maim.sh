#!/bin/bash

screenshot_dir="$HOME/media/screenshots"
timestamp=$(date +"%Y%m%dT%H%M%S")
filename="screenshot_${timestamp}.png"
filepath="${screenshot_dir}/${filename}"

if [ "$1" == "activewindow" ]; then
    maim -i "$(xdotool getactivewindow)" "$filepath"
elif [ "$1" == "select" ]; then
    maim -s "$filepath"
fi

echo "$filepath" | xclip -selection clipboard

notify-send "$filepath"
