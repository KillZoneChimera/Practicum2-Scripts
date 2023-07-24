#!/bin/bash
#path to file containing comma-seperated first and last names
input="./Practicum2-Scripts/names.txt"
#loop through each line in the input file and read first and last name.
while IFS=, read -r first last;      # notice the comma after the equal sign 
  do
#cocatenate first and last names to form the full name.
	name="$first $last"
#generate a username using the first letter of the first name.
	username="${first:0:1}$last"
#check if dthe username already exist in etc/passwd.
 	n=$(egrep –c "$username" /etc/passwd)
#if the username already exist, increment the number to creat a unique username. 
 	n=$((n+1))
 	username="$username$n"
#create new user account with the generated username
	useradd -m "$username" -s /bin/bash
done < "$input"
#display the last few lines of the /etc/passwd file
 tail /etc/passwd
