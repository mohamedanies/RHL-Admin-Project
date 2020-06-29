#!/bin/bash
#Displaying menu: for software managment steps.
#author:mohame anis salem
# iti open-source track intake 40
#-----------------------------------------------------------------------------------------------------
clear

echo "to perform some of the following tasks, you may need to be a root"
echo "you can just type (sudo -s) to switch to the root user"
echo "
------------------------------------------------------------------------------
"
PS3="Enter Your Choice : "

select choice in "List all installed packages." "Display information about specific package. " "List all available repositories." "Install a new package." "Update an existing package." "Remove a package." "Quit"
do
        case $choice in
	"List all installed packages.")
		echo "the installed packages are:"
		rpm -qa 
                echo "------------------------------------------------------------------------------"
		;;
        "Display information about specific package. " )
                echo -n "please enter a package name :"
                read pkg_name
                RESULT="package $pkg_name is not installed"
                #echo "$RESULT"
                #CHECK=$(rpm -q $pkg_name)
                #echo "$CHECK"
                if [[ $(rpm -q $pkg_name) == "$RESULT" ]]; then
                        echo "package '"$pkg_name"' is not found,sorry but can't find info about a not installed package, you can install packages using choice (4)."
                        echo "------------------------------------------------------------------------------"
                else
                        echo "here are some informations about that package:"
                        sudo yum info $pkg_name
                        echo "------------------------------------------------------------------------------"
                fi
                ;;
        "List all available repositories.")
                echo "list of all repos with status shown:" 
                sudo yum repolist all
                echo "------------------------------------------------------------------------------"  
                ;;               
        "Install a new package.")
                echo -n "please enter a package name to install:"
                read pkg_name
                RESULT="package $pkg_name is not installed"
                #echo "$RESULT"
                if [[ $(rpm -q $pkg_name) == "$RESULT" ]]; then
                        echo "just wait for package '"$pkg_name"' to be installed, please make sure that internet is connected "
                        sudo yum install $pkg_name
                        echo "------------------------------------------------------------------------------"
                    #if the pkg installed , system tells user by default.
                elif [[ $(rpm -q $pkg_name) != "$RESULT" ]]; then
                #pkg is already installed, so it may has an update.
                        sudo yum install $pkg_name     
                        echo "------------------------------------------------------------------------------" 
                else
                        echo "you may entered unvalid package name" 
                        echo "------------------------------------------------------------------------------"   
                fi 
                ;;
        "Update an existing package.")
                echo -n "please enter a package name to update:"
                read pkg_name
                RESULT="package $pkg_name is not installed"
                #echo "$RESULT"
                if [[ $(rpm -q $pkg_name) == "$RESULT" ]]; then
                        echo "package '"$pkg_name"' not installed,we will install the latest version available now"
                        sudo yum install $pkg_name
                        echo "------------------------------------------------------------------------------"
                        #if the pkg installed , system tells user by defult.   
                elif [[ $(rpm -q $pkg_name) != "$RESULT" ]]; then
                        sudo yum update $pkg_name
                        echo "------------------------------------------------------------------------------"
                else
                        echo "you may entered invalid package name"
                        echo "------------------------------------------------------------------------------" 
                fi
                ;;
        "Remove a package.")
                echo -n "please enter a package name to remove:"
                read pkg_name
                RESULT="package $pkg_name is not installed"
                if [[ $(rpm -q $pkg_name) == "$RESULT" ]]; then
                        echo "package '"$pkg_name"' already not installed"
                        echo "------------------------------------------------------------------------------"
                elif [[ $(rpm -q $pkg_name) != "$RESULT" ]]; then
                        sudo yum erase $pkg_name
                        echo "------------------------------------------------------------------------------"
                else
                        echo "you may entered unvalid package name"
                        echo "------------------------------------------------------------------------------"
                fi
                ;;
        "Quit")
                echo "program terminated, thank you :)"
                break
		;;
	*)
		echo "wrong choice, please choose a valid choice number from 1 to 7 "
                echo "------------------------------------------------------------------------------"
		;;
        esac
done


                                                                     
                                                                              
