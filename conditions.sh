#!/bin/bash

NUMBER=$1
if [ $NUMBER -gt 10 ];
then 
echo "print grater number $NUMBER "
else 
echo "print lesser number $NUMBER"

fi

#an other example 
FRUIT="Apple"

if [ "$FRUIT" = "Apple" ];
then 
echo "Fruit is apple"
else 
echo "Fruit is not a apple $FRUIT "
fi