#!/bin/zsh

export DOTFILE_ROOT=`readlink $0 | xargs dirname |xargs dirname`
export EDITOR='/usr/bin/vim'
export PAGER='/usr/bin/lv -c'
export BAT_PAGER='less'

export PYTHON_CONFIGURE_OPTS='--enable-shared'
export ANYENV_ROOT=$HOME/.anyenv
export PATH=$HOME/bin:$ANYENV_ROOT/bin:$DOTFILE_ROOT/bin:$HOME/.local/bin:$PATH

source $HOME/.cargo/env

eval "$(anyenv init -)"
