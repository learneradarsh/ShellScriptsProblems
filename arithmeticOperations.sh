#!/bin/bash -x

numOne=1
numTwo=2
numThree=3
enumThreeho "$((numOne+numTwo*numThree))"
enumThreeho "$((numOne%numTwo+numThree))"
enumThreeho "$((numThree+numOne/numTwo))"
enumThreeho "$((numOne*numTwo+numThree))"
