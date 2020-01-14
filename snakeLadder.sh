#!/bin/bash -x

#CONSTANTS
RED='\033[0;31m'
GREEN='\033[0;32m'
HOME=100

#ARRAYS
declare -a SNAKEH=(38 51 76 91 97)
declare -a SNAKET=(20 10 54 73 61)
declare -a LADDERT=(5 14 53 64)
declare -a LADDERH=(58 49 72 83)
playerOnePos=0

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

function isladder(){
	local ladCount=0
	local ladLen=${#LADDERT[@]}
	while (( $ladCount<$ladLen ))
	do
		if (( ${LADDERT[$ladCount]}==$1 ))
		then
			echo "Got ladder"
			playerOnePos=${LADDERH[$ladCount]}
			noLadder=1
			break
		else
			noLadder=0
		fi
		(( ladCount++ ))
	done
}

function isSnake(){
	local snakeCount=0
	local snakeLen=${#SNAKEH[@]}
	while (( $snakeCount<$snakeLen ))
	do
		if (( ${SNAKEH[$snakeCount]}==$1 ))
		then
			echo "Got Snake"
			playerOnePos=${SNAKET[$snakeCount]}
			noSnake=1
			break
		else
			noSnake=0
		fi
		(( snakeCount++ ))
	done
}

printBoard

echo "Game Starts With Zero:"
echo "Player 1 Pos: 0"

while [[ $playerOnePos -le $HOME ]]
do
	echo "Player 1:"
	d=$(rollDice)
	playerOnePos=$(( $playerOnePos+$d ))
	echo "Dice val:" $d
	isladder $playerOnePos
	if (( $noLadder==0 ))
	then
		isSnake $playerOnePos
	fi
	echo "Player 1 Current Pos:" $playerOnePos
done
