#!/bin/bash

echo "WELCOME TO TIC TAC TOE"
echo "======================"

#VARIABLES
board=(. . . . . . . . .)

function printBoard(){
  echo "r\c 0 1 2"
  echo "0   ${board[0]} ${board[1]} ${board[2]}"
  echo "1   ${board[3]} ${board[4]} ${board[5]}"
  echo "2   ${board[6]} ${board[7]} ${boad[8]}"
}

printBoard
