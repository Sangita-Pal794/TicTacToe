#!/bin/bash
for TURN in {0..8}
do
  if [ $(($TURN%2)) -eq 0 ]
  then
    echo X\'s TURN
 else
	echo O\'s TURN
 fi
done

