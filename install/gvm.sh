#!/bin/sh

if [ ! -e $HOME/.rvm ] ; then
    bash < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)
    GOVERSION=go1.3.3
    $HOME/.gvm/scripts/rvm

    gvm install $GOVERSION
    gvm use $GOVERSION --default
fi
