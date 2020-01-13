#!/bin/bash

#ASSUMPTIONS
#1=HEADS
#0=TAILS

#DICTIONARY
declare -a singlet=( [0]=0 [1]=0 )

#VARIABLES
counter=0
multiple=0

read -p "Enter number:" multiple

function getSingletRandom(){
	local randNumber=$((RANDOM%2))
	echo $randNumber
}

while (( i<$multiple ))
do
	r=$(getSingletRandom)
	case $r in
		1)
		singlet[$r]=$(( ${singlet[$r]}+1 ))
		;;
		0)
		singlet[$r]=$(( ${singlet[$r]}+1 ))
		;;
		*)
		echo "Nothing"
		;;
	esac
	(( i++ ))
done

echo "Singlet HeadsC: " ${singlet[1]}
res=`echo "scale=3; ${singlet[1]}*100/$multiple" | bc`
echo "HEADS %:" $res
echo "Singlet TailsC: " ${singlet[0]}
res=`echo "scale=3; ${singlet[0]}*100/$multiple" | bc`
echo "TAILS %:" $res


