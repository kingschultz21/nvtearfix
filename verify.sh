#!/bin/bash
# ==============================================================
#                      - verify.sh -
# Verify if changes from nvtearfix.sh worked correctly.
# ==============================================================

verify=$( cat /sys/module/nvidia_drm/parameters/modeset )

if [ "$verify" == 'Y' ];
then
    printf "Nvidia modeset parameter change SUCCESS\n"
fi
exit 0

if [ "$verify" == 'N' ];
then
    printf "Nvidia modeset parameter change FAIL\n"
else
    printf "Nvidia modeset parameter change UNDETERMINED"
fi
exit 0