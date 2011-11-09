#!/bin/sh

echo "installing...."
dotdir=`dirname $0`
ln -nfs $dotdir/.emacs $HOME/.emacs
ln -nfs $dotdir/.emacs.d $HOME/.emacs.d
ln -nfs $dotdir/.tmux.conf $HOME/.tmux.conf
ln -nfs $dotdir/.rvmrc $HOME/.rvmrc

if [ -e $HOME/Dropbox ]; then
    ln -nfs $HOME/Dropbox/.gitconfig $HOME/.gitconfig
fi
