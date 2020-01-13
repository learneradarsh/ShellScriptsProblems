#!/bin/bash

#start
echo "Welcome to Employee Wage Computation Program"

#USECASE 1
function isEmployeePresent(){
	local attn=$(( RANDOM%2 ))
	echo $attn
}

isEmployeePresent
