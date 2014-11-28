#!/bin/sh

if [ ! -e $HOME/.oh-my-zsh ] ; then
    curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
    chsh -s /bin/zsh
    sed -i 's/ZSH_THEME=".*"/ZSH_THEME="philips"/' ~/.zshrc
    sed -ie '/export PATH=/{/\$PATH/!d;}' ~/.zshrc
fi
