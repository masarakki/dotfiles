if [ `uname` = 'FreeBSD' ] ; then
    export PAGER='/usr/local/bin/lv -c'
    alias ls='ls -aFG'
    alias emacs='emacs -nw'
else
    export PAGER='/usr/bin/lv -c'
    alias ls='ls -aF --color=always'
    alias gosh="rlwrap /usr/bin/gosh"
    alias nslookup="rlwrap /usr/bin/nslookup"

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
        chromium-browser "https://google.com/search?q=$search_str"
    }
fi

alias mysql='mysql -p'
alias emasc='emacs'
alias diff='colordiff'
alias rm='rm -f'
alias less="lv -c"
alias be="bundle exec"
alias rake="noglob rake"
alias nico="noglob nico.sh"

export ANDROID_HOME=$HOME/.avm
export PATH=$HOME/bin:$HOME/.rvm/bin:$ANDROID_HOME/platform-tools:$PATH
export EDITOR=/usr/bin/vim

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source $HOME/.rvm/scripts/rvm
[[ -s "$HOME/.nvm/nvm.sh" ]] && source $HOME/.nvm/nvm.sh
