#!/bin/zsh

export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin
setxkbmap -option ctrl:nocaps

logi_id=`xinput list | grep 'Logitech MX Vertical' | grep pointer | cut -f 2 | cut -f 2 -d '='`
if [ $logi_id -gt 0 ]; then
    xinput set-button-map $logi_id {1..7} 2 {9..20}
fi
