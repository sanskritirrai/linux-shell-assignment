#!/bin/bash
#Download Code

URL="$1"
DEST="$HOME/downloads"

[ -z "$URL" ] && echo "Usage: $0 <url>" && exit 1
mkdir -p "$DEST"
FILE=$(basename "$URL")

if command -v wget &>/dev/null; then
  wget -q -O "$DEST/$FILE" "$URL"
else
  curl -s -L -o "$DEST/$FILE" "$URL"
fi

[ -f "$DEST/$FILE" ] && echo "Saved to $DEST/$FILE" || echo "Download failed."
