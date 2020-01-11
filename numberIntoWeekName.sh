#!/bin/bash
# Assumption for days calculation:
# Sunday = 0
# Monday = 1
# Tuesday = 2
# Wednesday = 3
# Thursday = 4
# Friday = 5
# Saturday = 6

function convertNumberIntoWeek(){
	if (( day == 0 ))
	then
		echo "Sunday"
	elif (( day == 1 ))
	then
		echo "Monday"
	elif (( day == 2 ))
	then
		echo "Tuesday"
	elif (( day == 3 ))
	then
		echo "Wednesday"
	elif (( day == 4 ))
	then
		echo "Thursday"
	elif (( day == 5 ))
	then
		echo "Friday"
	elif (( day == 6 ))
	then
		echo "Saturday"
	else
		echo "Not a valid input"
	fi
}
read -p "Enter Day In Number (0 - Sunday, 6 - Saturday):" day
convertNumberIntoWeek day
