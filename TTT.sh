#!/bin/bash
# Tic Tac Toe Game

game_intro(){
  clear
  echo =======================================================
  echo Welcome to Tic Tac Toe
  echo By Sangita
  echo =======================================================
  echo Instructions to play the game.
  echo 1. It is a two player game.
  echo 2. The cells are numbered 1 to 9 from left to right. $'\n'As shown below
  echo $'\t'1$'\t'2$'\t'3$'\t'_$'\t'_$'\t'_$'\t'$'\n'
  echo $'\t'4$'\t'5$'\t'6$'\t'_$'\t'_$'\t'_$'\t'$'\n'
  echo $'\t'7$'\t'8$'\t'9$'\t'_$'\t'_$'\t'_$'\t'$'\n'
  echo 3. x will play first. o will follow.
  echo 4. Please use small alphabets to play the game.
  echo 5. A valid cell number will be a cell which exists,
  echo i.e. within 1 to 9 or which hasn\'t already been played.
  echo Let\'s start the game. Have fun.
  read -p "Press any key to start the game "
  clear
}
game_intro
