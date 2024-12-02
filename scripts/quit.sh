#!/bin/sh

bspc wm -d > cache/session_layout.log
wmctrl -l | awk '{$3=""; $4=""; print}' > cache/session_apps.log

bspc quit
