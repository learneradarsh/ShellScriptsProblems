
#!/bin/bash -x

declare -A birthMonth

birthMonth["JAN"]=0
birthMonth["FEB"]=0
birthtMonth["MAR"]=0
birthMonth["APR"]=0
birthMonth["MAY"]=0
birthMonth["JUN"]=0
birthMonth["JUL"]=0
birthMonth["AUG"]=0
birthMonth["SEPT"]=0
birthMonth["OCT"]=0
birthMonth["NOV"]=0
birthMonth["DEC"]=0

i=1

function getBirthMonth(){
	r=$(getRandomMonth)
	if (( r==1 ))
	then
		birthMonth["JAN"]=$(( ${birthMonth["JAN"]}+1 ))
	elif (( r==2 ))
	then
		birthMonth["FEB"]=$(( ${birthMonth["FEB"]}+1 ))
	elif (( r==3 ))
	then
		birthMonth["MAR"]=$(( ${birthMonth["MAR"]}+1 ))
	elif (( r==4 ))
	then
		birthMonth["APR"]=$(( ${birthMonth["APR"]}+1 ))
	elif (( r==5 ))
	then
		birthMonth["MAY"]=$(( ${birthMonth["MAY"]}+1 ))
	elif (( r==6 ))
	then
		birthMonth["JUN"]=$(( ${birthMonth["JUN"]}+1 ))
	elif (( r==7 ))
	then
		birthMonth["JULY"]=$(( ${birthMonth["JULY"]}+1 ))
	elif (( r==8 ))
	then
		birthMonth["AUG"]=$(( ${birthMonth["AUG"]}+1 ))
	elif (( r==9 ))
	then
		birthMonth["SEPT"]=$(( ${birthMonth["SEPT"]}+1 ))
	elif (( r==10 ))
	then
		birthMonth["OCT"]=$(( ${birthMonth["OCT"]}+1 ))
	elif (( r==11 ))
	then
		birthMonth["NOV"]=$(( ${birthMonth["NOV"]}+1 ))
	else
		birthMonth["DEC"]=$(( ${birthMonth["DEC"]}+1 ))
	fi
}
function getRandomMonth(){
	local month=$((RANDOM%12+1))
	echo $month
}

#generated random birth month between 92 ans 93

while (( i<=50 ))
do
	getBirthMonth
	(( i++ ))
done

echo -e "Random birthdays of 50 people:" ${!birthMonth[@]} "\n" ${birthMonth[@]}
