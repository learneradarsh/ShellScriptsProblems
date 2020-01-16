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

#to print board
function printBoard(){
  echo "r\c 0 1 2"
  echo "0   ${board[0]} ${board[1]} ${board[2]}"
  echo "1   ${board[3]} ${board[4]} ${board[5]}"
  echo "2   ${board[6]} ${board[7]} ${board[8]}"
}

#who will play first
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

#set value to board
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

#check win condition
function checkmatch(){
  if [[ "${board[$1]}" != "." ]] && [[ "${board[$1]}" == "${board[$2]}" ]] && [[ "${board[$2]}" == "${board[$3]}" ]]
  then
    gamestatus=0 #gameover
	 return 0
  fi
}


#win condition combinations
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

#human turn
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
  if (( $gamestatus != 1 ))
	then
	    echo "Gameover"
	    player=$((player%2+1))
	    echo "($sym) win!!"
		 printBoard
  fi
}


#To find winMove
function winMove(){
	local sym=$3
	local a=$1
	local b=$2
	local counter=0
		if [[ "${board[8]}" == "." ]] && [[ "${board[0]}" == "${board[4]}" ]] && [[ "${board[0]}" == "$sym" ]]
		then
			a=2
			b=2
			echo $a $b $sym
			return
		elif [[ "${board[0]}" == "." ]] && [[ "${board[8]}" == "${board[4]}" ]] && [[ "${board[8]}" == "$sym" ]]
		then
			a=0
			b=0
			echo $a $b $sym
			return
		elif [[ "${board[4]}" == "." ]] && [[ "${board[0]}" == "${board[8]}" ]] && [[ "${board[8]}" == "$sym" ]]
		then
			a=1
			b=1
			echo $a $b $sym
			return
		fi
		if [[ "${board[2]}" == "${board[4]}" ]] && [[ "${board[6]}" == "." ]] && [[ "${board[6]}" == "$sym" ]]
		then
			a=2
			b=0
			echo $a $b $sym
			return
		elif [[ "${board[6]}" == "${board[2]}" ]] && [[ "${board[4]}" == "." ]] && [[ "${board[6]}" == "$sym" ]]
		then
			a=1
			b=1
			echo $a $b $sym
			return
		elif [[ "${board[6]}" == "${board[4]}" ]] && [[ "${board[.]}" == "$sym" ]] && [[ "${board[6]}" == "$sym" ]]
		then
			a=0
			b=2
			echo $a $b $sym
			return
		fi
		return 0
}

#other move
arrA=(0 0 2 2 1)
arrB=(0 2 0 2 1)

#computer turn
function turnC(){
	print
 	echo ""
 	echo "  Command:"
 	echo "	1. set [row] [column]"
 	while (( 1 == 1 ))
	do
		printBoard
		count=0
		#winMove $a $b $sym
		while (( count < 9 ))
		do
			a=${arrA[$count]}
			b=${arrB[$count]}
			if [[ ${board[(a*3+b)]} == "." ]]
			then
				break
			fi
			(( count++ ))
		done
		#echo $(winMove $a $b $sym)
		set $a $b $sym
		break
  done
  checkgame
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

draw=0

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
		(( draw++ ))
		computerT=1
		playerT=0
	else
		turnC $sym #computer move
		(( draw++ ))
		playerT=1
		computerT=0
	fi
	if (( $gamestatus != 1 ))
	then
		break
	elif (( $draw == 9 )) && (( $gamestatus == 1 ))
	then
		printBoard
		echo "Game Draw"
		break
	fi
done

