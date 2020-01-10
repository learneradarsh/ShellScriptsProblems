#!/bin/bash -x

function printPrimefact(){
	for (( i=0 ; $(i*i) < num ; i++ ))
	do
		echo $i
	done
}
read -p "Enter number:" num
