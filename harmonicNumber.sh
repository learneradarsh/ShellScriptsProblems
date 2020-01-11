#!/bin/bash -x

function printHarmonic(){
	for i in `seq $1`
	do
		sum=`echo "scale=2; sum + 1/$i" | bc`
	done
	echo $sum
}
printHarmonic $1
