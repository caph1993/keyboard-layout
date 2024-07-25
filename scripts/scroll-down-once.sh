#!/bin/bash

# # Downgrade to user permissions
USER="carlos"
if [[ $EUID -eq 0 ]]; then
   sudo -u $USER "$0" "$@"
   exit
fi
# Attach to the user's X session
export DISPLAY=:0
export DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/$(id -u)/bus

xdotool click 5