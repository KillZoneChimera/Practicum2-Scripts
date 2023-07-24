#!/bin/bash
# example of using arguments to a script. for this script to work excute ./script2.sh <first> <last>
echo "My first name is $1"              #prints the first name provided as the first argument.
echo "My surname is $2"                 #prints the surname provided as the second argument.
echo "Total number of arguments is $#"  #prints the total number of arguemnets.
