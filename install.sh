#!/bin/sh

echo "installing...."
basename=`dirname $0`

$basename/install/pre
$basename/pkg/chrome
$basename/pkg/dropbox
$basename/pkg/slack
$basename/pkg/docker
$basename/pkg/yarn
$basename/pkg/ansible

sudo apt-get update
sudo apt-get -y upgrade
sudo apt-get -y dist-upgrade
sudo apt-get autoremove

$basename/install/packages
$basename/install/yubikey
$basename/install/docker
$basename/install/anyenv
$basename/install/ruby
$basename/install/python
$basename/install/node
$basename/install/go
$basename/install/ghq
$basename/install/hub
$basename/install/fonts
$basename/install/oh-my-zsh
$basename/install/rust
$basename/install/aws
$basename/install/terraform
$basename/install/texlive

$basename/update.sh
