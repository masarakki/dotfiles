#!/bin/sh

if dpkg -l heroku ; then
    wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh
fi
