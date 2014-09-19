#!/bin/zsh

function percol-src () {
    local selected_dir=$(ghq list | peco --query "$LBUFFER")
    if [ -n "$selected_dir" ]; then
        BUFFER="cd `git config ghq.root`/${selected_dir}"
        zle accept-line
    fi
    zle clear-screen
}
zle -N percol-src
bindkey '^S' percol-src
