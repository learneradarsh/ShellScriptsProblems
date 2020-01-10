#!/bin/bash -x

read -p "Enter number:" number
for (( i=2 ; $i <= $(( $number / 2 )) ; i++ ))
do
	if (( number%i == 0 ))
	then
		ISPRIME=0
		break
	fi
done
if(( ISPRIME != 0 ))
then
	echo "PRIME"
else
	echo "NON-PRIME"
fi

