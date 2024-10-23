#!/bin/bash

# Path to the lock file
COOLDOWN_FILE="/tmp/bspwm-restart.lock"

# Cooldown time in seconds
COOLDOWN_TIME=1

# Check if the lock file exists and is still within the cooldown time
if [ -f "$COOLDOWN_FILE" ]; then
    echo "Cooldown in effect, try again later."
    exit 1
fi

# Create the lock file with the current timestamp
touch "$COOLDOWN_FILE"

# Restart bspwm
bspc wm -r

# Sleep for the cooldown duration
sleep "$COOLDOWN_TIME"

# Remove the lock file after the cooldown period
rm -f "$COOLDOWN_FILE"

