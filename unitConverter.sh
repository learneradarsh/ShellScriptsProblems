#!/bin/bash

function ftIntoInch(){
	res=`echo "scale=2; $numInFt * 12" | bc`
	echo $res
}

function inchIntoFt(){
	res=`echo "scale=2; $numInInch * 1/12" | bc`
	echo $res
}

function ftIntoMeter(){
	res=`echo "scale=2; $numTwoInFt / 3.28" | bc`
	echo $res
}

function meterIntoFt(){
	res=`echo "scale=2; $numInMeter * 3.281" | bc`
	echo $res
}

select INPUT in "Feet Into Inch" "Inch Into Feet" "Feet Into Meter" "Meter Into Feet" "Exit"
do
	case $INPUT in
		"Feet Into Inch")
		read -p "Input Number:" numInFt
		ftIntoInch $numInFt
		;;
		"Inch Into Feet")
		read -p "Input Number:" numInInch
		inchIntoFt $numInInch
		;;
		"Feet Into Meter")
		read -p "Input Number:" numTwoInFt
		ftIntoMeter $numTwoInFt
		;;
		"Meter Into Feet")
		read -p "Input Number:" numInMeter
		meterIntoFt $numInMeter
		;;
		Exit)
		break
		;;
		*)
		echo "Not a valid input"
		exit 1
		;;
	esac
done
