#!/bin/bash

num=() #initiliased array
k=0
readonly SUM=0
size=0

#function for asc sorting
function ascSort(){
	num=($(echo ${num[*]}| tr " " "\n" | sort -n))
}

read -p "Total Number of inputs:" size
echo  "Enter numbers:"
while (( $k<$size ))
do
	read num[$k]
	(( k++ ))
done


#function to find triplet of zero
function findTriplet(){
	ascSort ${num[@]}
	while (( x<size-2 ))
	do
		l=$(( x+1 ))
		r=$(( size-1 ))
		while (( l<r ))
		do
			if (( ${num[$i]}+${num[$l]}+${num[$r]}==SUM ))
			then
				echo "Triplet is:" ${num[$i]} ${num[$l]} ${num[$r]}
				return 1
			elif (( ${num[$i]}+${num[$l]}+${num[$r]}<SUM ))
			then
				(( l++ ))
			else
				(( r-- ))
			fi
		done
		(( x++ ))
	done
	echo "No Triplet Found"
}

findTriplet
