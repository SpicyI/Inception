#!/bin/bash


mv adminer.php /var/www/wordpress

sed -i 's#listen = /run/php/php7.4-fpm.sock#listen = 0.0.0.0:9000#g' /etc/php/7.4/fpm/pool.d/www.conf
sed -i 's#chdir = /var/www#chdir = /var/www/wordpress#g' /etc/php/7.4/fpm/pool.d/www.conf
echo "starting fpm ... "
php-fpm7.4 -F
echo "fpm  failed ! ... "