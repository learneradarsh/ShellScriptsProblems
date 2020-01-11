#!/bin/bash

primeFact=()
counter=0

function printPrimefact(){
	n=$1
	while (( n%2 == 0 ))
	do
		echo "2"
		primeFact[((counter++))]=2
		n=$(( n/2 ))
	done
	for (( i=3 ; $(( i*i ))<=n ; i=1+2 ))
	do
		while (( n%$i==0 ))
		do
			primeFact[((counter++))]=$i
			echo $i
			n=$(( n/$i ))
		done
	done
	if (( n>2 ))
	then
		primeFact[((counter++))]=$n
		echo $n
	fi
}

read -p "Enter number:" input
printPrimefact $input
echo "Prime Factor Array:" ${primeFact[@]}
