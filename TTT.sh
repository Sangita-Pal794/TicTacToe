#!/bin/bash

declare -a GRID=('_' '_' '_' '_' '_' '_' '_' '_' '_')
declare -a VALID_ID=('1' '2' '3' '4' '5' '6' '7' '8' '9')
VALID=0
CELL_ID=0
GRID_INDEX=0
for TURN in {0..8}
do
  display_GRID
  if [ $(($TURN%2)) -eq 0 ]
  then
    echo O\'s TURN
    take_input
    GRID_INDEX=$(( $CELL_ID - 1 ))
    GRID[$GRID_INDEX]='O'
fi
done

display_GRID(){
  echo ${GRID[0]}$'\t'${GRID[1]}$'\t'${GRID[2]}$'\t'$'\n'
  echo ${GRID[3]}$'\t'${GRID[4]}$'\t'${GRID[5]}$'\t'$'\n'
  echo ${GRID[6]}$'\t'${GRID[7]}$'\t'${GRID[8]}$'\t'$'\n'
}

check_CELL_ID(){
  input_ID=$1
  for index in {0..8}
  do
    if [ "$input_ID" = "${VALID_ID[$index]}" ]
    then
      VALID=1
      unset VALID_ID[$index]
      return
    fi
  done
  VALID=0
}

take_input(){
  read -p 'Enter the cell number you want to play: ' CELL_ID
  check_CELL_ID $CELL_ID
  while true
  do
    if [ "$VALID" -eq 1 ]
    then
      break
    else
      echo Please enter a valid cell number
      clear
      display_GRID
      read -p 'Enter the cell number you want to play: ' CELL_ID
      check_CELL_ID $CELL_ID
    fi
    sleep 1
  done
}
