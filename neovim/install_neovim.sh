#!/bin/bash

_CONFIG_DIR="$HOME/.config/nvim"
_PLUGIN_DIR="$HOME/.local/share/nvim/site/autoload"

sudo apt install neovim -y

if [ ! -d $_CONFIG_DIR ]; then
    mkdir -p $_CONFIG_DIR
fi

sudo apt install curl

curl -fLo "$_PLUGIN_DIR/plug.vim" --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

source ./python3.conf.sh
