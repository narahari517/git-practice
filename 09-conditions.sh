#!/bin/bash

Number=$1
if [ $Number -gt 50 ]
then 
    echo "Given number: $Number is greater than 50"
else
    echo "Given number: $Number is less than 50"
fi
