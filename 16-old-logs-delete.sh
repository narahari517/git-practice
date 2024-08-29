#!/bin/bash

Source_directory=/home/ec2-user/logs
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ -d $Source_directory ]
then
    echo -e "$Source_directory $G exists $N"
else
    echo -e "$Source_directory $R does not exist $N"
    exit 1
fi

FILES=$(find $Source_directory -name "*.log" -mtime +14)
echo "Files=$FILES"

while IFS= read -r file
do
    echo "Deleting line: $file"
    rm -rf $file
done <<< $FILES
