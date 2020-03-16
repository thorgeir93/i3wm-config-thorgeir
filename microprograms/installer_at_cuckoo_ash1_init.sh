#!/bin/bash
# Usage: bash installer_at_cuckoo_ash1_init.sh
#
# ssh to a cuckoo server in ash1 for the first time.
#
# Author: Thorgeir
# Date: Fri Nov 23 13:03:18 UTC 2018

# Just to be sure the commands will not 
# be execute alongside mines.
sleep 0.3

source ./utils.sh

main () {
    installer_ssh "10.117.57."
    installer_init_ssh_action
    init_cuckoo_setup_repo
}

installer_ssh "10.117.57."
