#!/bin/sh

echo "updating...."
dotdir=`pwd`/$0
dotdir=`dirname $dotdir | sed -E 's/\/\.//'`

ln -nfs $dotdir/home/.emacs $HOME/.emacs
ln -nfs $dotdir/home/.tmux.conf $HOME/.tmux.conf
ln -nfs $dotdir/home/.pryrc $HOME/.pryrc
ln -nfs $dotdir/home/Gemfile $HOME/Gemfile
ln -nfs $dotdir/home/Gemfile.lock $HOME/Gemfile.lock
ln -nfs $dotdir/home/.gitignore $HOME/.gitignore
find $dotdir/zshrc/* -type f -print | xargs -I {} ln -nfs {} $HOME/.oh-my-zsh/custom/

if [ -e $HOME/.zshrc ]; then
    sed -i 's/ZSH_THEME=".*"/ZSH_THEME="masarakki"/' ~/.zshrc
fi

if [ -e $HOME/Dropbox ]; then
    ln -nfs $HOME/Dropbox/.gitconfig $HOME/.gitconfig
    ln -nfs $HOME/Dropbox/.ssh $HOME/.ssh
    ln -nfs $HOME/Dropbox/.mozc $HOME/.mozc
    ln -nfs $HOME/Dropbox/.gemrc $HOME/.gemrc
    chmod 600 $HOME/.ssh/*
fi

if [ -e /etc/fonts/conf.d/65-droid-sans-fonts.conf ] ; then
    cd /etc/fonts/conf.d
    sudo mv 65-droid-sans-fonts.conf 65-droid-sans-fonts.conf.bak
    sudo fc-cache -s -f -v /usr/share/fonts/truetype/droid
    sudo mv 65-droid-sans-fonts.conf.bak 65-droid-sans-fonts.conf
    cd -
fi

if [ `xrandr | grep current | sed -E 's/.*current ([0-9]+) x ([0-9]+).*/\2/'` -gt 2048 ]
then
    fontsize=16
else
    fontsize=14
fi

gconftool-2 --set /apps/gnome-terminal/profiles/Default/use_system_font --type bool false
gconftool-2 --set /apps/gnome-terminal/profiles/Default/font --type string "Ricty Regular ${fontsize}"
gconftool-2 --set /apps/gnome-terminal/profiles/Default/use_custom_command --type bool true
gconftool-2 --set /apps/gnome-terminal/profiles/Default/custom_command --type string "tmux"
gconftool-2 --set /apps/gnome-terminal/profiles/Default/default_size_rows --type int 28
gconftool-2 --set /apps/gnome-terminal/profiles/Default/default_size_columns --type int 108
gconftool-2 --set /apps/gnome-terminal/profiles/Default/background_color --type string "#FFFFFFFFFFFF"
gconftool-2 --set /apps/gnome-terminal/profiles/Default/use_theme_colors --type bool true
gconftool-2 --set /apps/gnome-terminal/profiles/Default/background_darkness --type float 0.98
gconftool-2 --set /apps/gnome-terminal/profiles/Default/background_type --type string "transparent"

gsettings set com.canonical.desktop.interface scrollbar-mode normal
gsettings set org.gnome.desktop.media-handling automount-open false
sudo sed -iE 's/XKBDOPTIONS=.*/XKBOPTIONS="ctrl:nocaps"/' /etc/default/keyboard

sed -iE 's/TriggerKey=.*/TriggerKey=CTRL_SHIFT_SPACE/' ~/.config/fcitx/config
sed -iE 's/SwitchKey=.*/SwitchKey=Disabled/' ~/.config/fcitx/config

pubkey=`cat $dotdir/id_rsa.pub`
authkey=$HOME/.ssh/authorized_keys
if [ -e $authkey ]; then
    grep "$pubkey" $authkey > /dev/null
    if [ $? -ne 0 ]; then
        echo "$pubkey" >> $authkey
    fi
else
    echo "$pubkey" > $authkey
fi
