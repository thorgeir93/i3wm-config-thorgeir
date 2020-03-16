#!/bin/bash
# Usage: bash installer_at_cuckoo_ber1.sh
#
# ssh to a cuckoo server and be root
# Author: Thorgeir
# Date: Fri Nov 23 13:03:18 UTC 2018

# Just to be sure the commands will not 
# be execute alongside mines.
sleep 0.3


xdotool key Escape 
xdotool type "dd"
xdotool type "issh installer@10.3.61."
xdotool key Escape p
xdotool key Return
sleep 1.5

xdotool type "yes" && xdotool key Return && sleep 1
xdotool type "qwerty77" && xdotool key Return && sleep 1
xdotool type "sudo -i" && xdotool key Return && sleep 0.5
xdotool type "qwerty77" && xdotool key Return && sleep 1

xdotool type "set -o vi" && xdotool key Return
xdotool type "clear" && xdotool key Return
xdotool type "git clone http://c3gitlab01.amadis.com/sandbox_array/sandbox/sandbox_setup.git"
xdotool key Return

xdotool type "cd /root/sandbox_setup && bash setup_cuckoo_host.sh" && xdotool key Return
xdotool type "cd /var/data/gitlab/cuckoo_setup" && xdotool key Return
exit 0
