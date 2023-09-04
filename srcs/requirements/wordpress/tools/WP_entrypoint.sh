#!/bin/bash

# copy the template config file
sleep 10

wp --allow-root core download --path=/var/www/wordpress

cd /var/www/wordpress
cp wp-config-sample.php wp-config.php

# manually replacing each field with the right credential

sed -i "s/username_here/$WORDPRESS_DB_USER/g" wp-config.php
sed -i "s/password_here/$WORDPRESS_DB_PASSWORD/g" wp-config.php
sed -i "s/localhost/$WORDPRESS_DB_HOST/g" wp-config.php
sed -i "s/database_name_here/$WORDPRESS_DB_NAME/g" wp-config.php

wp --allow-root core install --url="del-kahy.42.fr" --title="landing page" --admin_user=delkhayADM --admin_password="Ekhayyate@wp" --admin_email="del-khay@student.1337.ma"


# ! add user (default)
sed -i 's#listen = /run/php/php7.4-fpm.sock#listen = 0.0.0.0:9000#g' /etc/php/7.4/fpm/pool.d/www.conf
sed -i 's#chdir = /var/www#chdir = /var/www/wordpress#g' /etc/php/7.4/fpm/pool.d/www.conf
echo "starting fpm ... "
php-fpm7.4 -F
echo "fpm  failed ! ... "
