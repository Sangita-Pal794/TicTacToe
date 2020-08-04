#!/bin/bash -x

reset(){
  echo "====================="
  echo "Created by Sangita-Pal794"
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
}
reset
