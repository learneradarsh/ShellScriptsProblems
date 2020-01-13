#!/bin/bash -x

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
dayCounter=1
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

for (( dayCounter=1 ; $dayCounter<=20 ; dayCounter++ ))
do
	while (( i<=$gambleAmount ))
	do
		gamble
		if (( $?==$WIN ))
		then
			(( ++gambleAmount ))
		elif (( $gambleAmount==$MAXWON ))
		then
			echo "YOU WON.AMOUNT IS:" $gambleAmount
			totalAmtWon=$(( $totalAmtWon+$gambleAmount ))
			break
		elif (( $gambleAmount==$RESAMT ))
		then
			echo "YOU LOSE.PENDING MONEY IS:" $gambleAmount
			totalAmtLost=$(( $totalAmtLost+$gambleAmount ))
			break
		else
			(( --gambleAmount ))
		fi
		(( i++ ))
	done
done
echo $totalAmtWon
echo $totalAmtLost
