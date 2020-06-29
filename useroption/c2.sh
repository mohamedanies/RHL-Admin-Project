$tybe="";
read -p "enter name u want to add" name

##


if getent passwd $name > /dev/null 2>&1; then
    

			
				echo "No, the user exist"

##########
else
    
echo $name

echo "\n choose your shell"

select choice1 in  "Bourne shell (sh)" "Korn shell (ksh)" "Bourne Again shell (bash)"


do
 case $choice1 in
 "Bourne shell (sh)")
 tybe="/bin/sh"; 
break;
;;
"Korn shell (ksh)")
 tybe="/bin/ksh"; 
break;
;;
"Bourne Again shell (bash)")
 tybe="/bin/bash";
break;
;;
 *) echo $REPLY is not one of the choices. 
;;
 esac
done

echo ${name} ${tybe}
read -p "enter password" passwd                

sudo useradd ${name} -s ${tybe} -p $passwd 

fi
##

