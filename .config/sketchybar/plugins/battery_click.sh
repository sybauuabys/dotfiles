#!/bin/bash

WIDTH=120

detail_on() {
  sketchybar --animate tanh 30 --set battery label.drawing=on label="$PERCENTAGE%"
}

detail_off() {
  sketchybar --animate tanh 30 --set battery label.drawing=off
}

toggle_detail() {
  # Get battery percentage for display with improved parsing
  BATTERY_INFO=$(pmset -g batt 2>/dev/null)
  PERCENTAGE=$(echo "$BATTERY_INFO" | grep -Eo "[0-9]+%" | head -1 | sed 's/%//')
  
  if [ -z "$PERCENTAGE" ]; then
    exit 0
  fi
  
  INITIAL_DRAWING=$(sketchybar --query battery | jq -r ".label.drawing")
  if [ "$INITIAL_DRAWING" = "off" ]; then
    detail_on
  else
    detail_off
  fi
}

toggle_battery_info() {
  source "$HOME/.config/sketchybar/colors.sh"
  
  # Get battery information
  BATTERY_INFO=$(pmset -g batt 2>/dev/null)
  if [ $? -ne 0 ] || [ -z "$BATTERY_INFO" ]; then
    sketchybar --set battery popup.drawing=off
    exit 0
  fi
  
  PERCENTAGE=$(echo "$BATTERY_INFO" | grep -Eo "[0-9]+%" | head -1 | sed 's/%//')
  CHARGING=$(echo "$BATTERY_INFO" | grep -oE "(charging|discharging|AC Power)" | head -1)
  TIME_REMAINING=$(echo "$BATTERY_INFO" | grep -oE "\d+:\d+" | head -1)
  
  if [ -z "$PERCENTAGE" ]; then
    sketchybar --set battery popup.drawing=off
    exit 0
  fi
  
  # Set up popup with battery information
  args=(--remove '/battery.info\.*/' --set "$NAME" popup.drawing=toggle)
  
  # Add percentage info
  args+=(--add item battery.info.percentage popup."$NAME" \
         --set battery.info.percentage label="Battery: ${PERCENTAGE}%" \
                                      label.color="$WHITE" \
                                      label.font="size=12")
  
  # Add charging status
  if [[ $CHARGING == "charging" ]] || [[ $CHARGING == "AC Power" ]]; then
    args+=(--add item battery.info.status popup."$NAME" \
           --set battery.info.status label="Status: Charging" \
                                    label.color="$GREEN" \
                                    label.font="size=11")
  else
    args+=(--add item battery.info.status popup."$NAME" \
           --set battery.info.status label="Status: Discharging" \
                                    label.color="$YELLOW" \
                                    label.font="size=11")
  fi
  
  # Add time remaining if available
  if [ -n "$TIME_REMAINING" ]; then
    if [[ $CHARGING == "charging" ]] || [[ $CHARGING == "AC Power" ]]; then
      args+=(--add item battery.info.time popup."$NAME" \
             --set battery.info.time label="Time to full: ${TIME_REMAINING}" \
                                    label.color="$GREEN" \
                                    label.font="size=11")
    else
      args+=(--add item battery.info.time popup."$NAME" \
             --set battery.info.time label="Time remaining: ${TIME_REMAINING}" \
                                    label.color="$YELLOW" \
                                    label.font="size=11")
    fi
  fi
  
  # Add battery health info if available
  BATTERY_HEALTH=$(system_profiler SPPowerDataType 2>/dev/null | grep "Condition:" | awk '{print $2}')
  if [ -n "$BATTERY_HEALTH" ]; then
    args+=(--add item battery.info.health popup."$NAME" \
           --set battery.info.health label="Health: ${BATTERY_HEALTH}" \
                                    label.color="$BLUE" \
                                    label.font="size=11")
  fi
  
  sketchybar -m "${args[@]}" > /dev/null
}

if [ "$BUTTON" = "right" ] || [ "$MODIFIER" = "shift" ]; then
  toggle_battery_info
else
  toggle_detail
fi
