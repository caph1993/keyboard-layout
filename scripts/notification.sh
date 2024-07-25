#!/bin/bash

# # Downgrade to user permissions
# USER="carlos"
# if [[ $EUID -eq 0 ]]; then
#    sudo -u $USER "$0" "$@"
#    exit
# fi
# # Attach to the user's X session
# export DISPLAY=:0
# export DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/$(id -u)/bus

echo '1' && echo '2' ;
echo 'this is notification.sh' ;
notify-send -t 200 "hello";
echo '4' 