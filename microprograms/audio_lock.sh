#!/bin/bash

while true; do

    # Check if audio is playing
    if pactl list | grep -q "State: RUNNING"; then
        # Audio is playing, disable screen lock
        xssstate -nolock
    else
        # Audio is not playing, enable screen lock
        xssstate -lock
    fi
    sleep 10
done
