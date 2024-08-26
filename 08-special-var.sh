#!/bin/bash

echo "All the variables passed to the script: $@"
echo "Number of variables passed: $#"
echo "Script Name: $0"
echo "Current Working Directory: $PWD"
echo "Home directory of current user is $HOME"
echo "PID of the script executing now: $$"
sleep 100 &
echo "PID of the last background command: $!"