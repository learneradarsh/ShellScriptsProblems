#!/bin/bash

function findMinExp(){

	if (( $expOne <= $expTwo )) && (( $expOne <= $expThree )) && (( $expOne <= $expFour ))
	then
		echo "Min:" $expOne
	elif (( $expTwo <= $expOne )) && (( $expTwo <= $expThree )) && (( $expTwo <= $expFour ))
	then
		echo "Min:" $expTwo
	elif (( $expThree <= $expOne )) && (( $expThree <= $expTwo )) && (( $expThree <= $expFour ))
	then
		echo "Min:" $expThree
	else
		echo "Min:" $expFour
	fi
}
function findMaxExp(){

	if (( $expOne >= $expTwo )) && (( $expOne >= $expThree )) && (( $expOne >= $expFour ))
	then
		echo "Max:" $expOne
	elif (( $expTwo >= $expOne )) && (( $expTwo >= $expThree )) && (( $expTwo >= $expFour ))
	then
		echo "Max:" $expTwo
	elif (( $expThree >= $expOne )) && (( $expThree >= $expTwo )) && (( $expThree >= $expFour ))
	then
		echo "Max:" $expThree
	else
		echo "Max:" $expFour
	fi
}

read -p  "Enter a,b, and c in numbers:" a b c
expOne=$(( a+b*c ))
expTwo=$(( a%b+c ))
expThree=$(( c+a/b ))
expFour=$(( a*b+c ))
echo $expOne $expTwo $expThree $expFour
findMinExp expOne expTwo expThree expFour
findMaxExp expOne expTwo expThree expFour
