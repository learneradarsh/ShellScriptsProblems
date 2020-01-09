#!/bin/bash -x
function genTwoDigitNumber(){
	echo "$(($((RANDOM%range))+10))"
}
range=$((99-10+1))
a=$(genTwoDigitNumber)
b=$(genTwoDigitNumber)
c=$(genTwoDigitNumber)
d=$(genTwoDigitNumber)
e=$(genTwoDigitNumber)
sum=$((a+b+c+d+e))
avg=$(($((a+b+c+d+e))/5))
echo $sum
echo $avg
