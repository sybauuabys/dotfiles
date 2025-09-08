#!/usr/bin/env bash

# Catppuccin Mocha colors
BLUE=0xff89b4fa
TEXT=0xffcdd6f4

# The volume_change event supplies a $INFO variable with the current volume percentage
if [[ "$SENDER" = "volume_change" ]]; then
    VOLUME="$INFO"
    
    # Choose icon based on volume level
    case "$VOLUME" in
        [7-9][0-9]|100)
            ICON="󰕾"  # High volume
            ;;
        [4-6][0-9])
            ICON="󰖀"  # Medium volume  
            ;;
        [1-3][0-9])
            ICON="󰕿"  # Low volume
            ;;
        0)
            ICON="󰖁"  # Muted
            ;;
        *)
            ICON="󰕾"  # Default
            ;;
    esac
    
    # Update SketchyBar item
    sketchybar --set "$NAME" \
        icon="$ICON" \
        icon.color=$BLUE \
        label="${VOLUME}%" \
        label.color=$TEXT
fi
