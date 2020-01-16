#!/bin/bash -x

a=$((RANDOM%6))
b=$((RANDOM%6))
sumOfRandomDiceNumber=$((a+b))
echo $sumOfRandomDiceNumber
