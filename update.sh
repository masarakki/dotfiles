#!/bin/sh

echo "updating...."
dotdir=`pwd`/$0
dotdir=`dirname $dotdir | sed -E 's/\/\.//'`

ln -nfs $dotdir/home/.emacs $HOME/.emacs
ln -nfs $dotdir/home/.tmux.conf $HOME/.tmux.conf
ln -nfs $dotdir/home/.pryrc $HOME/.pryrc
ln -nfs $dotdir/home/.gitignore $HOME/.gitignore
ln -nfs $dotdir/home/.zshenv $HOME/.zshenv
find $dotdir/zshrc/* -type f -print | xargs -I {} ln -nfs {} $HOME/.oh-my-zsh/custom/

if [ -e $HOME/.zshrc ]; then
    sed -i 's/ZSH_THEME=".*"/ZSH_THEME="masarakki"/' ~/.zshrc
fi

if [ -e $HOME/Dropbox ]; then
    ln -nfs $HOME/Dropbox/.gitconfig $HOME/.gitconfig
    ln -nfs $HOME/Dropbox/.ssh $HOME/.ssh
    ln -nfs $HOME/Dropbox/.mozc $HOME/.mozc
    ln -nfs $HOME/Dropbox/.gemrc $HOME/.gemrc
    ln -nfs $HOME/Dropbox/.aws $HOME/.aws
    chmod 600 $HOME/.ssh/*
fi

if [ -e /etc/fonts/conf.d/65-droid-sans-fonts.conf ] ; then
    cd /etc/fonts/conf.d
    sudo mv 65-droid-sans-fonts.conf 65-droid-sans-fonts.conf.bak
    sudo fc-cache -s -f -v /usr/share/fonts/truetype/droid
    sudo mv 65-droid-sans-fonts.conf.bak 65-droid-sans-fonts.conf
    cd -
fi

UUID=$(gsettings get org.gnome.Terminal.ProfilesList default | tr -d \')
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:${UUID}/ font "Ricty Regular 14"
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:${UUID}/ login-shell false
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:${UUID}/ use-custom-command true
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:${UUID}/ custom-command '/usr/bin/tmux'
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:${UUID}/ default-size-rows 32
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:${UUID}/ default-size-columns 128
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:${UUID}/ background-color '#FFFFFF'
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:${UUID}/ audible-bell false
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:${UUID}/ bold-is-bright true
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:${UUID}/ visible-name Default

echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p

gsettings set com.canonical.desktop.interface scrollbar-mode normal
gsettings set org.gnome.desktop.media-handling automount-open false
sudo sed -i 's/XKBOPTIONS=.*/XKBOPTIONS="ctrl:nocaps"/' /etc/default/keyboard

sed -i 's/TriggerKey=.*/TriggerKey=CTRL_SHIFT_SPACE/' ~/.config/fcitx/config
sed -i 's/SwitchKey=.*/SwitchKey=Disabled/' ~/.config/fcitx/config

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
