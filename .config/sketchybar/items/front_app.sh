#!/bin/bash

FRONT_APP_SCRIPT='ICON_NAME=$($HOME/.config/sketchybar/plugins/icon_map.sh "$INFO"); ICON=$($HOME/.config/sketchybar/plugins/icon_resolver.sh "$ICON_NAME"); sketchybar --set $NAME label="$INFO" icon="$ICON"'

aerospace=(
  script="$PLUGIN_DIR/aerospace.sh"
  icon.font="$FONT:Bold:16.0"
  label.drawing=off
  icon.width=30
  icon=$YABAI_GRID
  icon.color=$ORANGE
  associated_display=active
)

front_app=(
  script="$FRONT_APP_SCRIPT"
  icon.drawing=off
  padding_left=0
  label.color=$WHITE
  label.font="$FONT:Black:16.0"
  associated_display=active
)

sketchybar --add event aerospace_workspace_change \
           --add item aerospace left              \
           --set aerospace "${aerospace[@]}"      \
           --subscribe aerospace aerospace_workspace_change \
                             mouse.clicked        \
                             front_app_switched   \
                                               \
           --add item front_app left           \
           --set front_app "${front_app[@]}"   \
           --subscribe front_app front_app_switched

