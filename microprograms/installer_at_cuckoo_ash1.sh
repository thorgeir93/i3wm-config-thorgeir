#!/bin/bash
# Usage: bash installer_at_cuckoo_ash1_init.sh
#
# ssh to a cuckoo server in ash1 for the first time.
#
# Author: Thorgeir
# Date: Fri Nov 23 13:03:18 UTC 2018
#set -o xtrace
source /home/thorgeir/.config/i3/microprograms/utils.sh


# Just to be sure the commands will not 
# be execute alongside mines.
sleep 0.3

#main () {
#    installer_ssh "10.117.57."
#    init_cuckoo_setup_repo
#}

# main

#fun () {
#    xdotool key Escape 
#    xdotool type "dd"
#    xdotool type "issh installer@10.117.57."
#    xdotool key Escape p
#    xdotool key Return
#    sleep 1.5
#}

installer_ssh "10.117.57."
