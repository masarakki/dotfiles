#!/bin/sh

echo "installing...."

sudo apt-get update
sudo apt-get -y upgrade
sudo apt-get -y dist-upgrade
sudo apt-get autoremove

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

dpkg -l heroku
if [ $? -ne 0 ]
then
  wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh
fi

sudo apt-get -y -f install

sudo apt-get -y install\
 build-essential texinfo autoconf automake\
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
 colordiff\
 fonts-ipafont

#gconftool-2 -s "/apps/metacity/general/button_layout" -t string "menu:minimize,maximize,close"

if [ ! -e $HOME/.fonts ] ; then
    mkdir $HOME/.fonts
fi

if [ ! -e $HOME/.oh-my-zsh ] ; then
    curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
fi
cp `dirname $0`/Ricty-* $HOME/.fonts
#fc-cache
gconftool-2 --set /apps/gnome-terminal/profiles/Default/use_system_font --type bool false
gconftool-2 --set /apps/gnome-terminal/profiles/Default/font --type string "Ricty Regular 14"
gconftool-2 --set /apps/gnome-terminal/profiles/Default/use_custom_command --type bool true
gconftool-2 --set /apps/gnome-terminal/profiles/Default/custom_command --type string "tmux"
gconftool-2 --set /apps/gnome-terminal/profiles/Default/default_size_rows --type int 28
gconftool-2 --set /apps/gnome-terminal/profiles/Default/default_size_columns --type int 108
gconftool-2 --set /apps/gnome-terminal/profiles/Default/palette --type string "#000000000000:#CCCC00000000:#4E4E9A9A0606:#C4C4A0A00000:#34346565A4A4:#757550507B7B:#060698209A9A:#D3D3D7D7CFCF:#555557575353:#EFEF29292929:#8A8AE2E23434:#FCFCE9E94F4F:#72729F9FCFCF:#ADAD7F7FA8A8:#3434E2E2E2E2:#EEEEEEEEECEC"
gconftool-2 --set /apps/gnome-terminal/profiles/Default/background_color --type string "#FFFFFFFFFFFF"
gconftool-2 --set /apps/gnome-terminal/profiles/Default/use_theme_colors --type bool false

sed -iE 's/TriggerKey=.*/TriggerKey=CTRL_SHIFT_SPACE/' ~/.conf/fcitx/config
sh `dirname $0`/update.sh
