#!/bin/bash

service mariadb start

sleep 1

mysql -sfu root  <<EOS
ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD'; 
DELETE FROM mysql.user WHERE User='';
DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
DROP DATABASE IF EXISTS test;
DELETE FROM mysql.db WHERE Db='test' OR Db='test\\_%';
CREATE DATABASE $MYSQL_DATABASE;
CREATE USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';
GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO 'root'@'localhost';
FLUSH PRIVILEGES;
EOS

mysqladmin -u root -p'$MYSQL_ROOT_PASSWORD' shutdown
mysqld --bind 0.0.0.0
