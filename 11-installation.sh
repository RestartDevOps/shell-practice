#!/bin/bash
#Author - Jakeer
#Team - Devops
USERID=$(id -u)
if [ $USERID -ne 0 ];then
echo " you don't have root previlages to run this command please run with root privilages or add sudo before the command "
else 
echo " you have root previlages to run this command "
fi
dnf install git -y