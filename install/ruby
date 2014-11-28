#!/bin/sh

if [ ! -e $HOME/.rvm ] ; then
    gpg --keyserver hkp://keys.gnupg.net --recv-keys D39DC0E3
    RUBY_VERSION=ruby-2.1.5
    \curl -sSL get.rvm.io | bash -s stable
    source $HOME/.rvm/scripts/gvm
    rvm install $RUBY_VERSION
    rvm use --default $RUBY_VERSION
fi
