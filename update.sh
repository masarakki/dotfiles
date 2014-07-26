#!/bin/sh

echo "updating...."
dotdir=`pwd`/$0
dotdir=`dirname $dotdir | sed -E 's/\/\.//'`

ln -nfs $dotdir/.emacs $HOME/.emacs
ln -nfs $dotdir/.tmux.conf $HOME/.tmux.conf
ln -nfs $dotdir/.gemrc $HOME/.gemrc
ln -nfs $dotdir/Gemfile $HOME/Gemfile
ln -nfs $dotdir/Gemfile.lock $HOME/Gemfile.lock
ln -nfs $dotdir/.gitignore $HOME/.gitignore
ln -nfs $dotdir/aliases.zsh $HOME/.oh-my-zsh/custom/aliases.zsh

if [ -e $HOME/Dropbox ]; then
    ln -nfs $HOME/Dropbox/.gitconfig $HOME/.gitconfig
    ln -nfs $HOME/Dropbox/.ssh $HOME/.ssh
    chmod 600 $HOME/.ssh/*
fi

if [ -e /etc/fonts/conf.d/65-droid-sans-fonts.conf] ; then
    cd /etc/fonts/conf.d
    sudo mv 65-droid-sans-fonts.conf 65-droid-sans-fonts.conf.bak
    sudo fc-cache -s -f -v /usr/share/fonts/truetype/droid
    sudo mv 65-droid-sans-fonts.conf.bak 65-droid-sans-fonts.conf
    cd -
fi

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
