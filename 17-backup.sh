#!/bin/bash

SOURCE_DIR=$1
DESTINATION_DIR=$2
DAYS=${3:-14} #if user doesn't give days, take it as 14

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

USAGE(){
    echo -e "$R USAGE:: $N sh 17-backup.sh <source> <destination> <days(optional)>"
    exit 1
}

#check the source and destination are provided

if [ $# -lt 2 ]
then
    USAGE
fi

if [ ! -d $SOURCE_DIR ]
then
    echo "$SOURCE_DIR does not exist, please check"
    exit 1
fi

if [ ! -d $DESTINATION_DIR ]
then
    echo "$DESTINATION_DIR does not exist, please check"
    exit 1
fi

FILES=$(find $SOURCE_DIR -name "*.log" -mtime $DAYS)

echo "files:$FILES"

if [ ! -z $FILES ] #true if files is empty
then
    echo "files are found"
else
    echo "no files older than $DAYS"
fi



