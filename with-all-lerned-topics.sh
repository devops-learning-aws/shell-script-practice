#!/bin/bash 

USERID=$(id -u)

VALIDATE(){
  if [$1 -ne 0]
  then 
  echo "$2 Intallation failed"
  else 
  echo "$2 installation success"
  fi
}
if [$USERID -ne 0]
then
echo "please run with superuser access"
else
echo "you have super user access"
 fi 
 dnf install mysql -y
 VALIDATE $? "Installing"