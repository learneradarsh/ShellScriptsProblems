#!/bin/bash

function convertNumIntoWord(){
	case "$number" in
		1) echo "One"
		;;
		10) echo "Ten"
		;;
		100) echo "Hundred"
		;;
		1000) echo "Thousand"
		;;
		10000) echo "Ten Thousand"
		;;
		100000) echo "Lakh"
		;;
		*)
		echo "Out of limit"
		exit 1
		;;
	esac
}

read -p "Enter Number:(1,10,100,etc):" number
convertNumIntoWord number
