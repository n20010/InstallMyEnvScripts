#!bin/bash

sudo apt update -y

source ./vimrc/myVimrc.sh
source ./vagrant/myVagrantEnv.sh


_BASH_P="$HOME/.bash_profile"
if [ ! -e $_BASH_P ]; then
    touch $_BASH_P
fi
cp bash_profile $_BASH_P

_BASH_A="$HOME/.bash_aliases"
if [ ! -e $_BASH_A ]; then
    touch $_BASH_A
fi
cp bash_aliases $_BASH_A

git config --global user.name "Koki Satani"
git config --global user.email "n20010@std.it-college.ac.jp"

#Gitがパスワードを一日保持する設定
#Git to keep your password for a day
git config --global credential.helper "cache --timeout=86400"

source ./neovim/install_neovim.sh


echo '----------------------------------------------------------------------'
echo '----------------------------------------------------------------------'
echo ''
echo 'Install process has successfully! Enjoy your Linux life! - Koki Satani'
echo ''
echo '----------------------------------------------------------------------'
echo '----------------------------------------------------------------------'
