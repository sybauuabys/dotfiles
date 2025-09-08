#!/usr/bin/env bash

# Catppuccin Mocha colors
BASE=0xff1e1e2e
MANTLE=0xff181825
CRUST=0xff11111b
TEXT=0xffcdd6f4
SUBTEXT=0xffa6adc8
SURFACE0=0xff313244
SURFACE1=0xff45475a
OVERLAY0=0xff6c7086
LAVENDER=0xffb4befe
MAUVE=0xffcba6f7
BLUE=0xff89b4fa
GREEN=0xffa6e3a1

# Get focused workspace
FOCUSED=$(aerospace list-workspaces --focused 2>/dev/null)

# Define workspaces in order (matching your AeroSpace config)
WORKSPACES=(u i o p)

# Exit if no focused workspace found
[[ -z "$FOCUSED" ]] && exit 0

# Update each workspace
for ws in "${WORKSPACES[@]}"; do
    # Get windows count for this workspace
    WINDOWS_COUNT=$(aerospace list-windows --workspace "$ws" 2>/dev/null | wc -l | tr -d ' ')
    
    if [[ "$ws" == "$FOCUSED" ]]; then
        # Focused workspace styling
        sketchybar --set space.$ws \
            background.drawing=on \
            background.color=$MAUVE \
            background.corner_radius=8 \
            background.height=26 \
            label="$ws" \
            label.color=$BASE \
            label.font="JetBrainsMono Nerd Font:Bold:14.0" \
            icon.drawing=off \
            padding_left=10 \
            padding_right=10
    elif [[ $WINDOWS_COUNT -gt 0 ]]; then
        # Workspace has windows but not focused
        sketchybar --set space.$ws \
            background.drawing=on \
            background.color=$SURFACE0 \
            background.corner_radius=6 \
            background.height=22 \
            label="$ws" \
            label.color=$TEXT \
            label.font="JetBrainsMono Nerd Font:Medium:14.0" \
            icon.drawing=off \
            padding_left=8 \
            padding_right=8
    else
        # Empty workspace
        sketchybar --set space.$ws \
            background.drawing=on \
            background.color=$SURFACE1 \
            background.corner_radius=6 \
            background.height=22 \
            label="$ws" \
            label.color=$SUBTEXT \
            label.font="JetBrainsMono Nerd Font:Regular:14.0" \
            icon.drawing=off \
            padding_left=8 \
            padding_right=8
    fi
done
