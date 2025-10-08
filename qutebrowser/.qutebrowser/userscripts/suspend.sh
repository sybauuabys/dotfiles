
#!/bin/bash
# Suspend current tab (save URL) in qutebrowser
# File: ~/.qutebrowser/userscripts/suspend.sh

suspended_file="$HOME/.qutebrowser/suspended-tabs.txt"

# Ensure file exists
mkdir -p "$(dirname "$suspended_file")"
touch "$suspended_file"

# Append title + URL
if [ -n "$QUTE_URL" ] && [ -n "$QUTE_TITLE" ]; then
    echo "$QUTE_TITLE | $QUTE_URL" >> "$suspended_file"
    echo "tab-close" >> "$QUTE_FIFO"
else
    echo "message-error 'No active tab detected!'" >> "$QUTE_FIFO"
fi
