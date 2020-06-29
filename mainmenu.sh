#!/usr/bin/bash



select choice1 in  "process management" "service management" "user management" "software management" "networkiing management" "SE linux" "exite now"


do
 case $choice1 in
 "process management")
clear;
. ./processmanagement/no1.sh
;;

"service management")
clear;
. ./ServiceManagement/running.sh;

;;
"user management")
clear;

. ./useroption/project.sh;

;;
"software management")
clear;
. ./softwaremanagment/softmanage.sh

;;
"networkiing management")
clear;
. ./networkmanagement/no5.sh

;;
"SE linux" )
. ./SElinux/SElinux.sh

;;
"exite now")
clear;
exit;
;;
 *) echo $REPLY is not one of the choices. 
;;
 esac
done

