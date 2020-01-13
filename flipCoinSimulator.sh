#!/bin/bash

#VARIABLES

function getSingletRandom(){
	local randNumber=$((RANDOM%2))
	if (( randNumber==1 ))
	then
		echo "HEADS"
	else
		echo "TAILS"
	fi
	#echo $randNumber
}

getSingletRandom
