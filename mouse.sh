#!/bin/bash

# # Downgrade to user permissions
# USER="carlos"
# if [[ $EUID -eq 0 ]]; then
#    sudo -u $USER "$0" "$@"
#    exit
# fi
# # Attach to the user's X session
export DISPLAY=:0
export DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/$(id -u)/bus


# Check if the argument is left, right, up or down


move_mouse() {
  local direction=$1
  local amount=1
  while true; do
    case $direction in
      "left")
        xdotool mousemove_relative --sync -- -$amount 0
        ;;
      "right")
        xdotool mousemove_relative --sync -- $amount 0
        ;;
      "up")
        xdotool mousemove_relative --sync -- 0 -$amount
        ;;
      "down")
        xdotool mousemove_relative --sync -- 0 $amount
        ;;
    esac
    sleep 0.01
    if (( amount <  10)); then
      amount=$((amount + 1))
    elif (( amount < 30 )); then
      amount=$((amount + 3))
    # # elif (( amount < 50 )); then
    #   amount=$((amount + 1))
    # elif (( amount < 100 )); then
    #   ((amount++))
    fi
  done
}

scroll_mouse() {
  local direction=$1
  local amount=1
  while true; do
    case $direction in
      "scroll-left")
        xdotool click 6
        ;;
      "scroll-right")
        xdotool click 7
        ;;
      "scroll-up")
        xdotool click 4
        ;;
      "scroll-down")
        xdotool click 5
        ;;
    esac
    sleep 0.01
  done
}

if [[ "$1" == "left" || "$1" == "right" || "$1" == "up" || "$1" == "down" ]]; then
  move_mouse $1
elif [[ "$1" == "scroll-left" || "$1" == "scroll-right" || "$1" == "scroll-up" || "$1" == "scroll-down" ]]; then
  scroll_mouse $1
elif [ "$1" == "left-single" ]; then
    xdotool key Left
elif [ "$1" == "right-single" ]; then
    xdotool key Right
elif [ "$1" == "up-single" ]; then
    xdotool key Up
elif [ "$1" == "down-single" ]; then
    xdotool key Down
else
  echo "Usage: $0 left|right|up|down|left-single|right-single|up-single|down-single"
fi
