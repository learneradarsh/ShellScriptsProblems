#!/bin/bash

function isPrime(){

	if (( $j<=1 ))
	then
		return 0
	fi
	for (( i=2 ; $i<$j; i++ ))
	do
		if (( $j%$i==0 ))
		then
			return 0
		fi
	done
	return 1
}
read -p "Enter Lowest and Highet Range:" lowest highest
for (( j=lowest; $j<=$highest; j++ ))
do
	isPrime $j
	if (( $?==1 ))
	then
		echo "Prime Number:" $j
	fi
done
