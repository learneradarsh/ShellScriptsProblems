
#!/bin/bash

#CONSTANTS
readonly WAGEPERHOUR=20 #Employee wage per hour
readonly FDAYHOUR=8 #Employee full day working hour
readonly PDAYHOUR=4 #Employee part time working hour
readonly ISFULLTIME=1
readonly ISPARTIME=2
readonly MONTH=20 #total working days in a month
readonly EMPFIXWORKINGHRS=100 #employee fixed working hours in a month

#VARIBLES
totalEmpWage=0 #Per month Employee wage
empTotWorkhrs=0 #Employee total working hours
declare -a empDailyWage
totalWorkDay=0

#start
echo "Welcome to Employee Wage Computation Program"

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
	#calculate employee daily wage
	empDailyWage[(counter++)]=$(( ${empDailyWage[counter]}+wage))
	echo "Per Day Wage:"$wage
	#calculate employee total working hours
	empTotWorkHrs=$(( empTotWorkHrs+empHrs ))
	totalEmpWage=$(( wage+totalEmpWage ))
}

for (( day=1 ; day<=$MONTH ; day++ ))
do
	isEmployeePresent
	if (( $?==1 ))
		then
		(( totalWorkDay++ ))
		calcEmployeeWage
	else
		echo "Per Day Wage=0"
	fi
done

echo "Monthly(Total) Employee Wage:" $totalEmpWage
echo "Employee Total working hrs:" $empTotWorkHrs
echo "Employee daily wage:" ${empDailyWage[@]}
echo "Total Working Days:" $totalWorkDay
