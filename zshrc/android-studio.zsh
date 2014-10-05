#!/usr/bin/zsh

if [ -e $HOME/android-studio ]
then
    export PATH=$PATH:$HOME/android-studio/sdk/tools:$HOME/android-studio/sdk/platform-tools:$HOME/android-studio/bin
fi
