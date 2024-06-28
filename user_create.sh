#!/bin/bash

#to debug the code
#set -x

#to check if the root user is running the script
if [[ "${UID}" -ne 0 ]]
then
        echo "Please run with sudo or root."
        exit 1
fi

#User should provide the desired username & some details about the user while running the script
if [[ "${#}" -lt 1 ]]
then
        echo "Usage: ${0} User_name [COMMENT]..."
        echo " Create a user with name User_name and comment field of COMMENT"
        exit 1
fi

#Save the user name provided into USER_NAME variable
USER_NAME="${1}"

#Save the remaining input into COMMENT variable
shift
COMMENT="${@}"

#Generate a password
PASSWORD=$(date +%s%N)

#Create User
useradd -c "${COMMENT}" -m $USER_NAME

#Check if user is created
if [[ $? -ne 0 ]]
then
        echo "User account is not created"
        exit 1
fi

#Set password for the user
echo chpasswd $USER_NAME:$PASSWORD

#Check if password is set
if [[ $? -ne 0 ]]
then
        echo "User password is not created"
        exit 1
fi

#Set password is expired, so user needs to set new password
passwd -e $USER_NAME

#Display the username and password
echo "Username: User Name : $USER_NAME"
echo "Password is : $PASSWORD"
