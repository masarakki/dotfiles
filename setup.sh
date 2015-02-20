#!/bin/sh

sudo apt-get install git

ghu='masarakki'
repo='dotfiles'

mkdir -p $HOME/src/github.com/$ghu
path=$HOME/src/github.com/$ghu/$repo
current=`pwd`
if [ -e $path ]
then
    cd $path
    echo 'git pull origin master'
else
    cd $HOME/src/github.com/$ghu
    git clone git://github.com/$ghu/$repo
    cd $repo
fi

./install.sh

cd $current
