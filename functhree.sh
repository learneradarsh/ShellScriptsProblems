#!/bin/bash

reverse=0

function isPrime(){

	if (( $1<=1 ))
	then
		return 0
	fi
	for (( i=2 ; $i<$1; i++ ))
	do
		if (( $1%i==0 ))
		then
			return 0
		fi
	done
	return 1
}

function isPalindrome(){
	reverse=`echo "$numOne" | rev`
	if (( $reverse==$numOne ))
	then
		return $reverse
	else
		echo "Not Palindrome"
	fi
}
read -p "Enter Number:" numOne
isPrime $numOne
if (( $?==1 ))
then
	echo "PRIME"
else
	echo "NON PRIME"
fi
isPalindrome $numOne
if (( $?!=0 ))
then
	isPrime $reverse
	if (( $?==1 ))
	then
		echo "PALINDROME NUM IS PRIME"
	else
		echo "PALINDROME NUM IS NON-PRIME"
	fi
fi
