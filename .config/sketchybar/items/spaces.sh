#!/bin/bash

# Get aerospace workspaces in the correct order from aerospace.toml
# This reads the workspace order from the aerospace config file
AEROSPACE_CONFIG="$HOME/.config/aerospace/aerospace.toml"
if [ -f "$AEROSPACE_CONFIG" ]; then
  # Extract workspace names from aerospace.toml in the order they appear
  AEROSPACE_WORKSPACES=$(grep -E "alt-[uiop] = 'workspace [uiop]'" "$AEROSPACE_CONFIG" | sed "s/.*'workspace //" | sed "s/'//" | tr '\n' ' ' | sed 's/ $//')
else
  # Fallback to default order if config file not found
  AEROSPACE_WORKSPACES="u i o p"
fi

# Destroy space on right click, focus space on left click.
# New space by left clicking separator (>)

spaces=()
workspace_count=0
total_workspaces=$(echo $AEROSPACE_WORKSPACES | wc -w)

for workspace in $AEROSPACE_WORKSPACES
do
  space=(
    icon=$workspace
    icon.padding_left=10
    icon.padding_right=15
    padding_left=2
    padding_right=2
    label.padding_right=20
    icon.highlight_color=$RED
    label.font="sketchybar-app-font:Regular:16.0"
    label.background.height=26
    label.background.drawing=on
    label.background.color=$BACKGROUND_2
    label.background.corner_radius=8
    label.drawing=off
    script="$PLUGIN_DIR/space.sh"
  )

  sketchybar --add item space.$workspace left     \
             --set space.$workspace "${space[@]}" \
             --subscribe space.$workspace mouse.clicked aerospace_workspace_change

  # Add separator between workspaces (not after the last one)
  workspace_count=$((workspace_count + 1))
  if [ $workspace_count -lt $total_workspaces ]; then
    separator_config=(
      icon="|"
      icon.font="$FONT:Regular:14.0"
      icon.color=$GREY
      padding_left=5
      padding_right=5
      label.drawing=off
      associated_display=active
    )
    
    sketchybar --add item separator.$workspace left \
               --set separator.$workspace "${separator_config[@]}"
  fi
done

spaces=(
  background.color=$BACKGROUND_1
  background.border_color=$BACKGROUND_2
  background.border_width=2
  background.drawing=on
)

separator=(
  icon=􀆊
  icon.font="$FONT:Heavy:16.0"
  padding_left=15
  padding_right=15
  label.drawing=off
  associated_display=active
  click_script='aerospace workspace --create && sketchybar --trigger aerospace_workspace_change'
  icon.color=$WHITE
)

sketchybar --add bracket spaces '/space\..*/' \
           --set spaces "${spaces[@]}"        \
                                              \
           --add item separator left          \
           --set separator "${separator[@]}"
