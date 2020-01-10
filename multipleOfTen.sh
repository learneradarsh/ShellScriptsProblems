#!/bin/bash

function convertNumberInWord(){
	if (( number == 1))
	then
		echo "One"
	elif (( number == 10 ))
	then
		echo "Ten"
	elif (( number == 100 ))
	then
		echo "Hundred"
	elif (( number == 1000 ))
	then
		echo "Thousand"
	elif (( number == 10000 ))
	then
		echo "Ten Thousand"
	elif (( number == 100000 ))
	then
		echo "Lakh"
	elif (( number == 1000000 ))
	then
		echo "Ten Lakh"
	elif (( number == 10000000 ))
	then
		echo "Crore"
	elif (( number == 100000000 ))
	then
		echo "Ten Crore"
	else
		echo "Out of Limit"
	fi
}
read -p "Enter a number in multiple of 10:" number
convertNumberInWord number
