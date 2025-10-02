#!/bin/bash

source "$HOME/.config/sketchybar/icons.sh"
source "$HOME/.config/sketchybar/colors.sh"

# Get battery information with better error handling and more reliable parsing
BATTERY_INFO=$(pmset -g batt 2>/dev/null)
if [ $? -ne 0 ] || [ -z "$BATTERY_INFO" ]; then
  # If pmset fails or returns empty, hide the battery item
  sketchybar --set battery drawing=off
  exit 0
fi

# More robust parsing of battery information
PERCENTAGE=$(echo "$BATTERY_INFO" | grep -Eo "[0-9]+%" | head -1 | sed 's/%//')
CHARGING=$(echo "$BATTERY_INFO" | grep -oE "(charging|discharging|AC Power)" | head -1)

if [ -z "$PERCENTAGE" ]; then
  # If we can't get percentage, hide the battery item
  sketchybar --set battery drawing=off
  exit 0
fi

DRAWING=on
COLOR=$WHITE
case ${PERCENTAGE} in
  100) ICON=$BATTERY_100; COLOR=$GREEN; DRAWING=on
  ;;
  9[0-9]) ICON=$BATTERY_100; COLOR=$GREEN; DRAWING=on
  ;;
  [6-8][0-9]) ICON=$BATTERY_75; COLOR=$WHITE; DRAWING=on
  ;;
  5[0-9]) ICON=$BATTERY_75; COLOR=$YELLOW; DRAWING=on
  ;;
  4[0-9]) ICON=$BATTERY_75; COLOR=$YELLOW; DRAWING=on
  ;;
  3[0-9]) ICON=$BATTERY_50; COLOR=$BLUE; DRAWING=on
  ;;
  [1-2][0-9]) ICON=$BATTERY_25; COLOR=$RED; DRAWING=on
  ;;
  *) ICON=$BATTERY_0; COLOR=$RED; DRAWING=on
esac

# Check if charging (handle both "charging" and "AC Power" states)
if [[ $CHARGING == "charging" ]] || [[ $CHARGING == "AC Power" ]]; then
  ICON=$BATTERY_CHARGING
  COLOR=$GREEN
  DRAWING=on
fi

# Debug: Uncomment the line below to see battery info in terminal
# echo "Battery: $PERCENTAGE% - Charging: '$CHARGING' - Icon: $ICON"

# Check if label is currently visible and update it with current percentage
LABEL_DRAWING=$(sketchybar --query battery | jq -r ".label.drawing" 2>/dev/null)
if [ "$LABEL_DRAWING" = "on" ]; then
  sketchybar --set battery drawing=$DRAWING icon="$ICON" icon.color=$COLOR label="${PERCENTAGE}%"
else
  sketchybar --set battery drawing=$DRAWING icon="$ICON" icon.color=$COLOR
fi
