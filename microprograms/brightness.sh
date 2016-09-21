max_brightness=$(cat /sys/class/backlight/ideapad/max_brightness)
brightness=$(cat /sys/class/backlight/ideapad/brightness)

if (($brightness < $max_brightness)); then
  let brightness=$brightness+1
  echo "echo $brightness > /sys/class/backlight/intel_backlight/brightness" | sudo bash
fi
