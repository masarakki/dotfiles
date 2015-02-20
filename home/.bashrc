export PAGER='/usr/bin/lv -c'

export ANDROID_HOME=$HOME/.avm
export PATH=$HOME/bin:$HOME/dotfiles/bin:$HOME/.rvm/bin:$ANDROID_HOME/platform-tools:$ANDROID_HOME/ndk:$ANDROID_HOME/tools:$PATH
export EDITOR=/usr/bin/vim

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source $HOME/.rvm/scripts/rvm
[[ -s "$HOME/.nvm/nvm.sh" ]] && source $HOME/.nvm/nvm.sh
