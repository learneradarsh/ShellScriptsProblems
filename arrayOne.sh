#!/bin/bash -x

readonly range=$((999-100+11))
counter=0
i=1

function genThreeDigitNumber(){
	echo "$(($((RANDOM%range))+100))"
}

function secondLargest(){
	local first=0
	local second=0
	local INT_MIN=0
	local arr=("$@")
	local size=$(( ${#arr[@]} ))
	if (( size<2 ))
	then
		echo "invalid input"
		return
	fi
	for (( x=0 ; x<size ; x++ ))
	do
		if (( ${arr[$x]}>first ))
		then
			second=$(( first ))
			first=${arr[$x]}
		elif (( ${arr[$x]}>second )) && (( ${arr[$x]}!=first ))
		then
			second=${arr[$x]}
		fi
	done
	if (( second==INT_MIN ))
	then
		echo "No second largest number element found"
	else
		echo "Second largest number is:" $second
	fi
}

function secondSmallest(){
	local first=0
	local second=0
	local INT_MIN=0
	local arr=("$@")
	local size=$(( ${#arr[@]} ))
	if (( size<2 ))
	then
		echo "invalid input"
		return
	fi
	for (( y=0 ; y<size ; y++ ))
	do
		if (( ${arr[$y]}<first ))
		then
			second=$(( first ))
			first=${arr[$y]}
		elif (( ${arr[$y]}<second )) && (( ${arr[$y]}!=first ))
		then
			second=${arr[$y]}
		fi
	done
	if (( second==INT_MIN ))
	then
		echo "No second smallest number element found"
	else
		echo "Second smallest number is:" $second
	fi
}
while (( $i<=10 ))
do
	num[((counter++))]=$( genThreeDigitNumber )
	(( i++ ))
done
echo "Random number:"${num[@]}
secondLargest ${num[@]}
secondSmallest ${num[@]}
