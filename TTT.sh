#!/bin/bash -x
# Tic Tac Toe Game

#Choose letter X/O as an user if my turn's comes
declare -a GRID=('_' '_' '_' '_' '_' '_' '_' '_' '_')
for TURN in {0..8}
do
   display_GRID
  if [ $(($TURN%2)) -eq 0 ]
  then
       echo X\'s TURN
 else
	echo O\'s TURN
 fi
done


display_GRID(){
  echo -e ${GRID[0]}'\t'${GRID[1]}'\t'${GRID[2]}'\n'
  echo -e ${GRID[3]}'\t'${GRID[4]}'\t'${GRID[5]}'\n'
  echo -e ${GRID[6]}'\t'${GRID[7]}'\t'${GRID[8]}'\n'
}
