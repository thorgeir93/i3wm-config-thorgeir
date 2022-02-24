#!/bin/bash
scrot /tmp/screenlock.png
mogrify -blur 0x5 /tmp/screenlock.png
i3lock --config=~/.config/i3lock-fancier/config.ini
i3lock -i /tmp/screenlock.png
rm /tmp/screenlock.png

##!/bin/bash
## Dependencies:
## imagemagick
## i3lock
## scrot (optional but default)
#
#IMAGE=/tmp/i3lock.png
#SCREENSHOT="import -window root $IMAGE" # 0.46s
#
## Alternate screenshot method with imagemagick. NOTE: it is much slower
## SCREENSHOT="import -window root $IMAGE" # 1.35s
#
## Here are some imagemagick blur types
## Uncomment one to use, if you have multiple, the last one will be used
#
## All options are here: http://www.imagemagick.org/Usage/blur/#blur_args
#BLURTYPE="0x5" # 7.52s
##BLURTYPE="0x2" # 4.39s
##BLURTYPE="5x2" # 3.80s
##BLURTYPE="2x8" # 2.90s
##BLURTYPE="2x3" # 2.92s
#
## Get the screenshot, add the blur and lock the screen with it
#$SCREENSHOT
#convert $IMAGE -blur $BLURTYPE $IMAGE
#i3lock  --ignore-empty-password --no-unlock-indicator --tiling --image $IMAGE
#rm $IMAGE
