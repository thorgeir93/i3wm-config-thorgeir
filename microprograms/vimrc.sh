#!/bin/bash

# Execute a basic vimrc configs for a given vim file.

# :set ts=4
# :set exapandtab
# :retab
# :set bg

# Just to be sure the commands will not 
# be execute alongside mines.
sleep 0.3
xdotool key colon s e t space t s equal 4 Return 
xdotool key colon s e t space e x p a n d t a b Return 
xdotool key colon r e t a b Return 
xdotool key colon s e t space b g equal d a r k Return
