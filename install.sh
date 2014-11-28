#!/bin/sh

echo "installing...."
basename=`dirname $0`

$basename/pkg/chrome
$basename/pkg/dropbox
$basename/pkg/heroku

sudo apt-get update
sudo apt-get -y upgrade
sudo apt-get -y dist-upgrade
sudo apt-get autoremove

$basename/install/packages
$basename/install/ruby
$basename/install/go
$basename/install/ghq
$basename/install/hub
$basename/install/fonts
$basename/install/oh-my-zsh

$basename/update.sh
