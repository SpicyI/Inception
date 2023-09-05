#!/bin/bash

service mariadb start

echo  "=> Waiting for confirmation of MariaDB service startup"

sleep 1



mysql -sfu root <<EOS
ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD'; 
DELETE FROM mysql.user WHERE User='';
DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
DROP DATABASE IF EXISTS test;
DELETE FROM mysql.db WHERE Db='test' OR Db='test\\_%';
CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;
CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';
GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%';
FLUSH PRIVILEGES;
EOS


echo "=> Done!"
mysqladmin -u root -p$MYSQL_ROOT_PASSWORD shutdown
echo "=> restarting MariaDB ..."
# echo "=> Stopping MariaDB ..."
mysqld 

echo "=> fail!"
# echo "=> MariaDB is ready to use."
