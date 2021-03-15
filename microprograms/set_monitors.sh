#!/bin/bash

set -o xtrace

#echo $(date) > /home/thorgeir/tmp/set_monitor.log

source /home/thorgeir/.bashrc

# If laptop connected to docker (workstation)
if [[ $(xrandr | grep eDP | wc -l) == 1 ]] && [[ $(xrandr | grep " connected " | wc -l) == 3 ]]; 
    then
    # Find this function in ~/.bashrc
    hdmi_orient_docker

    # TODO In future, open applications on different workspaces.
fi
