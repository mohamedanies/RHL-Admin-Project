#!/usr/bin/bash



$tybe="";
read -p "enter name u want to modify" name


if getent passwd $name > /dev/null 2>&1; then
    echo "yes the user exists"


echo $name
##########

select choice1 in  "change shell" "change user id" "change passwored" "change comment of user" "move files of user to directory"
do
 case $choice1 in
 "change shell" )
 
#
select choice1 in  "Bourne shell (sh)" "Korn shell (ksh)" "Bourne Again shell (bash)"


do
 case $choice1 in
 "Bourne shell (sh)")
 tybe="/bin/sh"; 
		sudo userrmod $name -s $tybe
break;
;;
"Korn shell (ksh)")
 tybe="/bin/ksh"; 
		sudo usermod $name -s $tybe
break;
;;
"Bourne Again shell (bash)")
 tybe="/bin/bash";
	sudo usermod $name -s $tybe
break;
;;
 *) echo $REPLY is not one of the choices. 
;;
 esac
done
#
break;
;;
"change user id")
read -p "enter id u want to modify" id
sudo usermod $name -u $id
 
break;
;;
"change passwored")
 read -p "enter password u want to modify" pass
sudo usermod $name -p $pass
break;
;;
"change comment of user")
 read -p "enter comment u want to modify" coment
sudo usermod $name -c $coment
break;
;;
"move files of user to directory")
 read -p "enter path u want to modify" path
sudo usermod $name -m $path
break;
;;


 *) echo $REPLY is not one of the choices. 
;;
 esac
done




##########
else
    echo "No, the user does not exist"
fi
