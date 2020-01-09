#!/bin/bash

#coinflip using random function
readonly HEADS=1
readonly TAILS=0
function isHeads(){
	if (( randNumber == HEADS ))
	then
		echo "Heads"
	else
		echo "Tails"
}
randNumber=$((RANDOM%2))
isHeads
