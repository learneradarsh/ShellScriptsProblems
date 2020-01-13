#!/bin/bash

#CONSTANTS
readonly WIN=1
readonly LOSE=0
readonly MAXWON=150 #maximum won amount limit
readonly RESAMT=50 #resign amount

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
	elif (( gambleAmount==MAXWON ))
	then
		echo "YOU WON.AMOUNT IS:" $gambleAmount
		break
	elif (( gambleAmount==RESAMT ))
	then
		echo "YOU LOSE.PENDING MONEY IS:" $gambleAmount
		break
	else
		(( --gambleAmount ))
	fi
done
