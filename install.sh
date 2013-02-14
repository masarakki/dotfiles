#!/bin/sh

echo "installing...."
basename=`dirname $0`

if [ `uname` = 'Linux' ] ; then
    sh $basename/_install_ubuntu.sh
fi

if [ ! -e $HOME/.rvm ] ; then
    echo "install ruby..."
    RUBY_VERSION=ruby-1.9.3
    curl -L get.rvm.io | bash -s stable --ruby
    $HOME/.rvm/scripts/rvm
    rvm install $RUBY_VERSION
    rvm use --default $RUBY_VERSION
fi

if [ ! -e $HOME/.fonts ] ; then
    mkdir $HOME/.fonts
fi

if [ ! -e $HOME/.oh-my-zsh ] ; then
    curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
fi

cp $basename/Ricty-* $HOME/.fonts
sh $basename/update.sh
