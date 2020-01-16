#!/bin/bash -x

#day finder using Gregorian Calendar Formula by taking date as a input

function findDayFromDate(){
	yZero=$(($3-$(($((14-$1))/12))))
	x=$(($yZero+$(($yZero/4))-$(($yZero/100))+$(($yZero/400))))
	mZero=$(($1+12*$(($(($((14-$1))/12))-2))))
	day=$(($(($2+$x+31*$mZero/12))%7))
	echo $day
}

findDayFromDate $1 $2 $3
