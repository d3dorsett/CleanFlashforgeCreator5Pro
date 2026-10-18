#!/bin/sh

USB_DIR="$(dirname "$0")"

BEFORE_FILES="$USB_DIR/1-before-files.txt"
BEFORE_FOLDERS="$USB_DIR/2-before-folders.txt"
BEFORE_DISK="$USB_DIR/3-before-disk.txt"
FILES_DELETED="$USB_DIR/4-deleted-files.txt"
AFTER_DISK="$USB_DIR/5-after-disk.txt"

echo date > "$BEFORE_FILES"
echo date > "$BEFORE_FOLDERS"
echo date > "$BEFORE_DISK"
echo date > "$FILES_DELETED"
echo date > "$AFTER_DISK"

echo "Collecting .log, .stl, .3mf, mp4, and other files recursively..." >> "$BEFORE_FILES"
find /usr -type f -name "*.log"    -print >> "$BEFORE_FILES" 2>&1
find /usr -type f -name "*.stl"    -print >> "$BEFORE_FILES" 2>&1
find /usr -type f -name "*.3mf"    -print >> "$BEFORE_FILES" 2>&1
find /usr -type f -name "*.mp4"    -print >> "$BEFORE_FILES" 2>&1
find /usr -type f -name "*.gcode"  -print >> "$BEFORE_FILES" 2>&1
find /usr -type f -name "*.tar.xz" -print >> "$BEFORE_FILES" 2>&1

echo "Collecting files in /usr/prog recursively..." >> "$BEFORE_FILES"
du -ah /usr/prog >> "$BEFORE_FILES" 2>&1
echo "Collecting files in /usr/data recursively..." >> "$BEFORE_FILES"
du -ah /usr/data >> "$BEFORE_FILES" 2>&1
echo "Collecting files in /etc recursively..." >> "$BEFORE_FILES"
du -ah /etc >> "$BEFORE_FILES" 2>&1

echo "Collecting folders in /usr/prog recursively..." >> "$BEFORE_FOLDERS"
du -h /usr/prog >> "$BEFORE_FOLDERS" 2>&1
echo "Collecting folders in /usr/data recursively..." >> "$BEFORE_FOLDERS"
du -h /usr/data >> "$BEFORE_FOLDERS" 2>&1
echo "Collecting folders in /etc recursively..." >> "$BEFORE_FOLDERS"
du -h /etc >> "$BEFORE_FOLDERS" 2>&1

echo "Checking sizes of storage before..." >> "$BEFORE_DISK"
df -h >> "$BEFORE_DISK" 2>&1

sync
exit 1
