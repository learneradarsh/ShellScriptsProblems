#!/bin/bash -x

declare -a res
declare -a sec
size=0 #size of dictionary res
counter=0

#USECASE ONE
read -p "Enter three numbers:" a b c

#USECASE TWO
res[0]=$(( a+b*c ))

#USECASE THREE
res[1]=$(( a*b+c ))

#USECASE FOUR
res[2]=$(( c+a/b ))

#USECASE FIVE
res[3]=$(( a%b+c ))

#USECASE SIX
echo "Results are:" ${res[@]}

#USECASE SEVEN
size=$(( ${#res[@]} ))

#trasnfered value from res to sec
while(( counter<size ))
do
	sec[counter++]=$(( ${res[counter]} ))
done

#printed value of sec array
echo ${sec[@]}

#USECASE EIGHT

#function for desc sort
function descSort(){
	local arr=("$@")
	arr=($(echo ${arr[*]}| tr " " "\n" | sort -n -r))
	echo "Desc sorted array:" ${arr[@]}
}

descSort ${sec[@]}
