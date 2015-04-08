#!/bin/zsh

export EDITOR='/usr/bin/vim'
export PAGER='/usr/bin/lv -c'

export GOROOT=$HOME/go
export GOPATH=$HOME
export GOBIN=$GOPATH/bin
export PATH=$HOME/bin:$GOROOT/bin:$HOME/src/github.com/masarakki/dotfiles/bin:$PATH
export PATH=/usr/local/heroku/bin:$PATH
export N_PREFIX=$HOME
export PATH=$HOME/android-studio/bin:$PATH

source $HOME/.rvm/scripts/rvm
