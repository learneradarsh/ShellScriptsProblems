#!/bin/bash

#start
echo "Welcome to Employee Wage Computation Program"

#USECASE 1
function isEmployeePresent(){
	local attn=$(( RANDOM%2 ))
	if (( attn==1 ))
	then
		echo "PRESENT"
	else
		echo "ABSENT"
	fi
}

isEmployeePresent
