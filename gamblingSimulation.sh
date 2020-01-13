#!/bin/bash -x

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

function gambler(){
	bet=$((RANDOM%2))
	if (( $bet==1 ))
	then
		(( gambleAmount++ ))
		return 1
	else
		(( gambleAmount-- ))
		return 0
	fi
}

while(( i<=$gambleAmount ))
do
	gambler
	if (( $gamebleAmount==0 ))
	then
		echo "you lost"
	(( i++ ))
done
