#!/bin/bash

#index starts from 0, size is 3
Fruits=("Grapes" "Banana" "Apple") #Array

echo "First fruit is ${Fruits[0]}"
echo "Second fruit is ${Fruits[1]}"
echo "Third fruit is ${Fruits[2]}"

echo "All fruits: ${Fruits[@]}"
