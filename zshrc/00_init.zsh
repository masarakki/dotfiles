#!/bin/zsh

export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin
setxkbmap -option ctrl:nocaps

for id in `xinput list | grep 'Logitech MX Vertical' | grep pointer | cut -f 2 | cut -f 2 -d '='`
do
    xinput set-button-map $id {1..7} 2 {9..20}
done
