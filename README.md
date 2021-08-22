# `nvtearfix` - Nvidia Screen Tear Fix
Fix Linux screen tearing issue with Nvidia PRIME displays

Screen tearing occurs when a video or a 3d game is not in sync with the display's refresh rate. It is an unpleasant user experience and makes scrolling, watching videos and playing games feel very "stuttery". Unfortunately, this has been a commonly occuring issue when using Ubuntu, a Nvidia GPU and Nvidia PRIME displays. This can be easily resolved by running the scripts in this repo or by running the commands under **Command Based Approach**.

To test if you are experiencing screen tearing watch this [Screen Tearing Test](https://www.youtube.com/watch?v=MfL_JkcEFbE&t=13s&ab_channel=NeonCipher)

## Usage

1. `git clone https://github.com/kingschultz21/nvtearfix`
2. `cd nvtearfix`
3. `sudo ./nvtearfix.sh` -> Follow Prompts
4. `sudo reboot now`
5. `sudo ./verify.sh`

## Command Based Approach

1. `printf 'options nvidia-drm modeset=1\n' > /etc/modprobe.d/nvidia-drm-nomodeset.conf`
2. `sudo reboot now`
3. `cat /sys/module/nvidia_drm/parameters/modeset` -> If Y is returned changes were successful