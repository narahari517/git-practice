#!/bin/bash

Logs_folder="/var/log/shell-script"
Script_name=$(echo $0 | cut -d "." -f1)
Timestamp=$(date +%Y-%m-%d-%H-%M-%S)
Logfile="$Logs_folder/$Script_name-$Timestamp.log"
mkdir -p $Logs_folder

userid=$(id -u)
R="\e[31m"
G="\e[32m"
N="\e[0m"


root_check(){
    if [ $userid -ne 0 ]
    then
        echo -e "$R Please run the script with root privileges $N" &>>$Logfile
        exit 1
    fi
}

validate(){
    if [ $1 -ne 0 ]
    then
        echo -e "$2 is $R FAILED $N" &>>$Logfile
        exit 1
    else
        echo -e "$2 is $G SUCCESS $N" &>>$Logfile
    fi
}

root_check