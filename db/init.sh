#!/usr/bin/env bash
# create random password
PASSWDDB=$MYSQL_PASSWORD
#PASSWDDB="$(openssl rand -base64 12)"

# replace "-" with "_" for database username
# MAINDB=${USER_NAME//[^a-zA-Z0-9]/_}
MAINDB=$MYSQL_DB_NAME
USERDB=$MYSQL_USER

# If /root/.my.cnf exists then it won't ask for root password
if [ -f /etc/mysql/conf.d/.my.cnf ]; then

    mysql -e "CREATE DATABASE ${MAINDB} /*\!40100 DEFAULT CHARACTER SET utf8 */;"
    mysql -e "CREATE USER ${MAINDB}@localhost IDENTIFIED BY '${PASSWDDB}';"
    mysql -e "GRANT ALL PRIVILEGES ON ${MAINDB}.* TO '${MAINDB}'@'localhost';"
    mysql -e "FLUSH PRIVILEGES;"
    mysql -u ${USERDB} -p ${PASSWDB} ${MAINDB} < bd_fotrris_0718v1.0.1.sql

# If /root/.my.cnf doesn't exist then it'll ask for root password   
else
    echo "Please enter root user MySQL password!"
    read rootpasswd
    mysql -uroot -p${rootpasswd} -e "CREATE DATABASE ${MAINDB} /*\!40100 DEFAULT CHARACTER SET utf8 */;"
    mysql -uroot -p${rootpasswd} -e "CREATE USER ${MAINDB}@localhost IDENTIFIED BY '${PASSWDDB}';"
    mysql -uroot -p${rootpasswd} -e "GRANT ALL PRIVILEGES ON ${MAINDB}.* TO '${MAINDB}'@'localhost';"
    mysql -uroot -p${rootpasswd} -e "FLUSH PRIVILEGES;"
fi