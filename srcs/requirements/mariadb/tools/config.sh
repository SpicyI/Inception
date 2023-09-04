#!/bin/bash

service mariadb start

echo  "=> Waiting for confirmation of MariaDB service startup"

sleep 1

echo "=> Creating MariaDB admin user with ${MYSQL_PASSWORD} password"


mysql -sfu root  <<EOS
ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD'; 
DELETE FROM mysql.user WHERE User='';
DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
DROP DATABASE IF EXISTS test;
DELETE FROM mysql.db WHERE Db='test' OR Db='test\\_%';
CREATE DATABASE $MYSQL_DATABASE;
CREATE USER '$MYSQL_USER'@'localhost' IDENTIFIED BY '$MYSQL_PASSWORD';
GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO 'root'@'localhost';
FLUSH PRIVILEGES;
EOS


echo "=> Done!"
mysqladmin -u root -p$MYSQL_ROOT_PASSWORD shutdown
echo "=> restarting MariaDB ..."
# echo "=> Stopping MariaDB ..."
mysqld  --bind_address 0.0.0.0

echo "=> fail!"
# echo "=> MariaDB is ready to use."
