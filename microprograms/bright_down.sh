brightness=$(cat /sys/class/backlight/*/brightness)

if (("$brightness" > "0")); then
  let brightness=$brightness-65
  echo "echo $brightness > /sys/class/backlight/*/brightness" | sudo bash
fi
