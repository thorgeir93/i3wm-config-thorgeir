#!/bin/bash

# Ref.: https://chat.openai.com/share/191b7904-2817-49bb-a4b4-893dc9f98f90

# Get a list of input devices
devices=$(xinput list)

# Check if an external keyboard is connected
if echo "$devices" | grep -vq "AT Translated Set 2 keyboard"; then
  echo "An external keyboard is connected."
else
  echo "No external keyboard detected."
  # If no external keyboard is connected, load the Xmodmap configuration
  xmodmap ~/.Xmodmap
fi
