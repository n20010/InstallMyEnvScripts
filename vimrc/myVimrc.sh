#!bin/bash

_VIMRC="$HOME/.vimrc"
_TEMPLATE="$HOME/Templates/forPG"


if [ ! -e $_VIMRC ]; then
    touch $_VIMRC
fi

cp vimrc/vimrc $_VIMRC

if [ ! -d $_TEMPLATE ]; then
    mkdir -p $_TEMPLATE
fi

cp -a --force vimrc/templates/* $_TEMPLATE
