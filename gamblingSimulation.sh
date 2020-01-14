#!/bin/bash -x

#CONSTANTS
readonly WIN=1
readonly LOSE=0
readonly MAXWON=150 #maximum won amount limit
readonly RESAMT=50 #resign amount

#VARIABLES
totalAmtWon=0 #total amount won
totalAmtLost=0
daysWon=0
daysLost=0
dayCounter=1
betCounter=1

function gamble(){
	if (( $chance==$WIN ))
	then
		return 1
	else
		return 0
	fi
}

for (( dayCounter=1 ; dayCounter<=20 ; dayCounter++ ))
do
	gambleAmount=100 #total gamble amount
	while (( ($gambleAmount<$MAXWON) && ($gambleAmount>$RESAMT) ))
	do
		chance=$((RANDOM%2))
		if (( $chance==$WIN ))
		then
			(( gambleAmount++ ))
		else
			(( gambleAmount-- ))
		fi
	done
	if ((gambleAmount==RESAMT))
	then
		echo "YOU LOST: AMOUNT IS:" $gambleAmount
		(( daysLost++ ))
		totalAmtLost=$(( totalAmtLost+gambleAmount ))
		echo $totalAmtLost
	else
		echo "YOU WON: AMOUNT IS:" $gambleAmount
		(( daysWon++ ))
		totalAmtWon=$(( totalAmtWon+gambleAmount ))
		echo $totalAmtWon
	fi
done
echo "total amt won:" $totalAmtWon
echo "No. of Days Won:" $daysWon
echo "total amt lost:" $totalAmtLost
echo "No. of Days Lost:" $daysLost
