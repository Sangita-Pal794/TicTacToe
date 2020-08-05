#!/bin/bash -x

check_right(){
  if [ "${GRID[$(( $1 - 1 ))]}" = "${GRID[$(( $1 ))]}" ] && [ "${GRID[$(( $1 - 1 ))]}" = "${GRID[$(( $1 + 1 ))]}" ]
  then
    if [ "${GRID[$(( $1 - 1 ))]}" = X ]
    then
      win_display X
    else
      win_display O
    fi
  fi
}

check_left(){
  if [ "${GRID[$(( $1 - 1 ))]}" = "${GRID[$(( $1 - 2 ))]}" ] && [ "${GRID[$(( $1 - 1 ))]}" = "${GRID[$(( $1 - 3 ))]}" ]
  then
    if [ "${GRID[$(( $1 - 1 ))]}" = X ]
    then
      win_display X
    else
      win_display O
    fi
  fi
}
check_down(){
  if [ "${GRID[$(( $1 - 1 ))]}" = "${GRID[$(( $1 + 2 ))]}" ] && [ "${GRID[$(( $1 - 1 ))]}" = "${GRID[$(( $1 + 5 ))]}" ]
  then
    if [ "${GRID[$(( $1 - 1 ))]}" = X ]
    then
      win_display X
    else
      win_display O
    fi
  fi
}

check_up(){
  if [ "${GRID[$(( $1 - 1 ))]}" = "${GRID[$(( $1 - 4 ))]}" ] && [ "${GRID[$(( $1 - 1 ))]}" = "${GRID[$(( $1 - 7 ))]}" ]
  then
    if [ "${GRID[$(( $1 - 1 ))]}" = X ]
    then
      win_display X
    else
      win_display O
    fi
  fi
}
check_diag_down(){
  if [ "${GRID[$(( $1 - 1 ))]}" = "${GRID[4]}" ]
  then
    case $1 in
      1)
        if [ "${GRID[$(( $1 - 1 ))]}" = "${GRID[8]}" ]
        then
          if [ "${GRID[$(( $1 - 1 ))]}" = X ]
          then
            win_display X
          else
            win_display O
          fi
        fi
        ;;
      3)
        if [ "${GRID[$(( $1 - 1 ))]}" = "${GRID[6]}" ]
        then
          if [ "${GRID[$(( $1 - 1 ))]}" = X ]
          then
            win_display X
          else
            win_display O
          fi
        fi
        ;;
    esac
  fi
}
check_diag_up(){
  if [ "${GRID[$(( $1 - 1 ))]}" = "${GRID[4]}" ]
  then
    case $1 in
      7)
        if [ "${GRID[$(( $1 - 1 ))]}" = "${GRID[2]}" ]
        then
          if [ "${GRID[$(( $1 - 1 ))]}" = X ]
          then
            win_display X
          else
 win_display O
          fi
        fi
        ;;
      9)
        if [ "${GRID[$(( $1 - 1 ))]}" = "${GRID[0]}" ]
        then
          if [ "${GRID[$(( $1 - 1 ))]}" = X ]
          then
            win_display X
          else
            win_display O
          fi
        fi
        ;;
    esac
  fi
}
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
win_display() {
  clear
  echo =========================================================================
  display_GRID
  echo =========================================================================
  echo $1 Wins.
  echo =========================================================================
  echo Congratulations
  echo Hope You liked the game.
  echo =========================================================================
  read -p 'Press any key to exit '
  exit
}

Check_win(){
  current_ID=$1
  case $current_ID in
    1|4|7)
      check_right $current_ID
      case $current_ID in
        1)
          check_down 1
	  check_diag_down 1
          ;;
        4) check_up_down 4
          ;;
        7)
          check_up 7
          check_diag_up 7
          ;;
        esac
      ;;
    3|6|9)
      check_left $current_ID
      case $current_ID in
        3)
          check_down 3
          check_diag_down 3
          ;;
        6)
          check_up_down 6
          ;;
        9)
          check_up 9
          check_diag_up 9
          ;;
    esac
      ;;
    2|8)
      check_side $current_ID
      case $current_ID in
        2)
          check_down 2
          ;;
        8) check_up_down 4
          ;;
        7)
          check_up 7
          check_diag_up 7
          ;;
        esac
      ;;
    3|6|9)
      check_left $current_ID
      case $current_ID in
        3)
          check_down 3
          check_diag_down 3
          ;;
        6)
          check_up_down 6
          ;;
        9)
          check_up 9
          check_diag_up 9
          ;;
        esac
      ;;

      esac
      ;;
    2|8)
      check_side $current_ID
      case $current_ID in
        2)
          check_down 2
          ;;
        8)
          check_up 8
          ;;
        esac
      ;;
    5)
      check_up_down 5
      check_side 5
      check_diamond
      ;;
  esac
}
declare -a GRID=('_' '_' '_' '_' '_' '_' '_' '_' '_')
declare -a VALID_ID=('1' '2' '3' '4' '5' '6' '7' '8' '9')
VALID=0
CELL_ID=0
GRID_INDEX=0

game_intro

for TURN in {0..8}
do
  display_GRID
  if [ $(($TURN%2)) -eq 0 ]
  then
    echo X\'s TURN
    take_input
    GRID_INDEX=$(( $CELL_ID - 1 ))
    GRID[$GRID_INDEX]='X'
    if [ $TURN -gt 3 ]
    then
 Check_win $CELL_ID
    fi
  else
    echo O\'s TURN
    take_input
    GRID_INDEX=$(( $CELL_ID - 1 ))
    GRID[$GRID_INDEX]='O'
    if [ $TURN -gt 3 ]
    then
      Check_win $CELL_ID
    fi
  fi
done
