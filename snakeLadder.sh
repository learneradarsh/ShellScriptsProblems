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
playerTwoPos=0
winRollOne=0
winRollTwo=0

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

function isLadder(){
	local pos=$1
	local ladCount=0
	local ladLen=${#LADDERT[@]}
	while (( $ladCount<$ladLen ))
	do
		if (( ${LADDERT[$ladCount]}==$1 ))
		then
			echo "Got ladder"
			pos=${LADDERH[$ladCount]}
			noLadder=1
			break
		else
			noLadder=0
		fi
		(( ladCount++ ))
	done
	return $pos
}

function isSnake(){
	local pos=$1
	local snakeCount=0
	local snakeLen=${#SNAKEH[@]}
	while (( $snakeCount<$snakeLen ))
	do
		if (( ${SNAKEH[$snakeCount]}==$1 ))
		then
			echo "Got Snake"
			pos=${SNAKET[$snakeCount]}
			noSnake=1
			break
		else
			noSnake=0
		fi
		(( snakeCount++ ))
	done
	return $pos
}


printBoard

echo "Game Starts With Zero:"
echo "Player 1 Pos: 0"

function playOne(){
	while [[ $playerOnePos -le $HOME ]]
	do
		echo "Player 1:"
		local d=$(rollDice)
		(( winRollOne++ ))
		local noPlaySum=$(( playerOnePos+d ))
		if (( $noPlaySum>100 )) #no play logic
		then
			playerOnePos=$(( playerOnePos+0 ))
		else
			playerOnePos=$(( $playerOnePos+$d ))
		fi
		echo "Dice val:" $d
		isLadder $playerOnePos
		playerOnePos=$?
		if (( $noLadder==0 ))
		then
			isSnake $playerOnePos
			playerOnePos=$?
		fi
		echo "Player 1 Current Pos:" $playerOnePos
		echo "==================================="
		if (( $playerOnePos == $HOME ))
		then
			echo "PLAYER 1 YOU COMPLETED"
			echo "YOUR POSITION IS:" $playerOnePos
			break
		fi
	done
}

function playTwo(){
	while [[ $playerTwoPos -le $HOME ]]
	do
		echo "Player 2:"
		local d=$(rollDice)
		(( winRollTwo++ ))
		local noPlaySum=$(( playerTwoPos+d ))
		if (( $noPlaySum>100 )) #no play logic
		then
			playerTwoPos=$(( playerTwoPos+0 ))
		else
			playerTwoPos=$(( $playerTwoPos+$d ))
		fi
		echo "Dice val:" $d
		isLadder $playerTwoPos
		playerTwoPos=$?
		if (( $noLadder==0 ))
		then
			isSnake $playerTwoPos
			playerTwoPos=$?
		fi
		echo "Player 2 Current Pos:" $playerTwoPos
		echo "===================================="
		if (( $playerTwoPos == $HOME ))
		then
			echo "PLAYER 2 YOU COMPLETED"
			echo "YOUR POSITION IS:" $playerTwoPos
			break
		fi
	done
}

playOne
playTwo

echo "TOTAL DICE ROLLS TO WIN THE GAME PLAYER 1:" $winRollOne
echo "TOTAL DICE ROLLS TO WIN THE GAME PLAYER 2:" $winRollTwo

echo "======================================================"
if (( winRollOne < winRollTwo ))
then
	echo "Final Winner is Player 1"
else
	echo "Final Winner is Player 2"
fi
