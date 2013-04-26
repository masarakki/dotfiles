#!/bin/sh

echo "updating...."
dotdir=`pwd`/$0
dotdir=`dirname $dotdir | sed -E 's/\/\.//'`

ln -nfs $dotdir/.emacs $HOME/.emacs
ln -nfs $dotdir/.emacs.d $HOME/.emacs.d
ln -nfs $dotdir/.tmux.conf $HOME/.tmux.conf
ln -nfs $dotdir/.gemrc $HOME/.gemrc
ln -nfs $dotdir/Gemfile $HOME/Gemfile

if [ -e $HOME/Dropbox ]; then
    ln -nfs $HOME/Dropbox/.gitconfig $HOME/.gitconfig
    if [ ! -e $HOME/.xchat2 ]; then
        mkdir $HOME/.xchat2
    fi
    cp $HOME/Dropbox/xchat_server.conf $HOME/.xchat2/servlist_.conf
    ln -nfs $HOME/Dropbox/.ssh $HOME/.ssh
    chmod 600 $HOME/.ssh/*
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

for rcfile in $HOME/.bashrc $HOME/.zshrc
do
    grep "dotfiles/.bashrc" $rcfile > /dev/null
    if [ $? -ne 0 ]; then
        echo "source \$HOME/dotfiles/.bashrc" >> $rcfile
    fi
done


cd $dotdir ; git submodule update --init ; cd -
cd $HOME ; bundle install ; cd -
