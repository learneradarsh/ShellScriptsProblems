#!/bin/bash

i=0
rptArray=() #Repeated Number Array declaration
counter=0

function isPalindrome(){
	reverse=`echo "$1" | rev`
	if (( $reverse==$1 ))
	then
		rptArray[((counter++))]=$1
		return 1
	fi
}

while(( i<=100 ))
do
	if(( i>=10 ))
	then
		isPalindrome $i
	fi
	(( i++ ))
done

echo "Repeated Numbers are:" ${rptArray[@]}


