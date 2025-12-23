#!/bin/bash

$NUMBER1=$1
$NUMBER2=$2

SUM=$(($NUMBER1+$NUMBER2))

echo "The sum of $number1 and $number2 : $SUM"

TIMESTAMP=$(date)

echo "Script exicuted at : $TIMESTAMP"