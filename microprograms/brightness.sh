#!/bin/bash
acpi_path=/sys/class/backlight/intel_backlight
max_brightness=$(cat ${acpi_path}/max_brightness)
current_brightness=$(cat ${acpi_path}/brightness)
scale=50

echo "Max brightness = [$max_brightness]"
echo "Current brightness = [$current_brightness]"

if [[ $1 == "UP" ]]; then
    current_brightness=$((current_brightness + scale))
    brightness_path=${acpi_path}/brightness
    echo "Current brightness = [$current_brightness]"
    echo "set brightness in [$brightness_path]"
    sudo bash -c "echo $current_brightness > $brightness_path"

elif [[ $1 == "DOWN" ]]; then
    current_brightness=$((current_brightness - scale))
    echo "Current brightness = [$current_brightness]"
    sudo bash -c "echo $current_brightness > ${acpi_path}/brightness"
else
    echo "Something is missing ..."
    echo "Pass in either DOWN or UP argument."
fi 

exit 0
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
