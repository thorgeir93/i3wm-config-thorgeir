#!/bin/bash
# Usage: bash vim_save_and_run.sh
#
# Save the current file and run the last command line statement.
# Author: Thorgeir
# Date: Fri Nov 23 13:03:18 UTC 2018

# :w
# :!!

# Just to be sure the commands will not 
# be execute alongside mines.
sleep 0.3

xdotool key colon w Return 
xdotool key colon exclam exclam Return 
