#!/bin/bash -x

declare -a res

#usecase one
read -p "Enter three numbers:" a b c

#usecase two
res[0]=$(( a+b*c ))

#usecase three
res[1]=$(( a*b+c ))

#usecase four
res[2]=$(( c+a/b ))

#usecase five
res[3]=$(( a%b+c ))

#usecase six
echo "Results are:"${res[@]}
