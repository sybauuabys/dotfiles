#!/usr/bin/env bash

# Catppuccin Mocha colors
GREEN=0xffa6e3a1
YELLOW=0xfff9e2af
ORANGE=0xfffab387
RED=0xfff38ba8
TEXT=0xffcdd6f4

# Get battery percentage and charging status
PERCENTAGE=$(pmset -g batt | grep -Eo '\d+%' | cut -d% -f1)
CHARGING=$(pmset -g batt | grep 'AC Power')

# Exit if percentage not found
if [[ -z "$PERCENTAGE" ]]; then
    exit 0
fi

# Choose icon and color based on percentage
case $PERCENTAGE in
    9[0-9]|100)
        ICON="󰁹"  # Full battery
        ICON_COLOR=$GREEN
        ;;
    8[0-9])
        ICON="󰂂"  # High battery
        ICON_COLOR=$GREEN
        ;;
    7[0-9])
        ICON="󰂁"  # Good battery
        ICON_COLOR=$GREEN
        ;;
    6[0-9])
        ICON="󰂀"  # Medium-high battery
        ICON_COLOR=$TEXT
        ;;
    5[0-9])
        ICON="󰁿"  # Medium battery
        ICON_COLOR=$TEXT
        ;;
    4[0-9])
        ICON="󰁾"  # Medium-low battery
        ICON_COLOR=$YELLOW
        ;;
    3[0-9])
        ICON="󰁽"  # Low battery
        ICON_COLOR=$YELLOW
        ;;
    2[0-9])
        ICON="󰁼"  # Very low battery
        ICON_COLOR=$ORANGE
        ;;
    1[0-9])
        ICON="󰁻"  # Critical battery
        ICON_COLOR=$RED
        ;;
    *)
        ICON="󰂎"  # Empty battery
        ICON_COLOR=$RED
        ;;
esac

# Override with charging icon if plugged in
if [[ -n "$CHARGING" ]]; then
    ICON="󰂄"  # Charging bolt
    ICON_COLOR=$GREEN
fi

# Update SketchyBar item
sketchybar --set "$NAME" \
    icon="$ICON" \
    icon.color=$ICON_COLOR \
    label="${PERCENTAGE}%" \
    label.color=$TEXT
