#!/bin/bash

declare -a birthMonth
i=1

function getRandomMonth(){
	local month=$((RANDOM%12+1))
	echo $month
}

getRandomMonth

#generated random birth month between 92 ans 93

while (( i<=50 ))
do
	birthMonth[$i]=$(getRandomMonth)
	(( i++ ))
done

echo "Random birthdays of 50 people:" ${birthMonth[@]}

printf '%s\n' "${birthMonth[@]}"|awk '!($0 in seen){seen[$0];next} 1'
