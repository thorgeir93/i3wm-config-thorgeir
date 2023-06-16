#!/bin/bash
## Wait for the user to activate the search box
sleep 0.4

# Press Ctrl+C to copy the current selection
xdotool key BackSpace
xdotool key ctrl+a
xdotool key ctrl+c
xdotool key Enter
xdotool key Left
xdotool key Enter
xdotool key Right
xdotool key Space
xdotool key minus
xdotool key Space
xdotool key ctrl+v
xdotool key Enter
xdotool key Down
xdotool key Right
