#!/bin/bash

echo "Calculator Script"
echo
echo "Enter first number : "
read n1
echo
echo "Enter second number : "
read n2

echo
echo "Enter 1 for Addition."
echo "Enter 2 for Substration."
echo "Enter 3 for Multiplication."
echo "Enter 4 for Division."
read choice

case $choice in
        1) let result=$n1+$n2
                echo "Addition of two numbers is : $result";;
        2) let result=$n1-$n2
                echo "Substraction of two numbers is : $result";;
        3) let result=$n1*$n2
                echo "Multiplication of two numbers is : $result";;
        4) let result=$n1/$n2
                echo "Division of two numbers is : $result";;
        *) echo "Wrong Input"
esac
