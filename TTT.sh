#!/bin/bash

reset(){
  echo "====================="
  echo "Created by Sangita-Pal"
  echo "2020.8.3"
  echo "TicTacToe game in bash"

  Arr=(. . . . . . . . .)
  player=1
  gamestatus=1
  echo "====================="
  echo "Game started"

  if [ $(($RANDOM%2)) == 1 ]
  then
  echo "Player one will play"
  else
    echo "Player two will play"
  fi
  if [ $player == 1 ]; then sym=O
  else sym=X; fi
  echo "Player $player's turn: ($sym)"
print
}
print(){
  echo "r\c 0 1 2"
  echo "0   ${Arr[0]} ${Arr[1]} ${Arr[2]}"
  echo "1   ${Arr[3]} ${Arr[4]} ${Arr[5]}"
  echo "2   ${Arr[6]} ${Arr[7]} ${Arr[8]}"
}
reset
