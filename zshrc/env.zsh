#!/bin/zsh

export DOTFILE_ROOT=`readlink $0 | xargs dirname |xargs dirname`
export EDITOR='/usr/bin/vim'
export PAGER='/usr/bin/lv -c'

export GOROOT=$HOME/go
export GOPATH=$HOME
export GOBIN=$GOPATH/bin
export N_PREFIX=$HOME/.nvm
export PYENV_ROOT=$HOME/.pyenv
export PYTHON_CONFIGURE_OPTS='--enable-shared'
export PATH=$HOME/bin:$GOROOT/bin:$N_PREFIX/bin:$PYENV_ROOT/bin:$DOTFILE_ROOT/bin:$HOME/.tfenv/bin:$HOME/.local/bin:$PATH

source $HOME/.cargo/env
source $HOME/.rvm/scripts/rvm

eval "$(pyenv init -)"
