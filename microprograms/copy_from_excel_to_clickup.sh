#!/bin/bash
## Wait for the user to activate the search box
sleep 0.4

# Press Ctrl+C to copy the current selection
xdotool key ctrl+c
xdotool key alt+h
xdotool key Down
xdotool key BackSpace
xdotool key ctrl+v
xdotool key alt+l
xdotool key Down
