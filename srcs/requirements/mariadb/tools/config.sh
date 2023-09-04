#!/bin/bash

service mariadb start

sleep 1

mysql -sfu root  <<EOS
ALTER USER 'root'@'localhost' IDENTIFIED BY 'Elkhayyate@rootdb'; 
DELETE FROM mysql.user WHERE User='';
DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
DROP DATABASE IF EXISTS test;
DELETE FROM mysql.db WHERE Db='test' OR Db='test\\_%';
CREATE DATABASE wordpress;
CREATE USER 'GAME_MASTER'@'localhost' IDENTIFIED BY 'TETRIS@MDB';
GRANT ALL PRIVILEGES ON wordpress.* TO 'GAME_MASTER'@'localhost';
FLUSH PRIVILEGES;
EOS

mysqladmin -u root -p'Elkhayyate@rootdb' shutdown
mysqld --bind 0.0.0.0
