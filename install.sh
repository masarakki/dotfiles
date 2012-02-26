#!/bin/sh

echo "installing...."

sudo apt-get -y install git gitk emacs lv rlwrap tmux vim curl libcurl3 chromium-browser ibus-mozc libreadline6-dev bison sqlite3 libsqlite3-dev libxml2 libxml2-dev libxslt1.1 libxslt1-dev openssh-server libssl-dev gauche yaml-mode nkf openjdk-7-jre-headless openjdk-7-jdk scala scala-library libv8-dev tk8.5 arduino openjdk-7-jdk openjdk-7-jre eclipse g++ xchat compizconfig-settings-manager convmv coffeescript

gconftool-2 -s "/apps/metacity/general/button_layout" -t string "menu:minimize,maximize,close"

if [ ! -e $HOME/.rvm ] ; then
    echo "install ruby..."
    $RUBY_VERSION=ruby-1.9.3
    curl -s https://raw.github.com/wayneeseguin/rvm/master/binscripts/rvm-installer | bash -s stable
    source $HOME/.rvm/script/rvm
    rvm install $RUBY_VERION
    rvm use --default $RUBY_VERSION
fi

if [ ! -e /usr/share/fonts/truetype/ttf-ricty ] ; then
    sudo mkdir /usr/share/fonts/truetype/ttf-ricty
fi
sudo cp `dirname $0`/Ricty-* /usr/share/fonts/truetype/ttf-ricty

sh `dirname $0`/update.sh
