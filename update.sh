#!/bin/sh

echo "updating...."
dotdir=`pwd`/$0
dotdir=`dirname $dotdir | sed -E 's/\/\.//'`

ln -nfs $dotdir/.emacs $HOME/.emacs
ln -nfs $dotdir/.emacs.d $HOME/.emacs.d
ln -nfs $dotdir/.tmux.conf $HOME/.tmux.conf
ln -nfs $dotdir/.rvmrc $HOME/.rvmrc

if [ -e $HOME/Dropbox ]; then
    ln -nfs $HOME/Dropbox/.gitconfig $HOME/.gitconfig
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

