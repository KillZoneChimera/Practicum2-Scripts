#!/bin/bash
while read first last;
do
    # Concatenate first and last names to form the full name
    name="$first $last"

    # Generate a username using the last name followed by the first letter of the first name
    username="$last${first:0:1}"

    # Check if the username already exists in /etc/passwd
    n=$(egrep -c "$username" /etc/passwd)

    # If the username already exists, increment the number to create a unique username
    n=$((n+1))
    username="$username$n"

    # Create a new user account with the generated username and set the default shell to Bash
    useradd -m "$username"

    # Generate a random password of 8 characters with only alphabetic characters
    password=`tr -cd '[:alpha:]' < /dev/random | head -c8`

    # Set the generated password for the new user account using the 'passwd' command
    echo $password | passwd --stdin $username 

    # Store the username-password pair in the 'tempPasswords' file in the /root directory
    echo "$username $password" >> /root/tempPasswords
done

