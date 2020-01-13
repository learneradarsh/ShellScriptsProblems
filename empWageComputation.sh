#!/bin/bash

readonly WAGEPERHOUR=20 #Employee wage per hour
readonly FDAYHOUR=8 #Employee full day working hour
#USECASE3
readonly PDAYHOUR=4 #Employee part time working hour
readonly ISFULLTIME=1
readonly ISPARTIME=2
readonly MONTH=20 #total working days in a month
readonly EMPFIXWORKINGHRS=100 #employee fixed working hours in a month
totalEmpWage=0 #Per month Employee wage
empTotWorkhrs=0 #Employee total working hours

#start
echo "Welcome to Employee Wage Computation Program"

#USECASE 1
function isEmployeePresent(){
	local attn=$(( RANDOM%2 ))
	if (( attn==1 ))
	then
		echo "EMPLOYEE IS PRESENT"
		return 1
	else
		echo "EMPLOYEE IS ABSENT"
		return 0
	fi
}

#USECASE 2
function calcEmployeeWage(){
	local empTypeCheck=$(( RANDOM%3 ))
	local wage=0
	local empHrs=0
	case $empTypeCheck in
		$ISFULLTIME)
				empHrs=FDAYHOUR
				;;
		$ISPARTIME)
				empHrs=PDAYHOUR
				;;
		*)
				empHrs=0
				;;
	esac
	if (( empHrs==$EMPFIXWORKINGHRS ))
	then
		break
	fi
	wage=$(( WAGEPERHOUR*empHrs ))
	echo "Per Day Wage:"$wage
	empTotWorkHrs=$(( empTotWorkHrs+empHrs ))
	totalEmpWage=$(( wage+totalEmpWage ))
}

for (( day=1 ; day<=$MONTH ; day++ ))
do
	isEmployeePresent
	if (( $?==1 ))
		then
		calcEmployeeWage
	else
		echo "Per Day Wage=0"
	fi
done
echo "Monthly Employee Wage:" $totalEmpWage
echo "Employee Total working hrs:" $empTotWorkHrs
