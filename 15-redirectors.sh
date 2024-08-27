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
Y="\e[33m"

root_check(){
    if [ $userid -ne 0 ]
    then
        echo -e "$R Please run the script with root privileges $N" | tee -a $Logfile
        exit 1
    fi
}

validate(){
    if [ $1 -ne 0 ]
    then
        echo -e "$2 is $R FAILED $N" | tee -a $Logfile
        exit 1
    else
        echo -e "$2 is $G SUCCESS $N" | tee -a $Logfile
    fi
}

usage(){
    echo -e "$R USAGE:: $N sudo sh 15-redirectors.sh package1 package2 ..." | tee -a $Logfile
    exit 1
}

echo "Script started executing at: $(date)" | tee -a $Logfile
root_check

if [ $# -eq 0 ]
then
    usage
fi

for package in $@ #$@ refers to all arguments passed to it
do
    dnf list installed $package &>>$Logfile
    if [ $? -ne 0 ]
    then
        echo "$package is not installed, going to install it.." | tee -a $Logfile
        dnf install $package -y &>>$Logfile
        validate $? "Installing $package" | tee -a $Logfile
    else
        echo -e "$package is already $Y installed...nothing to do $N" | tee -a $Logfile
    fi
done