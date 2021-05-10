#!/bin/bash

# user settings
set -o vi
export EDITOR=nvim

# nvim settings
export PATH=$PATH:$HOME/.local/bin

# --- functions ----
vsetup() {

#Vagrantfileがすでに存在する場合は関数を終了
#If Vagrantfile has already exists, then exit this function.
  if [ -f ./Vagrantfile ]; then
    echo 'A Vagrantfile has already exists in this directory.'
    echo 'Please remove it or move other directory.'
    return 1
  fi

  vagrantBoxes=(`vagrant box list`)
  
#vagrantBoxes配列にVagrantBox名のみが入るように調整
#Fix VagrantBoxes list to it has only VagrantBox names.
  num=1
  ideal=$((${#vagrantBoxes[@]}/3))
  while [ ${#vagrantBoxes[@]} -ne $ideal ]
    do
      unset vagrantBoxes[$num]
      unset vagrantBoxes[$num+1]
      vagrantBoxes=(${vagrantBoxes[@]})
      num=$((num += 1))
    done


  echo 'which vagrant box do u wanna use?'
  
#所持しているVagrantBoxを表示
#Display your VagrantBox list.
  num=1
  for box in ${vagrantBoxes[@]} 
  do
      echo "$num ) $box"
      num=$((num += 1))
  done

#選んだimageを元にVagrantfileを作成
#Make Vagrantfile from your choosen.
  echo 'select a number'
  read input
  for box in ${vagrantBoxes[@]}
  do
    if [ $box = ${vagrantBoxes[$input-1]} ]; then
       vagrant init $box
    fi
  done

#ポートフォワーディングの設定
#Config to implement port forwarding.
  echo ''
  echo '-----Notification-----'
  while true; do
    echo 'Create a forwarded port mapping?[y/n]'
    read input
    case $input in 
      [Yy]) 
        echo 'GuestPort:[XXXX]' 
        read guestPort
        echo 'HostPort:[XXXX]'
        read hostPort
        replace="   config.vm.network \"forwarded_port\", guest: $guestPort , host: $hostPort, host_ip: \"127.0.0.1\""
        sed -i "31c\\$replace" Vagrantfile
        break;;
      [Nn]) 
        echo 'function skipped'
        break;;
    esac
  done

#プライベートネットワークの設定
#Config to implement a private network.
  echo ''
  echo '-----Notification-----'
  while true; do
    echo 'Create a private network?[y/n]'
    read input
    case $input in 
      [Yy]) 
        echo '192.168.33.[XXX]'
        read ipAddress
        replace="  config.vm.network \"private_network\", ip: \"192.168.33.$ipAddress\""
        sed -i "35c\\$replace" Vagrantfile
        break;;
      [Nn]) 
        echo 'function skipped'
        break;;
    esac
  done

  echo ''
  echo "-------------------------------------------------------------"
  echo "Successfully to Vagrantfile creation."
  echo "You should use 'vagrant up' command if you want to use Virtual Instanse."
  echo "-------------------------------------------------------------"
}

#---------------------------------------------------------------------------------------------
#---------------------------------------------------------------------------------------------
#---------------------------------------------------------------------------------------------

dive() {

#カレントディレクトリにVagrantfileがあれば仮想マシンを起動&SSH接続
#if current dir has Vagrantfile, start a virtual machine and ssh conection to it.
  vagrant up 2>/dev/null
  if [ $? -eq 0 ]; then
    vagrant ssh 
  else
    echo 'Vagrantfile is not found.'
    return 1
  fi

}

