#! /bin/bash
sym=" "

reset(){
  echo "====================="
  echo "Created by Sangita-Pal"
  echo "2020.8.3"
  echo "TicTacToe game"

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

#infinite loop

if [[ $player -eq 1 ]];
    then sym=O
else sym=X;
fi
echo "Player $player's turn: ($sym)"
}
reset
