#!/bin/bash
max_brightness=2.0
current_brightness=`xrandr --verbose | grep -m 1 -i brightness | cut -f2 -d ' '`
scale=0.1

display="eDP-1"

echo "Current brightness = [$current_brightness]"

if [[ $1 == "UP" ]]; then
    if [ `echo $current_brightness'<'$max_brightness | bc -l` == 1 ]; then
        current_brightness=`echo $current_brightness+$scale | bc`
        echo "Current brightness = [$current_brightness]"
        xrandr --output $display --brightness $current_brightness
    else
        echo "Already in maximum brightness!"
        echo "Brightness = [$current_brightness]"
    fi

elif [[ $1 == "DOWN" ]]; then
    if [ `echo $current_brightness'>0.5' | bc -l` == 1 ]; then
        current_brightness=`echo $current_brightness-$scale | bc`
        echo "Current brightness = [$current_brightness]"
        xrandr --output $display --brightness $current_brightness
    else
        echo "Brightness limit reached!"
        echo "Brightness = ['$current_brightness']"
    fi
else
    echo "Something is missing ..."
    echo "Pass in either DOWN or UP argument."
fi 


#max_brightness=$(cat /sys/class/backlight/*/max_brightness)
#brightness=$(cat /sys/class/backlight/*/brightness)

#if (("$brightness" < "$max_brightness")); then
  #let brightness=$brightness+65
  #echo "echo $brightness > /sys/class/backlight/*/brightness" | sudo bash
#fi
