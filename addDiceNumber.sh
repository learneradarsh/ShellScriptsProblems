#!/bin/bash -x

firstRandNum=$((RANDOM%6))
secRandNum=$((RANDOM%6))
sumOfRandomDiceNumber=$((firstRandNum+secRandNum))
echo $sumOfRandomDiceNumber
