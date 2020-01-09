#!/bin/bash -x

function convertFeetIntoMeters(){
	resInMeters=`echo "scale=2; $1/3.2808" | bc`
	echo $resInMeters
}
function convertMeterIntoAcres(){
	resInAcres=`echo "scale=2; $1*0.00024711" | bc`
	echo $resInAcres
}
function areaOfPlot(){
	echo $(($1*$2))
}
finalAreaOfPlots=$(($(areaOfPlot 60 40)*25))
finalAreaInMeters=$(convertFeetIntoMeters $finalAreaOfPlots)
finalAreaInAcres=$(convertMeterIntoAcres $finalAreaInMeters)
echo $finalAreaInAcres
