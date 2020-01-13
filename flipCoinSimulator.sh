#!/bin/bash

#ASSUMPTIONS
#1=HEADS
#0=TAILS

#DICTIONARY
declare -a singlet=( [0]=0 [1]=0 )
declare -a doublet=( [00]=0 [01]=0 [11]=0 [10]=0 )
declare -a triplet=( [000]=0 [001]=0 [011]=0 [111]=0 [101]=0 [110]=0 [100]=0 [010]=0 )

#VARIABLES
multiple=0

read -p "Enter number:" multiple

function getSingletRandom(){
	local randNumber=$((RANDOM%2))
	echo $randNumber
}

function getDoubletRandom(){
	local r1=$((RANDOM%2))
	local r2=$((RANDOM%2))
	local randNumber="${r1}${r2}"
	echo $randNumber
}

function getTripletRandom(){
	local r1=$((RANDOM%2))
	local r2=$((RANDOM%2))
	local r3=$((RANDOM%2))
	local randNumber="${r1}${r2}${r3}"
	echo $randNumber
}
while (( i<$multiple ))
do
	r=$(getSingletRandom)
	case $r in
		1)
		singlet[$r]=$(( ${singlet[$r]}+1 ))
		;;
		0)
		singlet[$r]=$(( ${singlet[$r]}+1 ))
		;;
		*)
		echo "Nothing"
		;;
	esac
	r=$(getDoubletRandom)
	case $r in
		00)
		doublet[$r]=$(( ${doublet[$r]}+1 ))
		;;
		01)
		doublet[$r]=$(( ${doublet[$r]}+1 ))
		;;
		10)
		doublet[$r]=$(( ${doublet[$r]}+1 ))
		;;
		11)
		doublet[$r]=$(( ${doublet[$r]}+1 ))
		;;
		*)
		echo "Nothing"
		;;
	esac
	r=$(getTripletRandom)
	case $r in
		000)
		triplet[$r]=$(( ${triplet[$r]}+1 ))
		;;
		001)
		triplet[$r]=$(( ${triplet[$r]}+1 ))
		;;
		011)
		triplet[$r]=$(( ${triplet[$r]}+1 ))
		;;
		111)
		triplet[$r]=$(( ${triplet[$r]}+1 ))
		;;
		100)
		triplet[$r]=$(( ${triplet[$r]}+1 ))
		;;
		110)
		triplet[$r]=$(( ${triplet[$r]}+1 ))
		;;
		010)
		triplet[$r]=$(( ${triplet[$r]}+1 ))
		;;
		101)
		triplet[$r]=$(( ${triplet[$r]}+1 ))
		;;
		*)
		echo "Nothing"
		;;
	esac
	(( i++ ))
done

#singlet
echo "Singlet HeadsC: " ${singlet[1]}
res=`echo "scale=3; ${singlet[1]}*100/$multiple" | bc`
echo "HEADS %:" $res
echo "Singlet TailsC: " ${singlet[0]}
res=`echo "scale=3; ${singlet[0]}*100/$multiple" | bc`
echo "TAILS %:" $res

#doublet
echo "Doublet TT: " ${doublet[00]}
res=`echo "scale=3; ${doublet[00]}*100/$multiple" | bc`
echo "TT %:" $res

echo "Doublet HH: " ${doublet[11]}
res=`echo "scale=3; ${doublet[11]}*100/$multiple" | bc`
echo "HH %:" $res

echo "Doublet HT: " ${doublet[10]}
res=`echo "scale=3; ${doublet[10]}*100/$multiple" | bc`
echo "HT %:" $res

echo "Doublet TH: " ${doublet[01]}
res=`echo "scale=3; ${doublet[01]}*100/$multiple" | bc`
echo "TH %:" $res

#triplet
echo "Triplet HHH: " ${triplet[111]}
res=`echo "scale=3; ${triplet[111]*100/$multiple}" | bc`
echo "HHH %:" $res

echo "Triplet TTT: " ${triplet[000]}
res=`echo "scale=3; ${triplet[000]*100/$multiple}" | bc`
echo "TTT %:" $res

echo "Triplet HTT: " ${triplet[100]}
res=`echo "scale=3; ${triplet[100]*100/$multiple}" | bc`
echo "HTT %:" $res

echo "Triplet HHT: " ${triplet[110]}
res=`echo "scale=3; ${triplet[110]*100/$multiple}" | bc`
echo "HHT %:" $res

echo "Triplet HTH: " ${triplet[101]}
res=`echo "scale=3; ${triplet[101]*100/$multiple}" | bc`
echo "HTH %:" $res

echo "Triplet THT : " ${triplet[010]}
res=`echo "scale=3; ${triplet[010]*100/$multiple}" | bc`
echo "THT %:" $res

echo "Triplet THH: " ${triplet[011]}
res=`echo "scale=3; ${triplet[011]*100/$multiple}" | bc`
echo "THH %:" $res

echo "Triplet TTH: " ${triplet[001]}
res=`echo "scale=3; ${triplet[00]*100/$multiple}" | bc`
echo "TTH %:" $res
