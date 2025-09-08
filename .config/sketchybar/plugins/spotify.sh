#!/usr/bin/env bash

# Catppuccin Mocha colors
GREEN=0xffa6e3a1
YELLOW=0xfff9e2af
TEXT=0xffcdd6f4
SUBTEXT=0xffa6adc8

# Max length for display
MAX_LENGTH=45

# Get Spotify info using different methods
get_spotify_info() {
    local track=""
    local artist=""
    local state=""
    
    # Method 1: Try osascript with Spotify
    if pgrep -x "Spotify" > /dev/null; then
        track=$(osascript -e 'tell application "Spotify" to get name of current track' 2>/dev/null)
        artist=$(osascript -e 'tell application "Spotify" to get artist of current track' 2>/dev/null)
        state=$(osascript -e 'tell application "Spotify" to get player state as string' 2>/dev/null)
        
        if [[ "$track" != "missing value" && -n "$track" ]]; then
            echo "${artist} - ${track}|${state}"
            return 0
        fi
    fi
    
    # Method 2: Try nowplaying-cli
    if command -v nowplaying-cli &> /dev/null; then
        track=$(nowplaying-cli get title 2>/dev/null)
        artist=$(nowplaying-cli get artist 2>/dev/null)
        
        if [[ -n "$track" ]]; then
            if [[ -n "$artist" ]]; then
                echo "${artist} - ${track}|playing"
            else
                echo "${track}|playing"
            fi
            return 0
        fi
    fi
    
    # Method 3: Try Music.app
    if pgrep -x "Music" > /dev/null; then
        track=$(osascript -e 'tell application "Music" to get name of current track' 2>/dev/null)
        artist=$(osascript -e 'tell application "Music" to get artist of current track' 2>/dev/null)
        state=$(osascript -e 'tell application "Music" to get player state as string' 2>/dev/null)
        
        if [[ "$track" != "missing value" && -n "$track" ]]; then
            echo "${artist} - ${track}|${state}"
            return 0
        fi
    fi
    
    return 1
}

# Handle events
case "$SENDER" in
    "mouse.clicked")
        if pgrep -x "Spotify" > /dev/null; then
            osascript -e 'tell application "Spotify" to playpause' 2>/dev/null
        elif pgrep -x "Music" > /dev/null; then
            osascript -e 'tell application "Music" to playpause' 2>/dev/null
        else
            # Try to open Spotify
            open -a "Spotify" 2>/dev/null || open -a "Music" 2>/dev/null
        fi
        ;;
    *)
        # Update display
        MEDIA_INFO=$(get_spotify_info)
        
        if [[ -n "$MEDIA_INFO" ]]; then
            IFS='|' read -r SONG_INFO STATE <<< "$MEDIA_INFO"
            
            # Truncate if too long
            if [[ ${#SONG_INFO} -gt $MAX_LENGTH ]]; then
                SONG_INFO="${SONG_INFO:0:$((MAX_LENGTH-3))}..."
            fi
            
            # Set colors based on state
            case "$STATE" in
                "paused")
                    ICON="󰏤"
                    ICON_COLOR=$YELLOW
                    LABEL_COLOR=$SUBTEXT
                    ;;
                "playing")
                    ICON="󰓇"
                    ICON_COLOR=$GREEN
                    LABEL_COLOR=$TEXT
                    ;;
                *)
                    ICON="󰓇"
                    ICON_COLOR=$GREEN
                    LABEL_COLOR=$TEXT
                    ;;
            esac
            
            sketchybar --set "$NAME" \
                icon="$ICON" \
                icon.color=$ICON_COLOR \
                label="$SONG_INFO" \
                label.color=$LABEL_COLOR
                
        else
            # No music playing
            sketchybar --set "$NAME" \
                icon="󰝚" \
                icon.color=$SUBTEXT \
                label="♪ No music" \
                label.color=$SUBTEXT
        fi
        ;;
esac
