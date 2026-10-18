#!/bin/sh

USB_DIR="$(dirname "$0")"

BEFORE_FILES="$USB_DIR/1-before-files.txt"
BEFORE_FOLDERS="$USB_DIR/2-before-folders.txt"
BEFORE_DISK="$USB_DIR/3-before-disk.txt"
FILES_DELETED="$USB_DIR/4-deleted-files.txt"
AFTER_DISK="$USB_DIR/5-after-disk.txt"

date > "$BEFORE_FILES"
date > "$BEFORE_FOLDERS"
date > "$BEFORE_DISK"
date > "$FILES_DELETED"
date > "$AFTER_DISK"

echo "Collecting .log, .stl, .3mf, mp4, and other files recursively..." >> "$BEFORE_FILES"
echo "Removing .log, .stl, .3mf, .mp4 and other files..." >> "$BEFORE_FILES"
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

echo "Checking sizes of storage before removal..." >> "$BEFORE_DISK"
df -h >> "$BEFORE_DISK" 2>&1

echo "Removing file types recursively..." >> "$FILES_DELETED"
find /usr -type f -name "*.log"   -print -exec rm {} + >> "$FILES_DELETED" 2>&1
find /usr -type f -name "*.stl"   -print -exec rm {} + >> "$FILES_DELETED" 2>&1
find /usr -type f -name "*.3mf"   -print -exec rm {} + >> "$FILES_DELETED" 2>&1
find /usr -type f -name "*.gcode" -print -exec rm {} + >> "$FILES_DELETED" 2>&1
find /usr -type f -name "*.mp4"   -print -exec rm {} + >> "$FILES_DELETED" 2>&1
find /sur -type f -name "*.tar.xz"   -print -exec rm {} + >> "$FILES_DELETED" 2>&1

echo "Removing Folders recursively..." >> "$FILES_DELETED"
FOLDERS_TO_REMOVE="
/usr/data/anvil
/usr/data/anvil-data
/usr/data/anvil-timelapse
/usr/data/zmod
/usr/data/.mod/.zmod
/usr/data/home/pwned
/usr/prog/moonraker/moonraker-old*
/usr/prog/moonraker/moonraker-env-old*
/usr/prog/klipper/docs
/usr/prog/openssl-1.0.2d/man
/usr/prog/ffmpeg-4.0.2/share/man
/usr/prog/libzip-1.10.1/share/man
"
echo "Emptying folders (files only, folders are kept)..." >> "$FILES_DELETED"
find $FOLDERS_TO_REMOVE -print >> "$FILES_DELETED" 2>&1
rm -rf $FOLDERS_TO_REMOVE

# Folders that are kept, but the files inside are removed
echo "Emptying cache, logs, and update folders..." >> "$FILES_DELETED"
FOLDERS_TO_EMPTY="
/usr/data/bin/opt/var/cache
/usr/data/logs
/usr/data/update
"
find $FOLDERS_TO_EMPTY -type f -print -exec rm {} + >> "$FILES_DELETED" 2>&1

echo "Checking sizes of storage after..." >> "$AFTER_DISK"
df -h >> "$AFTER_DISK" 2>&1

sync
exit 1
