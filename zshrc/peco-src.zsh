#!/bin/zsh

function peco-src () {
    local selected_dir=$(( echo "github.com/`git config github.user`" ; ghq list) | peco --query "$LBUFFER")
    if [ -n "$selected_dir" ]; then
        BUFFER="cd `git config ghq.root`/${selected_dir}"
        zle accept-line
    fi
    zle clear-screen
}
zle -N peco-src
bindkey '^S' peco-src
