#!/bin/bash -x
a=1
b=2
c=3
echo "$(($a+$b*$c))"
echo "$(($a%$b+$c))"
echo "$(($c+$a/$b))"
echo "$(($a*$b+$c))"
