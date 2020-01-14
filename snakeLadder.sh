#!/bin/bash -x

#CONSTANTS
RED='\033[0;31m'
GREEN='\033[0;32m'

#ARRAYS
declare -a SNAKEH=(38 51 76 91 97)
declare -a SNAKET=(20 10 54 73 61)
declare -a LADDERT=(5 14 53 64)
declare -a LADDERH=(58 49 72 83)


echo "WELCOME TO SNAKE LADDER GAME"
echo "========LADDER=========="
echo "5-58"
echo "14-49"
echo "53-72"
echo "64-83"

echo "=======SNAKES========"
echo "38-20"
echo "51-10"
echo "76-54"
echo "91-73"
echo "97-61"

function printBoard(){
	echo "=========================GAMEBOARD==============================="
}

function rollDice(){
	dice=$((RANDOM%6+1))
	echo $dice
}

printBoard

echo "Game Starts With Zero:"
echo "Player 1: 0"
echo "Player 2: 0"
echo "Dice Value:" $(rollDice)
