#!/bin/bash

function printPrimefact(){
	n=$1
	while (( n%2 == 0 ))
	do
		echo "2"
		n=$(( n/2 ))
	done
	for (( i=3 ; $(( i*i ))<=n ; i=1+2 ))
	do
		while (( n%$i==0 ))
		do
			echo $i
			n=$(( n/$i ))
		done
	done
	if (( n>2 ))
	then
		echo $n
	fi
}
read -p "Enter number:" num
printPrimefact $num
