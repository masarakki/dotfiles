#!/bin/zsh

export EDITOR='/usr/bin/vim'
export PAGER='/usr/bin/lv -c'

export GOPATH=$HOME
export PATH=$HOME/bin:$HOME/src/github.com/masarakki/dotfiles/bin:$PATH
export N_PREFIX=$HOME

source $HOME/.rvm/scripts/rvm
source $HOME/.gvm/scripts/gvm

export GOBIN=$HOME/bin
