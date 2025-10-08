
#!/bin/bash
# Resume suspended tabs with rofi (macOS + XQuartz)
# File: ~/.qutebrowser/userscripts/resume.sh

suspended_file="$HOME/.qutebrowser/suspended-tabs.txt"

# Ensure file exists
mkdir -p "$(dirname "$suspended_file")"
touch "$suspended_file"

# Force correct PATH (Homebrew rofi is usually in /opt/homebrew/bin on Apple Silicon, or /usr/local/bin on Intel)
export PATH="/opt/homebrew/bin:/usr/local/bin:$PATH"

# Force XQuartz display
export DISPLAY=:0

# Start XQuartz if not running
if ! pgrep -x "XQuartz" >/dev/null; then
    open -a XQuartz
    # wait a bit longer for XQuartz to initialize sockets
    sleep 2
fi

# DEBUG: log environment (optional, for troubleshooting)
env > "$HOME/.qutebrowser/resume_env.log"

# Use rofi to pick a tab
choice=$(cat "$suspended_file" | rofi -dmenu -i -p "Resume tab:" 2>>"$HOME/.qutebrowser/resume_error.log")

# If nothing picked, exit
[ -z "$choice" ] && exit 0

# Extract URL (after '|')
url=$(echo "$choice" | awk -F'|' '{print $NF}' | xargs)

# Open in new tab
echo "open -t $url" >> "$QUTE_FIFO"

# Remove restored tab
grep -vF "$choice" "$suspended_file" > "${suspended_file}.tmp"
mv "${suspended_file}.tmp" "$suspended_file"
