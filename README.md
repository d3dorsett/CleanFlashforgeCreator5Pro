This is a rough script, but it does what I need it to do.

On my Flashforge Creator 5 Pro, I experimented with different firmware modifications, including Reforge and Z-Mod. When I tried to restore the printer to factory firmware, I ran out of storage space and encountered this error:

```text
tar: write error: No space left on device
```

I developed this script specifically for my own Flashforge Creator 5 Pro. It removes Reforge firmware files, Z-Mod firmware, old Moonraker directories, all `.stl`, `.m3f`, and `.mp4` files, and several online manuals to free up storage space.

## How to Use

1. Format a USB drive as FAT32, just as you would for a firmware upgrade.
2. Copy the script to the USB drive and name it `runFirmwareExe.sh`.
3. Power off the printer and insert the USB drive.
4. Power on the printer and wait approximately five minutes for the script to run.

The script provides two options:

- **`runFirmwareExe - Gather.sh`** — Collects a list of existing files and directories and saves the list to the USB drive for review.
- **`runFirmwareExe - CleanHD.sh`** — Deletes Reforge firmware files, Z-Mod firmware, old Moonraker directories, all `.stl`, `.m3f`, and `.mp4` files, and several online manuals.

**Windows Notepad users:** Save the script with UTF-8 encoding and Unix-style LF line endings. Windows-style CRLF line endings may prevent the script from running correctly.

After running the script, review the generated file lists to see what existed before and after cleanup. The cleanup option deletes files and directories, so review its targets carefully before proceeding.

Once everything has been deleted, flash the printer with z-mod's Universal unbricker for FF5M / FF5MPro / AD5X / Creator 5 / Creator 5 Pro
https://wiki.zmod.link/Native_FW/?h=universal#creator-5-pro-stock-firmware

**There are no safeguards against deleting files you may need. Use at your own risk.**

Enjoy!
—D3
