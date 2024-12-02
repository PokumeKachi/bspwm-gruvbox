#!/bin/sh

# Get the total used RAM (in KB)
used_ram=$(free | awk '/^Mem:/ { print $3 }')

# Get the total swap size (in KB)
swap_size=$(free | awk '/^Swap:/ { print $2 }')
state=$(upower -i $(upower -e | grep 'BAT') | grep -i 'state' | awk '{print $2}')

if [ "$used_ram" -gt "$swap_size" ]; then
	echo "Can't hibernate, too much ram used"
else
#    if [ "$state" = "discharging" ]; then
  PASSWORD=$(zenity --password --timeout=5 --title="Authentication Required")

  if [ -z "$PASSWORD" ]; then
    echo "No password provided"
    exit
  fi

	echo "Hibernatin' time baby"
  echo $PASSWORD | sudo -S rmmod xmm7360
  echo $PASSWORD | sudo -S systemctl hibernate
#    else
#	systemctl suspend
#    fi
fi

