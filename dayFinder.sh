#!/bin/bash -x

#day finder using Gregorian Calendar Formula by taking date as a input

function findDayFromDate(){
	echo $month $day $year
	yZero=$(($year-$(($((14-$month))/12))))
	x=$(($yZero+$(($yZero/4))-$(($yZero/100))+$(($yZero/400))))
	mZero=$(($month+12*$(($(($((14-$month))/12))-2))))
	day=$(($(($day+$x+31*$mZero/12))%7))
	echo $day
}
read -p "Enter date  in m(month) d(day) y(year) format:" month day year
findDayFromDate $month $day $year
