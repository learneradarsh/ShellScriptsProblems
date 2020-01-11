#!/bin/bash

f=1
function fact(){
	for (( i = 1 ; i <= num ; i++ ))
	do
		f=$((f*i))
	done
	echo "fact is:" $f
}
read -p "Enter Number:" num
fact num
