#!/bin/bash

battery=(
  script="$PLUGIN_DIR/battery.sh"
  icon.font="$FONT:Regular:19.0"
  padding_right=5
  padding_left=0
  label.drawing=off
  update_freq=5
  updates=on
  click_script="$PLUGIN_DIR/battery_click.sh"
)

sketchybar --add item battery right      \
           --set battery "${battery[@]}" \
           --subscribe battery power_source_change system_woke mouse.entered mouse.exited mouse.clicked
