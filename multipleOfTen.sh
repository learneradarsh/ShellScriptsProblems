#!/bin/bash

function convertNumberInWord(){
	if (( number >= 0 )) && (( number <= 9 ))
	then
		echo "Ones"
	elif (( number >= 10 )) && (( number <= 99 ))
 	then
		echo "Tens"
	elif (( number >= 100 )) && (( number <= 999 ))
	then
		echo "Hundred"
	elif (( number >= 1000 )) && (( number <= 9999 ))
	then
		echo "Thousand"
	elif (( number == 10000 )) && (( number <= 99999 ))
	then
		echo "Ten Thousand"
	elif (( number == 100000 )) && (( number <= 999999 ))
	then
		echo "Lakh"
	else
		echo "Out of Limit"
	fi
}
read -p "Enter a number" number
convertNumberInWord number
