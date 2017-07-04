#!/bin/bash

# Return the main screen name depending 
# on which computer you are using.

export HOST=`uname -n`

if [ $HOST -eq "MEGAS" ]; then
    return "HDMI-2"
fi

if [ $HOST -eq "thorgeir" ]; then
    return "HDMI1"
fi
