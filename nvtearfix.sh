#!/bin/bash
# ==============================================================
#                      - nvtearfix.sh -
# Fixes linux screen tearing issue with Nvidia PRIME displays
# ==============================================================

FILE=/etc/modprobe.d/nvidia-drm-nomodeset.conf

# determine if nvidia-drm-nomodeset.conf exists
if test -f "$FILE"; 
then
    printf "$FILE exists.\n"
    printf "Would you like to overwrite the file? [W] WARNING: deletes all file content\n"
    printf "Would you like to append to the file? [A] \n\n" 
    read -p 'Enter your selection: ' writemethod
else
    printf "$FILE does not exist and will be created.\n"
    writemethod='W'
fi

# write or append depending on conditions and input
if [ "$writemethod" == 'W' ];
then
    printf "Writing to $FILE\n"
    printf 'options nvidia-drm modeset=1\n' > $FILE
else
    printf "Appending to $FILE\n"
    printf 'options nvidia-drm modeset=1\n' >> $FILE
fi

# update intramfs
sudo update-initramfs -u

# prompt reboot and verify
printf "\nReboot system for changes to take effect.\n-> sudo reboot now\n"
printf "After reboot run verify script to insure changes worked.\n-> sudo ./verify.sh\n"
exit 0