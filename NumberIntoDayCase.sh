#!/bin/bash
#ASSUMPTIONS FOR DAYS
#SUNDAY=0
#MONDAY=1
#TUESDAY=2
#WEDNESDAY=3
#THURSDAY=4
#FRIDAY=5
#SATURDAY=6

function convertNumberIntoDay(){
	case "$day" in
		0) echo "Sunday"
		;;
		1) echo "Monday"
		;;
		2)	echo "Tuesday"
		;;
		3) echo "Wednesday"
		;;
		4) echo "Thursday"
		;;
		5) echo "Friday"
		;;
		6) echo "Saturday"
		;;
		*) echo "Not a valid input"
		;;
	esac
}
read -p "Enter Number for Day (0-Sunday, 6-Saturday):" day
convertNumberIntoDay day
