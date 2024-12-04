#!/bin/sh

used_ram=$(free | awk '/^Mem:/ { print $3 }')

swap_size=$(free | awk '/^Swap:/ { print $2 }')
state=$(upower -i $(upower -e | grep 'BAT') | grep -i 'state' | awk '{print $2}')

if [ "$used_ram" -gt "$swap_size" ]; then
	echo "Can't hibernate, too much ram used"
else
#    if [ "$state" = "discharging" ]; then
  pkill zenity
  PASSWORD=$(zenity --password --timeout=15 --title="Authentication Required")

  if [ -z "$PASSWORD" ]; then
    echo "No password provided"
    exit
  fi

  echo "$PASSWORD" | su -c "echo 'Hibernatin time baby'" -s /bin/bash "root"

  if [ $? -ne 0 ]; then
    echo "Incorrect password"
  else
    echo $PASSWORD | sudo -S rmmod xmm7360
    echo $PASSWORD | sudo -S systemctl hibernate
  fi

#    else
#	systemctl suspend
#    fi
fi

