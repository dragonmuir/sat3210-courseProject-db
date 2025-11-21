#!/bin/sh

sudo mkdir -p /var/opt/mssql/data/backups
sudo cp IMS.bak /var/opt/mssql/data/backups/

sqlcmd -S 127.0.0.1 -U sa  -P 'P_ssw0rd' -C -Q "CREATE DATABASE IMS"
sqlcmd -S 127.0.0.1 -U sa  -P 'P_ssw0rd' -C -Q "restore database IMS from disk ='/var/opt/mssql/data/backups/IMS.bak' with move 'IMS' to '/var/opt/mssql/data/IMS.mdf', move 'IMS_log' to '/var/opt/mssql/data/IMS_log.ldf', replace"
