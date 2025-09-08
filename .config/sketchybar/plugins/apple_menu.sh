#!/usr/bin/env bash

# Catppuccin Mocha colors
GREEN=0xffa6e3a1
BLUE=0xff89b4fa
YELLOW=0xfff9e2af
ORANGE=0xfffab387
RED=0xfff38ba8
TEXT=0xffcdd6f4
SURFACE0=0xff313244
SURFACE1=0xff45475a

# Handle different actions based on the item clicked
case "$NAME" in
    "apple_prefs")
        # Open System Preferences/Settings
        if [[ -d "/Applications/System Preferences.app" ]]; then
            open -a "System Preferences"
        else
            open -a "System Settings"  # macOS Ventura+
        fi
        sketchybar --set apple_logo popup.drawing=off
        ;;
    "apple_sleep")
        # Put system to sleep
        pmset sleepnow
        sketchybar --set apple_logo popup.drawing=off
        ;;
    "apple_restart")
        # Show confirmation and restart
        result=$(osascript -e 'display dialog "Are you sure you want to restart?" buttons {"Cancel", "Restart"} default button "Cancel"' 2>/dev/null)
        if [[ $result == *"Restart"* ]]; then
            osascript -e 'tell app "System Events" to restart'
        fi
        sketchybar --set apple_logo popup.drawing=off
        ;;
    "apple_shutdown")
        # Show confirmation and shutdown
        result=$(osascript -e 'display dialog "Are you sure you want to shut down?" buttons {"Cancel", "Shut Down"} default button "Cancel"' 2>/dev/null)
        if [[ $result == *"Shut Down"* ]]; then
            osascript -e 'tell app "System Events" to shut down'
        fi
        sketchybar --set apple_logo popup.drawing=off
        ;;
    "apple_logo")
        # Toggle popup when clicking the logo
        sketchybar --set apple_logo popup.drawing=toggle
        ;;
    *)
        # Default case - create popup menu
        sketchybar --add item apple_prefs popup.apple_logo \
                   --set apple_prefs \
                         icon="󰒓" \
                         icon.color=$BLUE \
                         label="Settings" \
                         label.color=$TEXT \
                         click_script="$0 apple_prefs" \
                   --add item apple_sleep popup.apple_logo \
                   --set apple_sleep \
                         icon="󰒲" \
                         icon.color=$YELLOW \
                         label="Sleep" \
                         label.color=$TEXT \
                         click_script="$0 apple_sleep" \
                   --add item apple_restart popup.apple_logo \
                   --set apple_restart \
                         icon="󰜉" \
                         icon.color=$ORANGE \
                         label="Restart" \
                         label.color=$TEXT \
                         click_script="$0 apple_restart" \
                   --add item apple_shutdown popup.apple_logo \
                   --set apple_shutdown \
                         icon="󰐥" \
                         icon.color=$RED \
                         label="Shutdown" \
                         label.color=$TEXT \
                         click_script="$0 apple_shutdown"
        
        # Set popup properties
        sketchybar --set apple_logo popup.background.color=$SURFACE0 \
                                   popup.background.corner_radius=8 \
                                   popup.background.border_width=1 \
                                   popup.background.border_color=$SURFACE1 \
                                   popup.drawing=toggle
        ;;
esac
