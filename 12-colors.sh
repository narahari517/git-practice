#!/bin/bash

USERID=$(id -u)
#echo "User ID is: $USERID"
R="\e[31m"
G="\e[32m"
N="\e[0m"

CHECK_ROOT(){
    if [ $USERID -ne 0 ]
    then
        echo "Please run this script with root previliges"
        exit 1
fi
}

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "$2 is $R FAILED $N"
        exit 1
    else
        echo -e "$2 is $G SUCCESS $N"
    fi
}

CHECK_ROOT

dnf list installed git


if [ $? -ne 0 ]
then
    echo "git is not installed yet, installing now.."
    dnf install git -y
    VALIDATE $? "Installing Git"
else
    echo "git is already installed."
fi

dnf list installed mysql

if [ $? -ne 0 ]
then
    echo "mysql is not installed yet, installing now"
    dnf install mysql -y
    VALIDATE $? "Installing MySQL"
else
    echo "mysql is already installed."
fi