#!/usr/bin/bash



$tybe="";
read -p "enter name u want to modify" name


if getent passwd $name > /dev/null 2>&1; then
    echo "yes the user exists"

			
				sudo	userdel $name 

##########
else
    echo "No, the user does not exist"
fi
