#!/bin/bash

# JM - https://github.com/JXGA/Duplicati-ZabbixSender
# This can be used to push a notification to Zabbix when a Duplicati state changes. 
# Refer to Duplicati docs. This is based upon their run-script-example.sh
# You'll need to change the IP, Server ID & Duplicati field from the zabbix-sender script. 

#Defines EVENTNAME and OPERATIONNAME from Duplicati variables.
EVENTNAME=$DUPLICATI__EVENTNAME
OPERATIONNAME=$DUPLICATI__OPERATIONNAME
OPERATIONRESULT=$DUPLICATI__PARSED_RESULT

# If this script runs BEFORE the backup begins:
if [ "$EVENTNAME" == "BEFORE" ]
then
        /usr/bin/zabbix_sender -z 192.168.1.60 -s "SRV - ML110" -k duplicati.check -o "$OPERATIONNAME"

elif [ "$EVENTNAME" == "AFTER" ]
then

        if [ "$OPERATIONNAME" == "Backup" ]
        then
                /usr/bin/zabbix_sender -z 192.168.1.60 -s "SRV - ML110" -k duplicati.check -o "$OPERATIONRESULT"
        else
	        /usr/bin/zabbix_sender -z 192.168.1.60 -s "SRV - ML110" -k duplicati.check -o "Problem! Unexpected event completed."
        fi
fi

exit 0
