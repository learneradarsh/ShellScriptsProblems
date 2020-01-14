#!/bin/bash

echo "WELCOME TO TIC TAC TOE"
echo "======================"

#VARIABLES
board=(. . . . . . . . .)

function assign(){
	local rand=$((RANDOM%2))
	if (( rand==1 ))
	then
		echo "Player assigned: 0"
		echo "Computer assgined: X"
	else
		echo "Player assigned: X"
		echo "Computer assigned: 0"
	fi
}

function printBoard(){
  echo "r\c 0 1 2"
  echo "0   ${board[0]} ${board[1]} ${board[2]}"
  echo "1   ${board[3]} ${board[4]} ${board[5]}"
  echo "2   ${board[6]} ${board[7]} ${boad[8]}"
}

function doToss(){
	local rand=$((RANDOM%2))
	if (( rand==1 ))
	then
		echo "Player won toss so play first"
	else
		echo "Computer won toss so play first"
	fi
}

printBoard
assign
doToss
