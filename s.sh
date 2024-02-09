#!/bin/bash

# Define variables for the new values
new_port="Port 22"
new_root_login="PermitRootLogin yes"
new_password_auth="PasswordAuthentication yes"
new_root_password="new_root_password_here"

# Use sed to replace lines in the file
sed -i "s/^#Port 22/$new_port/" /etc/ssh/sshd_config
sed -i "s/^PermitRootLogin no/$new_root_login/" /etc/ssh/sshd_config
sed -i "s/^PasswordAuthentication no/$new_password_auth/" /etc/ssh/sshd_config

# Prompt the user to enter the password
echo "Enter the root password:"
read -s root_password

# Use the provided password to change the root password
echo -e "$root_password\n$root_password" | sudo passwd root


# Restart SSH service
systemctl restart sshd
