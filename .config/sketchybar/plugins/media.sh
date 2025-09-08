
#!/usr/bin/env bash
INFO=$(nowplaying-cli get title artist | tr '\n' ' ' | sed 's/ *$//')
[ -z "$INFO" ] && INFO="No media"
sketchybar --set "$NAME" label="$INFO"
