#!/bin/bash -x
/usr/bin/mysqld_safe &
sleep 5
/usr/bin/mysql -u root -pchangeme -e "CREATE DATABASE owncloud; GRANT ALL ON owncloud.* TO 'owncloud'@'localhost' IDENTIFIED BY 'owncloudsql';"
pkill -f mysqld
