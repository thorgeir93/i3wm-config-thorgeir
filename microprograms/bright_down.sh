brightness=$(cat /sys/class/backlight/ideapad/brightness)

if (($brightness > 0)); then
  let brightness=$brightness-1
  echo "echo $brightness > /sys/class/backlight/ideapad/brightness" | sudo bash
fi
