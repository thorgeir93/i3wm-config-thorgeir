#!/bin/bash
# Usage: bash installer_at_cuckoo.sh
#
# ssh to a cuckoo server and be root
#
# :param prefix_ipv4: The first three octet in ipv4 sting following with one dot.
#   Example: "192.168.56."
#
# Author: Thorgeir
# Date: Mon Feb 24 15:24:06 UTC 2020

# Just to be sure the commands will not 
# be execute alongside mines.
sleep 0.3

prefix_ipv4=${1}; shift

xdotool key Escape 
xdotool type "dd"
xdotool type "issh installer@${prefix_ipv4}"
xdotool key Escape p
xdotool key Return
sleep 1.5

xdotool type "qwerty77" && xdotool key Return && sleep 1
xdotool type "sudo -i" && xdotool key Return && sleep 1.5
xdotool type "qwerty77" && xdotool key Return && sleep 1

xdotool type "set -o vi" && xdotool key Return
xdotool type "clear" && xdotool key Return
xdotool type "cd /var/data/gitlab/cuckoo_setup" && xdotool key Return

sleep 1

# Set synchonize panes off in tmux
xdotool key alt+a colon && xdotool type "setw synchronize-panes off"
xdotool key Return

# Become cuckoo user and acivate the cuckoo environment
xdotool type "sudo su - cuckoo" && xdotool key Return
xdotool type "set -o vi" && xdotool key Return
xdotool type "source ~/venv/bin/activate" && xdotool key Return

# Next pane - Go to cuckoo_setup repo.
xdotool key alt+a o
xdotool type "cd /var/data/gitlab/cuckoo_setup" && xdotool key Return
sleep 0.2

# Next pane - Tail cuckoo log.
xdotool key alt+a o
sleep 0.2

xdotool type "tail -f -n 100 /home/cuckoo/.cuckoo/log/cuckoo.log" && xdotool key Return

exit 0
