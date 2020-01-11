#!/bin/bash

readonly range=$((999-100+11))
counter=0
i=1

function genThreeDigitNumber(){
	echo "$(($((RANDOM%range))+100))"
}
while (( $i<=10 ))
do
	num[((counter++))]=$( genThreeDigitNumber )
	(( i++ ))
done
echo ${num[@]}
