#!/bin/bash

STATE_FILE="$HOME/.config/sketchybar/.external_spaces_state"
COLORS="$HOME/.config/sketchybar/colors.sh"
[ -f "$COLORS" ] && source "$COLORS"

mkdir -p "$(dirname "$STATE_FILE")"

current_state="on"
if [ -f "$STATE_FILE" ]; then
  current_state=$(cat "$STATE_FILE" 2>/dev/null)
  [ -z "$current_state" ] && current_state="on"
fi

if [ "$current_state" = "off" ]; then
  new_state="on"
  icon_color=${GRUVBOX_BRIGHT_BLUE:-0xff83a598}
else
  new_state="off"
  icon_color=${GRUVBOX_FG4:-0xffa89984}
fi

echo "$new_state" > "$STATE_FILE"

sketchybar --animate tanh 20 --set external_spaces_toggle icon.color=$icon_color

# Trigger Aerospace plugin to refresh visibility immediately
sketchybar --trigger external_spaces_visibility_changed
sketchybar --trigger aerospace_workspace_change

