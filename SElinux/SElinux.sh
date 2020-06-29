#!/bin/bash
PS3="Choose your option : "
select choice in "SElinux settings." "Firewall Configeration." "Quit" 
do
	case $choice in
	 "SElinux settings.")
                echo  "select mod to edit: "
                select action in "SElinux mod" "change mod  temporary" "change mod permenat"  "Exit"
		do
			case $action in
			"SElinux mod" )
				#command here
				;;
			 "change mod  temporary")
				#command here
				;;
			"change mod permenat")
				#command here
				;;
			"Exit")
				break
				;;
			*)
				echo "Invalid Choice..."
				;;
			esac
		done
                ;;
	 "Firewall Configeration.")
	 echo  "select  fire wall job: "
                select action in "firewall status(on/off)." "enable firewall." "disable firewall." "add service into firewall" "remove service from firewall" "add port into firewall" "Exit"
		do
			case $action in
			"firewall status(on/off)." )
				#command here
				;;
			 "enable firewall.")
				#command here
				;;
			"disable firewall.")
				#command here
				;;
			"add service into firewall")
			        echo -n "enter service name to open in firewall:"
			        read service_name
				sudo firewall-cmd --add-service=$service_name
				;;
                        "remove service from firewall")
			        echo -n "enter service name to close in firewall:"
			        read service_name
				sudo firewall-cmd --remove-service=$service_name
				;;
			"add port into firewall")
				#command here
				;;
			"Exit")
				break
				;;
			*)
				echo "Invalid Choice..."
				;;
			esac
		done
                ;;
	 
	"Quit" )
		break
		;;
	*)
		echo"wrong selection , please choose a valid selection"
		;;
	esac
done
