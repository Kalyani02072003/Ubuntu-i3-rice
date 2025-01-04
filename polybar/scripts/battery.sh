#!/bin/bash

BATTERY_PATH="/sys/class/power_supply/BAT0"
CHARGE_STATUS=$(cat "$BATTERY_PATH/status")
BATTERY_CAPACITY=$(cat "$BATTERY_PATH/capacity")

if [[ "$CHARGE_STATUS" == "Charging" ]]; then
  echo " $BATTERY_CAPACITY%"
else
  case $BATTERY_CAPACITY in
    9[0-9]|100) ICON="" ;; # Full
    8[0-9]) ICON="" ;;
    7[0-9]) ICON="" ;;
    6[0-9]) ICON="" ;;
    5[0-9]) ICON="" ;;
    4[0-9]) ICON="" ;;
    3[0-9]) ICON="" ;;
    2[0-9]) ICON="" ;;
    1[0-9]) ICON="" ;;
    *) ICON="" ;; # Critical
  esac
  echo "$ICON $BATTERY_CAPACITY%"
fi
