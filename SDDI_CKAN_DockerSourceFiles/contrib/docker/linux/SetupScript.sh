#!/bin/sh

CKAN_URL="http://localhost:5000"

echo "Provide the URL for your catalog instance: (default is set to http://localhost:5000)"
read answer

ANS_URL=${answer:-$CKAN_URL}
export ANS_URL

while true; do
    read -p "is your URL correct: "$ANS_URL" ? (Yes or No)" yn
    case $yn in
        [Yy]* ) 
            if wget -q --method=HEAD --tries=3 --retry-connrefused $ANS_URL;
             then
              echo "This page exists."; break;
            else
              echo "Either this page does not exist or it fails to connect." ; exit;
            fi;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done

user="admin"
while true; do
    read -p "Do you wish to create an admin user? (Yes or No)" yn
    case $yn in
        [Yy]* )
            read -p "Please provide a user name: (default: admin)" usr
            admin=${usr:-$user};
            docker exec -it ckan /usr/local/bin/ckan-paster --plugin=ckan sysadmin -c /etc/ckan/production.ini add "$admin"; break;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;
    esac
done

# Here we create groups
while true; do
    read -p "In order to create SDDI main groups write 1 and if you want to create your own groups write 2 (for option 2 you should first fill in the script groups.sh with your values). (1 or 2 or any number to skip)" gr;
    if [ "$gr" = 1 ]; then
     if [ -f SetupGruppenSDDIThemenplattform.sh ];
       then ./SetupGruppenSDDIThemenplattform.sh
       echo "SDDI groups are created;"; break;
     else
       echo "SDDIgroups.sh file does not exist, aborting"; break;
     fi
    elif [ "$gr" = 2 ]; then
     if [ -f SetupGruppenTemplate.sh ] ;
       then ./SetupGruppenTemplate.sh
       echo "Your groups are created;"; break;
     else
       echo "group.sh file does not exist, aborting"; break;
     fi
    else
     echo "No group is created. You decided to skip this step."; break;
    fi
done

# Here we create groups
while true; do
    read -p "In order to create SDDI organizations write 1 and if you want to create your own prganizations write 2 (for option 2 you should first fill in the script orgs.sh with your values). (1 or 2 or any number to skip)" org;
    if [ "$org" = 1 ]; then
     if [ -f SetupOrganisationenSDDIThemenplattform.sh ];
       then ./SetupOrganisationenSDDIThemenplattform.sh
       echo "SDDI organizations are created;"; break;
     else
       echo "SDDIorg.sh file does not exist, aborting"; break;
     fi
    elif [ "$org" = 2 ]; then
     if [ -f SetupOrganisationenTemplate.sh ] ;
       then ./SetupOrganisationenTemplate.sh
       echo "Your oraganizations are created;"; break;
     else
       echo "orgs.sh file does not exist, aborting"; break;
     fi
    else
     echo "No organization is created. You decided to skip this step."; break;
    fi
done


echo "Exiting Program"
exit 0