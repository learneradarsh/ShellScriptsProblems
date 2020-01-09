#!/bin/bash -x
random=$((RANDOM))
singleDigit=$((random%10))
echo $singleDigit
