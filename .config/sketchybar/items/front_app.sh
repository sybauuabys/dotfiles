#!/bin/bash

aerospace=(
  script="$PLUGIN_DIR/aerospace.sh"
  icon.font="$FONT:Bold:16.0"
  label.drawing=off
  icon.width=30
  icon=$YABAI_GRID
  icon.color=$GRUVBOX_BRIGHT_BLUE
  associated_display=active
)

front_app=(
  script="$PLUGIN_DIR/front_app.sh"
  icon.drawing=off
  padding_left=0
  label.color=$GRUVBOX_FG1
  label.font="$FONT:Black:16.0"
  associated_display=active
  update_freq=1
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

