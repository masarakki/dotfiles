#!/bin/sh

echo "updating...."
dotdir=`pwd`/$0
dotdir=`dirname $dotdir | sed -E 's/\/\.//'`

ln -nfs $dotdir/.emacs $HOME/.emacs
ln -nfs $dotdir/.tmux.conf $HOME/.tmux.conf
ln -nfs $dotdir/.gemrc $HOME/.gemrc
ln -nfs $dotdir/.pryrc $HOME/.pryrc
ln -nfs $dotdir/Gemfile $HOME/Gemfile
ln -nfs $dotdir/Gemfile.lock $HOME/Gemfile.lock
ln -nfs $dotdir/.gitignore $HOME/.gitignore
find $dotdir/zshrc/* -type f -print | xargs -I {} ln -nfs {} $HOME/.oh-my-zsh/custom/

if [ -e $HOME/Dropbox ]; then
    ln -nfs $HOME/Dropbox/.gitconfig $HOME/.gitconfig
    ln -nfs $HOME/Dropbox/.ssh $HOME/.ssh
    ln -nfs $HOME/Dropbox/.mozc $HOME/.mozc
    chmod 600 $HOME/.ssh/*
fi

if [ -e /etc/fonts/conf.d/65-droid-sans-fonts.conf ] ; then
    cd /etc/fonts/conf.d
    sudo mv 65-droid-sans-fonts.conf 65-droid-sans-fonts.conf.bak
    sudo fc-cache -s -f -v /usr/share/fonts/truetype/droid
    sudo mv 65-droid-sans-fonts.conf.bak 65-droid-sans-fonts.conf
    cd -
fi

if [ `xrandr | grep current | sed -E 's/.*current ([0-9]+).*/\1/'` -gt 2048 ]
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
gconftool-2 --set /apps/gnome-terminal/profiles/Default/palette --type string "#000000000000:#CCCC00000000:#4E4E9A9A0606:#C4C4A0A00000:#34346565A4A4:#757550507B7B:#060698209A9A:#D3D3D7D7CFCF:#555557575353:#EFEF29292929:#8A8AE2E23434:#FCFCE9E94F4F:#72729F9FCFCF:#ADAD7F7FA8A8:#3434E2E2E2E2:#EEEEEEEEECEC"
gconftool-2 --set /apps/gnome-terminal/profiles/Default/background_color --type string "#FFFFFFFFFFFF"
gconftool-2 --set /apps/gnome-terminal/profiles/Default/use_theme_colors --type bool false

gsettings set com.canonical.desktop.interface scrollbar-mode normal
setxkbmap -option ctrl:swapcaps

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
