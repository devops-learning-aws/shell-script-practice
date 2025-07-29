#!/bin/bash

USERID=$(id -u)
TIMESTAMP=$(date +%H-%M-%S)
SCRIIPTNAME=$(echo $0 | cut -d "." -f1)
LOGFILE=/tmp/$SCRIPTNAME-$TIMESTAMP.log
R="\e[31m"
G="\e[32m"
N="\e[0m"

VALIDATE(){
    if [ $1 -ne 0 ]
    then 
    echo "$2 installation falied"
    exit 1
    else
    echo "$2 installation success"
    fi
}
if [ $USERID -ne 0]
then 
echo "please run with super user access"
esle 
echo "you are super user"
fi

for i in $@
do 
echo "install $i"
dnf list installed $i &>>$LOGFILE
if[ $? -eq 0]
then 
echo "$i already $G installed $N"
else
echo "$i need to install"
dnf install $i -y &>>$LOGFILE
VALIDATE $? "Installation of $i"
fi
done