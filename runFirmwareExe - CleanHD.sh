#!/bin/sh

USB_DIR="$(dirname "$0")"
LOGFILE1="$USB_DIR/log-files-pre-usr_data.txt"
LOGFILE2="$USB_DIR/log-folders-pre-usr_data.txt"
LOGFILE3="$USB_DIR/log-disk-pre.txt"
LOGFILE4="$USB_DIR/log-disk-post.txt"
LOGFILE5=""
LOGFILE6="$USB_DIR/log-folders-post-usr_prog.txt"
LOGFILE7="$USB_DIR/log-files-pre-etc.txt"
LOGFILE8="$USB_DIR/log-folders-pre-etc.txt"
LOGFILE9="$USB_DIR/log-files-pre-usr_prog.txt"
LOGFILE10="$USB_DIR/log-folders-pre-usr_prog.txt"
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

echo "Checking sizes of storage before..." >> "$LOGFILE3"
df -h >> "$LOGFILE3" 2>&1

echo "Removing Files /usr/data recursively..." >> "$LOGFILE6"
rm -rf ./usr/data/anvil/*
rm -rf ./usr/data/anvil-data/*
rm -rf ./usr/data/home/pwned/.cache/* 
rm -rf ./usr/data/home/pwned/*
rm -rf ./usr/data/anvil-data/* 
rm -rf ./usr/data/zmod/*
rm -rf ./usr/data/.mod/.zmod/*
rm -rf ./usr/data/*.tar.xz
rm -rf ./usr/data/bin/opt/var/cache/*
rm -rf ./usr/data/logs/*
rm -rf ./usr/data/update/*
rm -rf ./usr/prog/moonraker/moonraker-old2/*
rm -rf ./usr/prog/moonraker/moonraker-env-old2/*
rm -rf ./usr/prog/moonraker/moonraker-old/*
rm -rf ./usr/prog/moonraker/moonraker-env-old/*
du -h /usr/data >> "$LOGFILE6" 2>&1

echo "Removing Folders /usr/data recursively..." >> "$LOGFILE6"
rm -rf /usr/data/anvil
rm -rf /usr/data/anvil-data
rm -rf /usr/data/anvil-timelapse 
rm -rf /usr/data/home/pwned/.cache 
rm -rf /usr/data/home/pwned
rm -rf /usr/data/anvil-data 
rm -rf /usr/data/zmod/
rm -rf /usr/data/.mod/.zmod
rm -rf /usr/prog/moonraker/moonraker-old2
rm -rf /usr/prog/moonraker/moonraker-env-old2
rm -rf /usr/prog/moonraker/moonraker-old
rm -rf /usr/prog/moonraker/moonraker-env-old
du -h /usr/data >> "$LOGFILE6" 2>&1

echo "Removing non-Essential Documentation..." >> "$LOGFILE11"
rm -rf /usr/prog/klipper/docs/
rm -rf /usr/prog/openssl-1.0.2d/man/
rm -rf /usr/prog/ffmpeg-4.0.2/share/man/ 
rm -rf /usr/prog/libzip-1.10.1/share/man/
echo "  /usr/prog/klipper/docs/" >> "$LOGFILE11"
echo "  /usr/prog/openssl-1.0.2d/man/" >> "$LOGFILE11"
echo "  /usr/prog/ffmpeg-4.0.2/share/man/" >> "$LOGFILE11"
echo "  /usr/prog/libzip-1.10.1/share/man/" >> "$LOGFILE11"

echo "Checking sizes of storage after..." >> "$LOGFILE4"
df -h >> "$LOGFILE4" 2>&1

sync
exit 1
