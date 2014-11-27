#!/bin/sh

if [ ! -e $HOME/.fonts ] ; then
    mkdir $HOME/.fonts
fi
cp `dirname $0`/../fonts/Ricty-* $HOME/.fonts
