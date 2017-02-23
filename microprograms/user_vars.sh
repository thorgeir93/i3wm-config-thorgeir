#!/bin/bash

export HOST=`uname -n`

if [ $HOST -eq "MEGAS" ]; then
    export SCREEN_1="HDMI-1"
    export SCREEN_2="HDMI-2"
else
    export SCREEN_1="LVDS1"
    export SCREEN_2="HDMI1"
fi
