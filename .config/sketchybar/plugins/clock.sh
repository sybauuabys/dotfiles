#!/usr/bin/env bash

# Catppuccin Mocha colors
LAVENDER=0xffb4befe
TEXT=0xffcdd6f4

# Update clock with current date and time
sketchybar --set "$NAME" \
    icon="󰥔" \
    icon.color=$LAVENDER \
    label="$(date '+%a %b %-d %-I:%M %p')"
    label.color=$TEXT
