#!/bin/bash
PS3="Choose your option : "
select choice in "List all running services" "List all stopped services" "List all failed services" "Display info about specific service" "Manage specific service" "Exit"
do
	case $choice in
	"List all running services")
		echo "All running services : "
		systemctl list-units --state=running
		;;
	"List all stopped services")
		echo "All stopped services : "
       		systemctl list-units --state=failed
      		;;
	"List all failed services")
		echo "All failed services : "
       		systemctl list-units --state=exited
      		;;
	"Display info about specific service")
		echo -n "Enter required service : "
		read service
                systemctl status $service
              	;;
	"Manage specific service")
                echo -n "Enter required service : "
                read service
                select action in "status" "start" "stop" "restart" "enable" "disable" "Exit"
		do
			case $action in
			"status")
				echo "The Service Status : "
				systemctl $action $service
				;;
			"start")
				sudo systemctl $action $service
				echo "The Service is started..."
				;;
			"stop")
				sudo systemctl $action $service
				echo "The Service is stopped... "
				;;
			"restart")    
  				sudo systemctl $action $service    
				echo "The Service is restarted... "
				;;
			"enable")
				sudo systemctl $action $service    
				echo "The Service is enabled... "
				;;
			"disable")
				sudo systemctl $action $service    
				echo "The Service is disabled... "
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
	"Exit")
		break
		;;
	*)
		echo"Invalid choice"
		;;
	esac
done
