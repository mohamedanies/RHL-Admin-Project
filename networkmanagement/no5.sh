#!/usr/bin/bash

echo am in c1sh c5sh5

                PS5='Please enter your choice: '
                options5=("list all networks interface name" "display more info for specific interfaces" "Modify Network Settings" "back")
                select opt in "${options5[@]}"
                do
                case $opt in
                      "list all networks interface name")

                            ip -o link show | awk -F': ' '{print $2}'
                             ;;
                       "display more info for specific interfaces")
                                read interface
               ifconfig $interface
                                ;;
                        "Modify Network Settings")
                        ;;
                       "back")
                            break
                            ;;
                 esac
                 done

                
