#!/bin/zsh

alias ls='ls -aF --color=always'
alias open='xdg-open'

function find {
    /usr/bin/find $* 2>/dev/null
}

function google {
    search_str=`echo $* | sed -E 's/ /+/g'`
    open "https://google.com/search?q=$search_str"
}

alias mysql='mysql -p'
alias emasc='emacs'
alias diff='colordiff'
alias cat="batcat -p"
alias rm='rm -f'
alias less="lv -c"
alias be="bundle exec"
alias unzip_win="unzip -O sjis"
alias rake="noglob rake"
alias nico="noglob nico.sh"
alias gosh="rlwrap /usr/bin/gosh"
alias nslookup="rlwrap /usr/bin/nslookup"
alias sqlite3="rlwrap /usr/bin/sqlite3"
alias sy='git sync'
alias gr='./gradlew'
