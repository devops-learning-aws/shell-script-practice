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


if [ $USERI -ne 0 ]
then 
echo "please run with super user access "

else 
echo "you are a super user "

fi
 dnf install mysql -y
 VALIDATE $? "Installing"