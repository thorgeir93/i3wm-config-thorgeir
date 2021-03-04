#!/bin/bash

# Execute a basic vimrc configs for a given vim file.

# :set ts=4
# :set exapandtab
# :retab
# :set bg

# Just to be sure the commands will not 
# be execute alongside mines.
sleep 0.3

# et -> expandtab
# ret -> retab
# fdm -> foldmethod
# se -> set
# acd -> autochdir
xdotool type ":se ts=4 bg=dark fdm=indent et acd | ret" && \
    xdotool key Return
