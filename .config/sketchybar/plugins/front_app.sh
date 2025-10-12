#!/bin/bash

# Get the current frontmost application
FRONT_APP=$(osascript -e 'tell application "System Events" to get name of first application process whose frontmost is true')

# Get icon for the application
ICON_NAME=$($HOME/.config/sketchybar/plugins/icon_map.sh "$FRONT_APP")
ICON=$($HOME/.config/sketchybar/plugins/icon_resolver.sh "$ICON_NAME")

# Update the sketchybar item
sketchybar --set $NAME label="$FRONT_APP" icon="$ICON"
