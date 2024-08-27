#!/bin/bash

USERID=$(id -u)
#echo "User ID is: $USERID"

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo "$2 is FAILED"
        exit 1
    else
        echo "$2 is SUCCESS"
    fi
}

if [ $USERID -ne 0 ]
then
    echo "Please run this script with root previliges"
    exit 1
fi

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