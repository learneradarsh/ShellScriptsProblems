#!/bin/bash -x

function genThreeDigitNumber(){
	echo "$(($((RANDOM%range))+100))"
}
function findMax(){
	if (( $a >= $b )) && (( $a >= $c )) && (( $a >= $d )) && (( $a >= $e ))
	then
		echo "Max value :" $a
	elif (( $b >= $a )) && (( $b >= $c )) && (( $b >= $d )) && (( $b >= $e ))
	then
		echo "Max value :" $b
	elif (( $c >= $a )) && (( $c >= $b )) && (( $c >= $d )) && (( $c >= $e ))
	then
		echo "Max value :" $c
	elif (( $d >= $a )) && (( $d >= $b )) && (( $d >= $c )) && (( $d >= $e ))
	then
		echo "Max value :" $d
	else
		echo "Max value :" $e
	fi
 }
function findMin(){
	echo "text"
}
range=$((999-100+11))
a=$(genThreeDigitNumber)
b=$(genThreeDigitNumber)
c=$(genThreeDigitNumber)
d=$(genThreeDigitNumber)
e=$(genThreeDigitNumber)
findMax $a $b $c $d $e
