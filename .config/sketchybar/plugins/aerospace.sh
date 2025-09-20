#!/bin/bash

source "$HOME/.config/sketchybar/colors.sh"
source "$HOME/.config/sketchybar/icons.sh"

# Get current aerospace workspace
CURRENT_WORKSPACE=$(aerospace list-workspaces --focused 2>/dev/null | head -n1)

# Get all workspaces in the correct order from aerospace.toml
AEROSPACE_CONFIG="$HOME/.config/aerospace/aerospace.toml"
if [ -f "$AEROSPACE_CONFIG" ]; then
  # Extract workspace names from aerospace.toml in the order they appear
  ALL_WORKSPACES=$(grep -E "alt-[uiop] = 'workspace [uiop]'" "$AEROSPACE_CONFIG" | sed "s/.*'workspace //" | sed "s/'//" | tr '\n' ' ' | sed 's/ $//')
else
  # Fallback to default order if config file not found
  ALL_WORKSPACES="u i o p"
fi

update_workspace_display() {
  args=()
  
  # Update each workspace item
  for workspace in $ALL_WORKSPACES; do
    if [ "$workspace" = "$CURRENT_WORKSPACE" ]; then
      # Current workspace - highlight it
      args+=(--set space.$workspace background.drawing=on background.color=$BACKGROUND_2 icon.color=$RED)
    else
      # Other workspaces - dim them
      args+=(--set space.$workspace background.drawing=off icon.color=$WHITE)
    fi
  done
  
  if [ ${#args[@]} -gt 0 ]; then
    sketchybar -m "${args[@]}"
  fi
}

mouse_clicked() {
  if [ "$BUTTON" = "right" ]; then
    # Right click - destroy workspace (if aerospace supports it)
    aerospace workspace --close $SID 2>/dev/null || true
    sketchybar --trigger aerospace_workspace_change
  else
    # Left click - focus workspace
    aerospace workspace $SID 2>/dev/null
  fi
}

case "$SENDER" in
  "mouse.clicked") mouse_clicked
  ;;
  "aerospace_workspace_change") update_workspace_display
  ;;
  "forced") update_workspace_display
  ;;
  *) update_workspace_display
  ;;
esac

