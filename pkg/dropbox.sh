#!/bin/sh

if dpkg -l dropbox ; then
    wget https://www.dropbox.com/download?dl=packages/ubuntu/dropbox_1.6.0_amd64.deb -O dropbox_amd64.deb
    sudo dpkg -i dropbox_amd64.deb
    rm dropbox_amd64.deb
fi
