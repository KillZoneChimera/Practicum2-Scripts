#!/bin/bash
#script to creat user accounts based on data in names.txt.
input="./Practicum2-Scripts/names.txt"
#path to file containing comma-seperated first and last names.
while IFS=, read -r first last; # notice the comma after the equal sign.
#loop through each line in the input file and read first and last names.
 do
	name="$first $last"
#concatenate first and last to form the full  name
	username="${first:0:1}$last"
#generate a username using the first letter of the first name and the full last name.
	useradd -m $username -s /bin/bash
#create a new user account with the generated username and set defualt shell to bash.
 done < "$input"
#ends the loop "while"
tail -8 /etc/passwd
#displays the last 8 lines pf /etc/passwd file
