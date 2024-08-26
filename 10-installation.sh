#!/bin/bash

USERID=$(id -u)
#echo "User ID is: $USERID"

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
else
    echo "git is already installed."
fi
