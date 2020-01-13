#!/bin/bash

#CONSTANTS
readonly WIN=1
readonly LOSE=0

#VARIABLES
gambleAmount=100 #total gamble amount
totalAmtWon=0 #total amount won
totalAmtLost=0
daysWon=0
daysLost=0
wonMax=0
lostMax=0

i=1

function gamble(){
	chance=$((RANDOM%2))
	if (( chance==WIN ))
	then
		return 1
	else
		return 0
	fi
}

while (( i<=$gambleAmount ))
do
	gamble
	if (( $?==WIN ))
	then
		(( ++gambleAmount ))
	elif (( gambleAmount==0 ))
	then
		echo "YOU LOSE:" $gambleAmount
	else
		(( --gambleAmount ))
	fi
done
echo $gambleAmount
