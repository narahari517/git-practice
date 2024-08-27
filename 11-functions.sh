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

VALIDATE $? "Listing Git"

# if [ $? -ne 0 ]
# then
#     echo "git is not installed yet, installing now.."
#     dnf install git -y
#     if [ $? -ne 0 ]
#     then
#         echo "git installation is not success, check it."
#         exit 1
#     else
#         echo "git installation is success"
#     fi
# else
#     echo "git is already installed."
# fi

# dnf list installed mysql

# if [ $? -ne 0 ]
# then
#     echo "mysql is not installed yet, installing now"
#     dnf install mysql -y
#     if [ $? -ne 0 ]
#     then
#         echo "mysql installation is not success, check it."
#         exit 1
#     else
#         echo "mysql installation is success."
#     fi
# else
#     echo "mysql is already installed."
# fi    