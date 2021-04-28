#!/bin/bash

vsetup() {
  vagrantBoxes=(`vagrant box list`)
  
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
  
  num=1
  for box in ${vagrantBoxes[@]} 
  do
      echo "$num ) $box"
      num=$((num += 1))
  done

  echo 'select a number'
  read input
  for box in ${vagrantBoxes[@]}
  do
    if [ $box = ${vagrantBoxes[$input-1]} ]; then
       vagrant init $box
    fi
  done
}



