#!/bin/bash

function convertDigitIntoWord(){
	if (( $digit == 0 ))
	then
		echo "Zero"
	elif (( $digit == 1 ))
	then
		echo "One"
	elif (( $digit == 2 ))
	then
		echo "Two"
	elif (( $digit == 3 ))
	then
		echo "Three"
	elif (( $digit == 4 ))
	then
		echo "Four"
	elif (( $digit == 5 ))
	then
		echo "Five"
	elif (( $digit == 6))
	then
		echo "Six"
	elif (( $digit == 7 ))
	then
		echo "Seven"
	elif (( $digit == 8 ))
	then
		echo "Eight"
	elif (( digit == 9 ))
	then
		echo "Nine"
	else
		echo "Not a valid input"
	fi
}
read -p "Enter Single Digit:" digit
convertDigitIntoWord digit
