#!/bin/bash

function convertInchIntoFeet(){
	res=`echo "scale=2; $1*1/12" | bc`
	echo $res
}
convertInchIntoFeet 42
