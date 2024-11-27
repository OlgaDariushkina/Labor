#!/bin/bash
set -x
echo "Enter a number"
read n
if [ $n -eq 0 ]; then
    echo "$n is zero"
elif [ $n -lt 0 ]; then
    echo "$n is negative"
else
    echo "$n is positive"
fi
