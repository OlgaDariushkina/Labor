#!/bin/bash
file=$1
var1=$2
var2=$3
sed -i -e "s/var1/var2/g" $file
less $file
