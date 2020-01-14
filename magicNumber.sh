#!/bin/bash -x

head=0
tail=100
res=0

echo "Think of a Number between 1 to 100:"
function calc(){
	res=$(( (head+tail)/2 ))
	echo $res
}

while (( $head <= $tail ))
do
	calc
	read -p "Number is greater than $res :(Y/N)" inp
	if [[ $inp == 'Y' ]]
	then
		head=$res
		if (( $(( head-tail )) == 1 ))
		then
			echo "Your num is:" $head
			break
		fi
	else
		tail=$res
		if (( $(( tail-head )) == 1 ))
		then
			echo "Your num is:" $tail
			break
		fi
	fi
done
