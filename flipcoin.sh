#!/bin/bash

HEADS=1
TAILS=0
HEADSWINCOUNT=0
TAILSWINCOUNT=0
readonly WINPOINT=13
function isHeads(){
	if (( randNumber==HEADS ))
	then
		HEADSWINCOUNT=$(( $HEADSWINCOUNT+1 ))
	else
		TAILSWINCOUNT=$(( $TAILSWINCOUNT+1 ))
	fi
}
while [ true ]
do
	randNumber=$((RANDOM%2))
	isHeads $randNumber
	if (( HEADSWINCOUNT==WINPOINT ))
	then
		echo "Winner is Heads:" $HEADSWINCOUNT
		break
	fi
	if (( TAILSWINCOUNT==WINPOINT ))
	then
		echo "Winner is Tails:" $TAILSWINCOUNT
		break
	fi
done


