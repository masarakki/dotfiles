#!/bin/sh

if ! dpkg -l google-chrome-stable > /dev/null 2>&1 ; then
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    sudo dpkg -i google-chrome-stable_current_amd64.deb
    rm google-chrome-stable_current_amd64.deb
fi
