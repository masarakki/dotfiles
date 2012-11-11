#!/bin/sh

echo "installing...."

sudo apt-get -y install\
 git gitk\
 zsh\
 autoconf2.13\
 lv\
 rlwrap\
 tmux\
 vim emacs\
 curl libcurl3 libcurl4-openssl-dev\
 chromium-browser\
 ibus-mozc\
 libreadline6-dev\
 bison\
 sqlite3 libsqlite3-dev\
 libxml2 libxml2-dev\
 libxslt1.1 libxslt1-dev\
 openssh-server libssl-dev\
 yaml-mode\
 nkf\
 openjdk-7-jre openjdk-7-jre-headless openjdk-7-jdk\
 scala scala-library\
 libv8-dev\
 tk8.5\
 arduino\
 eclipse\
 g++\
 gauche\
 coffeescript\
 xchat\
 compizconfig-settings-manager\
 convmv\
 libdbus-glib-1-dev\
 mysql-server libmysql++-dev\
 xsel\
 libsasl2-dev\
 imagemagick libmagickcore-dev\
 ffmpeg libavcodec-extra-53\
 redis-server\
 colordiff

#gconftool-2 -s "/apps/metacity/general/button_layout" -t string "menu:minimize,maximize,close"

if [ ! -e $HOME/.rvm ] ; then
    echo "install ruby..."
    $RUBY_VERSION=ruby-1.9.3
    curl -L get.rvm.io | bash -s stable
    source $HOME/.rvm/script/rvm
    rvm install $RUBY_VERION
    rvm use --default $RUBY_VERSION
fi

if [ ! -e $HOME/.fonts ] ; then
    mkdir $HOME/.fonts
fi

if [ ! -e $HOME/.oh-my-zsh ] ; then
    curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
fi
cp `dirname $0`/Ricty-* $HOME/.fonts
#fc-cache
sh `dirname $0`/update.sh
