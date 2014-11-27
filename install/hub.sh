#!/bin/sh

export GOPATH=$HOME
ghq get github.com/github/hub
cd $GOPATH/src/github.com/github/hub
./script/build -o $HOME/bin/hub
cd -
