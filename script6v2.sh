#!/bin/bash
#################### Caution this command uses sudo ###############
############## use only if aware of security implications ##############
######################### on a trusted system #################
input="./Practicum2-Scripts/names.txt"
while IFS=, read -r first last;
do
    name="$first $last"
    username="${first:0:1}$last"
    n=$(egrep -c "$username" /etc/passwd)
    n=$((n+1))
    username="$username$n"

    # Create a new user account with the generated username and set the default shell to Bash
    sudo useradd -m -s /bin/bash "$username"

    # Generate a random password of 8 characters
    password=$(tr -cd '[:alnum:]' < /dev/urandom | fold -w8 | head -n1)

    # Set the generated password for the new user account using chpasswd
    echo "$username:$password" | sudo chpasswd

    # Store the username-password pair in the tempPasswords file in the user's home directory
    echo "$username $password" >> ~/tempPasswords
done < "$input"
tail /etc/passwd
