#!/bin/sh

echo "installing...."

dpkg -l google-chrome-stable
if [ $? -ne 0 ]
then
  wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
  sudo dpkg -i google-chrome-stable_current_amd64.deb
  rm google-chrome-stable_current_amd64.deb
fi

dpkg -l dropbox
if [ $? -ne 0 ]
then
  wget https://www.dropbox.com/download?dl=packages/ubuntu/dropbox_1.6.0_amd64.deb -O dropbox_amd64.deb
  sudo dpkg -i dropbox_amd64.deb
  rm dropbox_amd64.deb
fi

sudo apt-get -f install

sudo apt-get -y install\
 build-essential\
 google-chrome-stable\
 dropbox\
 git gitk\
 zsh\
 lv\
 rlwrap\
 tmux\
 vim emacs\
 fcitx-mozc\
 curl libcurl4-openssl-dev\
 libreadline6-dev\
 bison\
 sqlite3 libsqlite3-dev\
 libxml2 libxml2-dev\
 libxslt1.1 libxslt1-dev\
 openssh-server libssl-dev\
 nkf\
 openjdk-7-jre openjdk-7-jre-headless openjdk-7-jdk\
 libv8-dev\
 compizconfig-settings-manager\
 convmv\
 libdbus-glib-1-dev\
 mysql-server libmysql++-dev\
 xsel\
 libsasl2-dev\
 imagemagick libmagickcore-dev\
 libav-tools\
 colordiff

#gconftool-2 -s "/apps/metacity/general/button_layout" -t string "menu:minimize,maximize,close"

if [ ! -e $HOME/.fonts ] ; then
    mkdir $HOME/.fonts
fi

if [ ! -e $HOME/.oh-my-zsh ] ; then
    curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
fi
cp `dirname $0`/Ricty-* $HOME/.fonts
#fc-cache
sh `dirname $0`/update.sh
