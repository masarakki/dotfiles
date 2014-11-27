#!/bin/sh

echo "installing...."
basename=`dirname $0`

if [ `uname` = 'Linux' ] ; then
    sh $basename/_install_ubuntu.sh
fi

if [ ! -e $HOME/.rvm ] ; then
    echo "install ruby..."
    gpg --keyserver hkp://keys.gnupg.net --recv-keys D39DC0E3
    RUBY_VERSION=ruby-2.1.2
    \curl -sSL get.rvm.io | bash -s stable
    $HOME/.rvm/scripts/rvm
    rvm install $RUBY_VERSION
    rvm use --default $RUBY_VERSION
fi

sh $basename/update.sh
