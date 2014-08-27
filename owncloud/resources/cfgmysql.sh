#!/bin/bash -x
/usr/bin/mysqld_safe &
sleep 5
/usr/bin/mysql -u root -pdatactil -e "CREATE DATABASE owncloud; GRANT ALL ON owncloud.* TO 'owncloud'@'localhost' IDENTIFIED BY 'datactil';"
pkill -f mysqld
