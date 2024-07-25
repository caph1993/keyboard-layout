#!/bin/bash

# # Downgrade to user permissions
USER="carlos"
if [[ $EUID -eq 0 ]]; then
   sudo -u $USER -H "$0" "$@"
   exit
fi
# Attach to the user's X session
export DISPLAY=:0
export DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/$(id -u)/bus

TIME=0.3
while true; do
   echo "scrolling down";
   su xdotool click 5;
   sleep $TIME;
   # Accelerate the scroll
   if (( $(echo "$TIME > 0.05" | bc -l) )); then
      TIME=$(echo "$TIME - 0.01" | bc);
   fi
done

