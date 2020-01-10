#!/bin/bash -x

function isPalindrome(){
	numOne=`echo "$numOne" | rev`
	echo $numOne
	if (( $numOne==$numTwo ))
	then
		echo "Palindrome"
	else
		echo "Not Palindrome"
	fi
}
read -p "Enter Two Number:" numOne numTwo
isPalindrome $numOne $numTwo
