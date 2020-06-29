select choice in "list all user" "add new user" "modify user"  "delet user" "exite"
do
 case $choice in
 "list all user")
clear;
  awk -F : 'BEGIN{i=0 }{if(NR > 42){ print  ++i "  " $0}}' /etc/passwd

;;
 "add new user")
clear; 
. ./useroption/c2.sh 
;; 
"modify user")
clear;
 . ./useroption/c3.sh

;;
"delet user")
clear;
 . ./useroption/c4.sh
;;
 "exite")
break; 
;;
 *) echo $REPLY is not one of the choices. 
;;

 esac 
done 
 
