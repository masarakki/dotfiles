#!/bin/sh

echo "installing...."
basename=`dirname $0`

sh $basename/pkg/chrome.sh
sh $basename/pkg/dropbox.sh
sh $basename/pkg/heroku.sh

sudo apt-get update
sudo apt-get -y upgrade
sudo apt-get -y dist-upgrade
sudo apt-get autoremove

sh $basename/install/packages.sh
sh $basename/install/gvm.sh
sh $basename/install/rvm.sh
sh $basename/install/ghq.sh
sh $basename/install/hub.sh
sh $basename/install/fonts.sh
sh $basename/install/oh-my-zsh.sh

sh $basename/update.sh
