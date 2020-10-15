# Duplicati - Zabbix Sender

This script uses zabbix_sender to notify Zabbix when a Duplicati backup starts / finishes / fails. 

You will require a working Zabbix install, a working Duplicati backup, and zabbix_sender installed on the Duplicati machine. 
I recommend testing zabbix_sender from the command-line to ensure it works before attempting to get this script working. 

Alter the script as required with the IP address of Zabbix, the server name & the 'item' the data should be sent to. You may need to edit permissions to allow the file to execute: 
``` chmod +x Zabbix-Sender.sh ```

Don't forget to add the run-script-before and run-script-after to your Duplicati configuration! 

I recommend setting up 'problems' to alert you when the Duplicati backup fails...
Problem: 
```
{Template Name:item.key.last()}<>"Success" and {Template Name:item.key.last()}<>"Backup" 
```
Recovery:
```
{Template Name:item.key.last()}="Success"
```


