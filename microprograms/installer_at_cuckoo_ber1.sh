#!/bin/bash
# Usage: bash installer_at_cuckoo_ber1.sh
#
# ssh to a cuckoo server and be root
# Author: Thorgeir
# Date: Fri Nov 23 13:03:18 UTC 2018

# Just to be sure the commands will not 
# be execute alongside mines.
sleep 0.3

source /home/thorgeir/.config/i3/microprograms/utils.sh

get_user_permission "BER1 login"
installer_ssh "10.105.54."
installer_ssh_login

get_user_permission "work session setup"
installer_setup_work_session
