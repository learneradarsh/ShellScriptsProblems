#!/bin/bash

function IsDayExistsInMarchOrJune(){
	if (( $2 == $march )) && (( $1 >= 20 )) || (( $1 <= 31 ))
	then
		echo "true"
	elif (( $2 == $april )) && (( $1 >= 1 )) || (( $1 <= 30 ))
	then
		echo "true"
	elif (( $2 == $may )) && (( $1 >= 1 )) || (( $1 <= 31 ))
	then
		echo "true"
	elif (( $2 ==  $june )) && (( $1 >=1 )) || (( $1 <= 30 ))
	then
		echo "true"
	else
		echo "false"
	fi
}
march=3
april=4
may=5
june=6
IsDayExistsInMarchOrJune $1 $2
