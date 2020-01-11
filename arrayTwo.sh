#!/bin/bash

readonly range=$((999-100+11))
counter=0
asc=0
desc=0
size=0
arr=()

#functin for generating three digit random num
function genThreeDigitNumber(){
	echo "$(($((RANDOM%range))+100))"
}

#function for asc sorting
function ascSort(){
	arr=("$@")
   for (( i=0; i<10; i++ ))
do
    for(( j=i; j<$(( 10 )); j++ ))
    do
        if (( ${arr[$i]}>${arr[$(( j+1 ))]} ))
        then
            #swap
            temp=${arr[$i]}
            arr[$i]=${arr[$((j+1))]}
            arr[$((j+1))]=$temp
        fi
    done
done
}

while (( i<=10 ))
do
	num[((counter++))]=$( genThreeDigitNumber )
	(( i++ ))
done

ascSort ${num[@]}

size=${#arr[@]}
echo "Sorted Array in asc:" ${arr[@]}
echo "SecondLargest:" ${arr[$(( $size-2 ))]}
echo "SecondSmallest:" ${arr[1]}
