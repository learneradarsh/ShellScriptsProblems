#!/bin/bash

readonly WAGEPERHOUR=20 #Employee wage per hour
readonly FDAYHOUR=8 #Employee full day working hour

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

#USECASE 2
function calcEmployeeWage(){
	local wage=$(( WAGEPERHOUR*FDAYHOUR ))
	echo $wage
}

calcEmployeeWage
