#!/bin/bash

readonly YES="Y"
readonly NO="N"

echo "Think of a Number between 1 to 100:"

function greater(){
	echo "greater"
}

function smaller(){
	for (( i=50 ; i<50 ; i++ ))
	do
		return 
	done
}

while :
do
read -p "Number is less than 50(Y/N):" ans
if (( "$ans" == "$YES" ))
then
	smaller
elif (( "$ans" == "$NO" ))
then
	greater
else
	echo "Not a valid input"
fi
done
