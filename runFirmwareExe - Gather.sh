#!/bin/sh

USB_DIR="$(dirname "$0")"
LOGFILE1="$USB_DIR/log-files-usr_data.txt"
LOGFILE2="$USB_DIR/log-folders-usr_data-pre.txt"
LOGFILE3="$USB_DIR/log-disk-pre.txt"
LOGFILE4="$USB_DIR/log-find.txt"
LOGFILE5="$USB_DIR/log-disk-post.txt"
LOGFILE6="$USB_DIR/log-folders-usr-post.txt"
LOGFILE7="$USB_DIR/log-files-etc.txt"
LOGFILE8="$USB_DIR/log-folders-etc.txt"
LOGFILE9="$USB_DIR/log-files-usr_prog.txt"
LOGFILE10="$USB_DIR/log-folders-usr_prog.txt"
LOGFILE11="$USB_DIR/log-folders-docs.txt"

echo "Collecting files in /usr/prog recursively..." >> "$LOGFILE9"
echo "Collecting folders in /usr/prog recursively..." >> "$LOGFILE10"
du -ah /usr/prog >> "$LOGFILE9" 2>&1
du -h  /usr/prog >> "$LOGFILE10" 2>&1

echo "Collecting files in /usr/data recursively..." >> "$LOGFILE1"
echo "Collecting folders in /usr/data recursively..." >> "$LOGFILE2"
du -ah /usr/data >> "$LOGFILE1" 2>&1
du -h  /usr/data >> "$LOGFILE2" 2>&1

echo "Collecting files in /etc recursively..." >> "$LOGFILE7"
echo "Collecting folders in /etc recursively..." >> "$LOGFILE8"
du -ah /etc >> "$LOGFILE7" 2>&1
du -h  /etc  >> "$LOGFILE8" 2>&1

echo "Checking sizes of storage..." >> "$LOGFILE3"
df -h >> "$LOGFILE3" 2>&1

sync
exit 1
