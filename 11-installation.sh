#!/bin/bash
#Author - Jakeer
#Team - Devops
USERID=$(id -u)
if [ $USERID -ne 0 ];then
echo " you don't have root previlages to run this command please run with root privilages or add sudo before the command "
exit 1
else 
echo " you have root previlages to run this command "
fi
dnf list installed git
if [ $? -ne 0 ];then
echo " git is not installed "
dnf install git -y
if [ $? -ne 0 ];then
echo " git installation fialed "
else 
echo " git installation success "
fi
else 
echo " git installed nothing to do "
fi

dnf list installed mysql
if [ $? -ne 0 ];then
echo " mysql is not installed "
dnf install mysql -y
if [ $? -ne 0 ];then
echo " mysql not installed installation failed "
else 
echo " mysql installed successfully "
fi
else
echo " alredy installed mysql nothing to do "
fi

