#!/bin/bash -x

readonly FREEZPOINTINF=32 #freezing point in degF
readonly FREEZPOINTINC=0 #freezing point in degC
readonly BOILPOINTINF=212 #boiling point in degF
readonly BOILPOINTINC=100 #boiling point in degC

function findDegF(){
	res=`echo "scale=3; ($inputDegC*9/5)+32" | bc`
	echo $res
}

function findDegC(){
	res=`echo "scale=3; ($inputDegF-32)*5/9" | bc`
	echo $res
}

select INPUT in "Find DegF" "Find DegC" "Exit"
do
	case $INPUT in
		"Find DegF")
		read -p "Enter Temp in DegC:" inputDegC
		if (( inputDegC>=FREEZPOINTINC )) && (( inputDegC<=BOILPOINTINC ))
		then
			findDegF inputDegC
		fi
		;;
		"Find DegC")
		read -p "Enter Temp in DegF:" inputDegF
		if (( inputDegF>=FREEZPOINTINF )) && (( inputDegF<=BOILPOINTINF ))
		then
			findDegC inputDegF
		fi
		;;
		"Exit")
		exit 1
		;;
		*)
		echo "Invalid input"
		break
	esac
done
