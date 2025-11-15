#!/bin/bash
# Backup shell script 

SRC="$1"
DEST="$HOME/backups"
TIME=$(date +"%Y%m%d_%H%M%S")
FILE="$DEST/backup_$TIME.tar.gz"

[ -z "$SRC" ] && echo "Usage: $0 <directory>" && exit 1
[ ! -d "$SRC" ] && echo "Directory not found!" && exit 1

mkdir -p "$DEST"
tar -czf "$FILE" "$SRC" && echo "Backup saved at $FILE"
