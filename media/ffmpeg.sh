#!/bin/bash
# https://ffmpeg.org/download.html

cat /etc/os-release
osname=`cat /etc/os-release | grep NAME | head -n1 | cut -d \" -f 2`
vid=`cat /etc/os-release | grep VERSION_ID | cut -d \" -f 2 | sed 's/\.//g'`

#if Ubuntu
if [ $osname == "Ubuntu" ]; then
    if [ $((vid)) -lt 1404 ]; then
        echo "your Ubuntu version too old"
    elif [ $((vid)) -eq 1404 ]; then
        # Ubuntu – Ubuntu Multimedia for Trusty PPA. Provides static binaries from most recent release branch.
        sudo add-apt-repository ppa:mc3man/trusty-media
        sudo apt-get update
        sudo apt-get install -y ffmpeg
    else
        # Ubuntu – Official packages for Vivid, Wily, Xenial
        sudo apt-get install -y ffmpeg
    fi
fi
