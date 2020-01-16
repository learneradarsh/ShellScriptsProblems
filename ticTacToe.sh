#!/bin/bash -x

echo "WELCOME TO TIC TAC TOE"
echo "======================"

#ARRAYS
board=(. . . . . . . . .)

#VARIABLES
playerMoveSign=0
computerMoveSign=0
playerT=0
computerT=0
gamestatus=1 #gameon
drawCounter=0
fillCounter=0

function assign(){
	local rand=$((RANDOM%2))
	if (( rand==1 ))
	then
		playerMoveSign=0
		computerMoveSign=X
		echo "Player assigned: 0"
		echo "Computer assgined: X"
	else
		playerMoveSign=X
		computerMoveSign=0
		echo "Player assigned: X"
		echo "Computer assigned: 0"
	fi
}

function printBoard(){
  echo "r\c 0 1 2"
  echo "0   ${board[0]} ${board[1]} ${board[2]}"
  echo "1   ${board[3]} ${board[4]} ${board[5]}"
  echo "2   ${board[6]} ${board[7]} ${board[8]}"
}

function doToss(){
	local rand=$((RANDOM%2))
	if (( rand==1 ))
	then
		playerT=1
		echo "Player won toss so play first"
	else
		computerT=1
		echo "Computer won toss so play first"
	fi
}


function set(){
  idx=$(( $1 * 3 + $2 ))
  if [[ ${board[$idx]} == "." ]]
  then
    board[$idx]=$3
	 (( fillCounter++ ))
    player=$((player%2+1))
  else
    	echo "You can't place there!"
  fi
}

function checkmatch(){
  if [ ${board[$1]} != "." ] && [ ${board[$1]} == ${board[$2]} ] && [ ${board[$2]} == ${board[$3]} ]
  then
    gamestatus=0 #gameover
  fi
}

function checkDraw(){
	local i=0
	local len=${#board[@]}
	while (( i<len ))
	do
		if [ $fillCounter == 8 ] && [ $gamestatus != 0 ]
		then
			drawCounter=1
			break
		fi
		(( i++ ))
	done
}

function checkgame(){
  checkmatch 0 1 2
  checkmatch 3 4 5
  checkmatch 6 7 8
  checkmatch 0 3 6
  checkmatch 1 4 7
  checkmatch 2 5 8
  checkmatch 0 4 8
  checkmatch 2 4 6
}

function turnH(){
	print
 	echo ""
 	echo "  Command:"
 	echo "	1. set [row] [column]"
 	while (( 1 == 1 ))
	do
		printBoard
 		read -r cmd a b
    	if (( $cmd == "set" ))
		then
	  		set $a $b $sym
			break
    	else
			echo "wrong command, try again."
    	fi
  done
  checkgame
  checkDraw
  if (( $gamestatus != 1 ))
	then
	    echo "Gameover"
	    player=$((player%2+1))
	    echo "($sym) win!!"
		 printBoard
  fi
}


arrA=(0 0 2 2 1)
arrB=(0 2 0 2 1)

function turnC(){
	print
 	echo ""
 	echo "  Command:"
 	echo "	1. set [row] [column]"
 	while (( 1 == 1 ))
	do
		printBoard
		count=0
		while (( count < 9 ))
		do
			a=${arrA[$count]}
			b=${arrB[$count]}
			local calx=$(( a * 3 + b ))
			if [[ ${board[$calx]} == "." ]]
			then
				break
			fi
			(( count++ ))
		done
		set $a $b $sym
		break
  done
  checkgame
  checkDraw
  if (( $gamestatus != 1 ))
	then
	    echo "Gameover"
	    player=$((player%2+1))
	    echo "($sym) win!!"
		 printBoard
  fi
}

printBoard
assign
doToss

#gameloop
while (( 1==1 ))
do
 	echo ""
	if (( playerT == 1 ))
	then
		sym=$playerMoveSign
 		echo "Player  turn: ($sym)"
	else
		sym=$computerMoveSign
		echo "Computer turn: ($sym)"
	fi
	if (( playerT == 1 ))
	then
		turnH $sym #human move
		computerT=1
		playerT=0
	else
		turnC $sym #computer move
		playerT=1
		computerT=0
	fi
	if (( $gamestatus != 1 ))
	then
		break
	elif (( $drawCounter == 1 ))
	then
		echo "Game Draw"
		printBoard
		break
	fi
done

