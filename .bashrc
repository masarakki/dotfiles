# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

alias ls='ls -aF'
alias mysql='mysql -p'
alias emasc='emacs'
alias diff='colordiff'
alias rm='rm -f'
alias gosh="rlwrap /usr/bin/gosh"
alias nslookup="rlwrap /usr/bin/nslookup"
alias less="lv -c"
alias chrome="chromium-browser"

function emacs {
    if [ "$TMUX" != "" ] ; then
        tmux new-window "/usr/bin/emacs -nw $*"
    else
        gnome-terminal -t emacs -x emacs -nw $*
    fi
}

function find {
    /usr/bin/find $* 2>/dev/null
}

export PATH=$HOME/bin:$PATH
export PAGER=/usr/bin/lv
export EDITOR=/usr/bin/vim

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
[[ -s "$HOME/.nvm/nvm.sh" ]] && source "$HOME/.nvm/nvm.sh"
