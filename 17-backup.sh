#!/bin/bash

SOURCE_DIR=$1
DESTINATION_DIR=$2
DAYS=${3:-14} #if user doesn't give days, take it as 14
Timestamp=$(date +%Y-%m-%d-%H-%M-%S)

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

FILES=$(find ${SOURCE_DIR} -name "*.log" -mtime +14)

echo "files:$FILES"

if [ ! -z $FILES ] #true if files is empty, ! makes the expression false
then
    echo "files are found"
    ZIP_FILE="$DESTINATION_DIR/app-logs-$Timestamp.zip"
    find ${SOURCE_DIR} -name "*.log" -mtime +14 | zip $ZIP_FILE -@

    #check if zip fine is successfully created or not
    if [ -f $ZIP_FILE ]
    then
        echo "Successfully zipped files older than $DAYS"
        #remove the files after zipping
        while IFS= read -r file
        do
            echo "Deleting line: $file"
            rm -rf $file
        done <<< $FILES
    else
        echo "zipping the files is failed"
        exit 1
    fi        
else
    echo "no files older than $DAYS"
fi



