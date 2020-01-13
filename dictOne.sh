#!/bin/bash

declare -a dice=( [1]=0 [2]=0 [3]=0 [4]=0 [5]=0 [6]=0 )
readonly MAX=10

counter=1

function diceRoll(){
	r=$(( RANDOM%6+1 ))
	dice[$r]=$((${dice[$r]}+1))
	echo ${dice[@]}
}

while :
do
	diceRoll
	if [[ ${dice[1]} -eq $MAX ]] || [[ ${dice[2]} -eq $MAX ]] || [[ ${dice[3]} -eq $MAX ]] || [[ ${dice[4]} -eq $MAX ]] || [[ ${dice[5]} -eq $MAX ]] || [[ ${dice[6]} -eq $MAX ]]
	then
		echo "Max Limit Reached:" ${dice[@]}
		break
	fi
done

#function for asc sorting
function ascSort(){
	dice=($(echo ${dice[*]}| tr " " "\n" | sort -n))
}

ascSort
echo "Sorted:" ${dice[@]}
echo "Indexes:" ${!dice[@]}
echo "Min:" ${dice[0]}
echo "Max" ${dice[5]}
