#!/bin/bash
#
# Usage: bash caps_status.sh
#
# Print to stdout caps lock status.
# Print "on" if caps lock is active.
# Print "off" if caps lock is unactive.
# 
xset -q | grep "Caps Lock" | awk '{print $4}'

