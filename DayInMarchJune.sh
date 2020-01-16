#!/bin/bash

#CONSTANTS
MARCH=3
APRIL=4
MAY=5
JUNE=6

function IsDayExistsInMarchOrJune(){
	if (( $2 == $MARCH )) && (( $1 >= 20 )) && (( $1 <= 31 ))
	then
		echo "true"
	elif (( $2 == $APRIL )) && (( $1 >= 1 )) && (( $1 <= 30 ))
	then
		echo "true"
	elif (( $2 == $MAY )) && (( $1 >= 1 )) && (( $1 <= 31 ))
	then
		echo "true"
	elif (( $2 ==  $JUNE )) && (( $1 >=1 )) && (( $1 <= 30 ))
	then
		echo "true"
	else
		echo "false"
	fi
}

IsDayExistsInMarchOrJune $1 $2
