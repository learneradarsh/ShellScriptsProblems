#!/bin/bash -x

#CONSTANTS
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

clear

echo "WELCOME TO SNAKE LADDER GAME"
echo "========LADDER=========="
echo "LT-LH"
echo "5-58"
echo "14-49"
echo "53-72"
echo "64-83"

echo "=======SNAKES========"
echo "SH-ST"
echo "38-20"
echo "51-10"
echo "76-54"
echo "91-73"
echo "97-61"

function printBoard(){
	echo ""
	echo ""
	echo "=========================GAMEBOARD==============================="
	echo "100 	99 	98 	97/SH 	96 	95 	94 	93 	92 	91/SH"
	echo "81  	82 	83/H 	84 	85 	86 	87 	88 	89 	90"
	echo "80  	79 	78 	77 	76/SH 	75 	74 	73/ST 	72/LH 	71"
	echo "61/ST  	62 	63 	64/LT 	65 	66 	67 	68 	69 	70"
	echo "60  	59 	58/LH 	57 	56 	55 	54/ST 	53/LT 	52 	51/SH"
	echo "41  	42 	43 	44 	45 	46 	47 	48 	49/LH 	50"
	echo "40  	39 	38/SH 	37 	36 	35 	34 	33 	32 	31"
	echo "21  	22 	23 	24 	25 	26 	27 	28 	29 	30"
	echo "20/ST  	19 	18 	17 	16 	15 	14/LT 	13 	12 	11"
	echo "1	2	3 	4 	5/LT 	6 	7  	8  	9  	10/ST"
	echo ""
	echo ""
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
			echo "$(tput setab 2)Got ladder$(tput sgr 0)"
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
			echo "$(tput setab 1)Got Snake$(tput sgr 0)"
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
		printBoard
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
		#echo "==================================="
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
		printBoard
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
		#echo "===================================="
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

echo ""
echo ""
echo "TOTAL DICE ROLLS TO WIN THE GAME PLAYER 1:" $winRollOne
echo "TOTAL DICE ROLLS TO WIN THE GAME PLAYER 2:" $winRollTwo

echo ""
echo ""
echo "======================================================"
if (( winRollOne < winRollTwo ))
then
	echo "Final Winner is Player 1"
else
	echo "Final Winner is Player 2"
fi
