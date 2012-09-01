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
alias be="bundle exec"

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

function google {
    search_str=`echo $* | sed -E 's/ /+/g'`
    chromium-browser https://google.com/search?q=$search_str
}

export ANDROID_HOME=$HOME/.avm
export PATH=$ANDROID_HOME/platform-tools:$PATH
export PAGER=/usr/bin/lv
export EDITOR=/usr/bin/vim

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
[[ -s "$HOME/.nvm/nvm.sh" ]] && source "$HOME/.nvm/nvm.sh"
