#!/bin/zsh

export EDITOR='/usr/bin/vim'
export PAGER='/usr/bin/lv -c'

export GOROOT=$HOME/go
export GOPATH=$HOME
export GOBIN=$GOPATH/bine
export N_PREFIX=$HOME/.nvm
export PATH=$HOME/bin:$GOROOT/bin:$N_PREFIX/bin:$HOME/src/github.com/masarakki/dotfiles/bin:/usr/local/heroku/bin:$HOME/androi-studio/bin:$PATH

source $HOME/.rvm/scripts/rvm
