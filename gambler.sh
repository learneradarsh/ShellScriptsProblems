#!/bin/bash

#total gamble amount
GAMBLEAMOUNT=100
#total goal amount to win
readonly WINGOALAMOUNT=200
#No. of bets
TOTALBETS=0
#No. of times won
TOTALWINATT=0
WIN=1
LOSE=0

while [ $GAMBLEAMOUNT -ge 0 ]
do
	if (( $GAMBLEAMOUNT==0 ))
	then
		echo "YOU LOSE": $GAMBLEAMOUNT
		break
	fi
	randNumber=$(( RANDOM%2 ))
	(( ++TOTALBETS ))
	if (( $randNumber==$WIN ))
	then
		(( ++GAMBLEAMOUNT ))
		(( ++TOTALWINATT ))
	elif (( $GAMBLEAMOUNT==$WINGOALAMOUNT ))
	then
		echo "WON MAX AMOUNT:" $GAMBLEAMOUNT
		break
	else
		(( --GAMBLEAMOUNT ))
	fi
done

echo "No. of bets made:" $TOTALBETS
echo "Total time won:" $TOTALWINATT
