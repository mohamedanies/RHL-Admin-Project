#!/usr/bin/bash

echo am in c1sh c1sh11111

            ps2='please enter your choice: '
        options2=("display all process for specific user" "display specific process details by its name" "kill specific process" "change priority for specific process" "back")
        select opt in "${options2[@]}"
        do
        case $opt in
                "display all process for specific user")
                        ps
                        ;;
                "display specific process details by its name")
                        read -p "Enter Name Of Process: " name

                        top -bc |grep $name
                        ;;
                "kill specific process")
                        ps4='please enter your choice: '
                        options3=("kill by pid" "kill by processName" "back")
                        select opt in "${options3[@]}"
                        do
                        case $opt in
                                "kill by pid")
                                        read -p "Enter pid to kill: " pid

                                        kill $pid
                                        ;;
                                "kill by processName")
                                        read -p "Enter ProcessName to Kill: " processName
                                        pkill -9 $processName
                                        ;;
                                "back")
                                        break
                                        ;;
                        esac
                        done
                        ;;
                "change priority for specific process")

                        ps5='please enter yoy=ur choice: '
                        options4=("change priority by pid" "required nice value" "back")
                        select opt in "${options4[@]}"
                        do
                        case $opt in
                                "change priority by pid")
                                        
                                        read -p "Enter Your PID To Change Priority: " pid
					renice -n 10 -p $pid
					;;
                                "required nice value")
					read -p "Enter Your CommandNameTo Change Priority: " commandName
                                        nice -10 $commandName
                                        ;;
                                "back")
                                        break
                                        ;;
                        esac
                        done
                        ;;
                "back")
                        break
                        ;;
        esac
        done
            
