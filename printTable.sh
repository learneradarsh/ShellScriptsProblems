#!/bin/bash

function printTable(){
	for (( i=0 ; i <= $1 ; i++ ))
	do
		echo $((2**$i))
	done
}
printTable $1
