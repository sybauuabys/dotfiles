#!/usr/bin/env bash

# Catppuccin Mocha colors
BLUE=0xff89b4fa
TEXT=0xffcdd6f4
SUBTEXT=0xffa6adc8

# Get the current front application
get_front_app() {
    # Try yabai first if available
    if command -v yabai &> /dev/null; then
        local APP_NAME=$(yabai -m query --windows --window 2>/dev/null | jq -r '.app // empty' 2>/dev/null)
        if [[ -n "$APP_NAME" && "$APP_NAME" != "null" && "$APP_NAME" != "empty" ]]; then
            echo "$APP_NAME"
            return 0
        fi
    fi
    
    # Fallback to AppleScript
    local APP_NAME=$(osascript -e 'tell application "System Events" to get name of first application process whose frontmost is true' 2>/dev/null)
    if [[ -n "$APP_NAME" ]]; then
        echo "$APP_NAME"
        return 0
    fi
    
    echo "Desktop"
    return 1
}

APP_NAME=$(get_front_app)

# Handle special cases and clean up app names
case "$APP_NAME" in
    "")
        APP_NAME="Desktop"
        ;;
    "Finder")
        APP_NAME="Finder"
        ;;
    "System Preferences"|"System Settings")
        APP_NAME="Settings"
        ;;
    "Activity Monitor")
        APP_NAME="Activity"
        ;;
    "Google Chrome")
        APP_NAME="Chrome"
        ;;
    "Microsoft Edge")
        APP_NAME="Edge"
        ;;
    "Visual Studio Code")
        APP_NAME="VS Code"
        ;;
    "WezTerm")
        APP_NAME="WezTerm"
        ;;
    "Arc")
        APP_NAME="Arc"
        ;;
    "Notion")
        APP_NAME="Notion"
        ;;
    "Spotify")
        APP_NAME="Spotify"
        ;;
    "Vivaldi")
        APP_NAME="Vivaldi"
        ;;
    "qutebrowser")
        APP_NAME="Qute"
        ;;
    *)
        # Truncate long app names
        if [[ ${#APP_NAME} -gt 20 ]]; then
            APP_NAME="${APP_NAME:0:17}..."
        fi
        ;;
esac

# Set app-specific icons
get_app_icon() {
    case "$1" in
        "Finder") echo "󰉋" ;;
        "Chrome"|"Arc"|"Safari"|"Firefox"|"Vivaldi"|"Qute") echo "󰖟" ;;
        "VS Code"|"Cursor"|"Sublime Text") echo "󰨞" ;;
        "Terminal"|"WezTerm"|"Warp"|"iTerm2") echo "󰆍" ;;
        "Spotify") echo "󰓇" ;;
        "Discord") echo "󰙯" ;;
        "Settings") echo "󰒓" ;;
        "Activity") echo "󰊪" ;;
        "Notion") echo "󰈙" ;;
        "Desktop") echo "󰍹" ;;
        *) echo "󰣇" ;;
    esac
}

ICON=$(get_app_icon "$APP_NAME")

# Update the SketchyBar item
sketchybar --set "$NAME" \
    icon="$ICON" \
    icon.color=$BLUE \
    label="$APP_NAME" \
    label.color=$TEXT
