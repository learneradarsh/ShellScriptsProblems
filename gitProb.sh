#!/bin/bash -x

#usecase one
read -p "Enter three numbers:" a b c

#usecase two
resOne=$(( a+b*c ))

#usecase three
resTwo=$(( a*b+c ))

#usecase four
resThree=$(( c+a/b ))
