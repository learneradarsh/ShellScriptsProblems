#!/bin/bash -x

read -p "Enter number:" number

function isPrime(){

	if (( $number<=1 ))
	then
		return 0
	fi
	for (( i=2 ; $i<$number; $i++ ))
	do
		if (( $number%i==0 ))
		then
			return 0
		fi
	done
	return 1
}
isPrime $number
if (( $?==1 ))
then
	echo "PRIME"
else
	echo "NON-PRIME"
fi
