#!/bin/bash
readonly LIMIT=256
function printTable(){
	i=0
	while [ $i -le $1 ]
	do
		if (( $i > $LIMIT ))
		then
			break
		fi
		echo $((2**$i))
		(( i++ ))
	done
}
printTable $1
