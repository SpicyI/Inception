#!/bin/bash


# sleep until mysql is ready
# sleep 5

# loop until mysql is ready
until mysqladmin ping -h $WORDPRESS_DB_HOST --silent; do
    echo 'waiting for mysqld to be connectable...'
    sleep 1
done

# copy the template config file
wp --allow-root core download --path=/var/www/wordpress

cd /var/www/wordpress

# manually replacing each field with the right credential

cp wp-config-sample.php wp-config.php

sed -i "s/username_here/$WORDPRESS_DB_USER/g" wp-config.php
sed -i "s/password_here/$WORDPRESS_DB_PASSWORD/g" wp-config.php
sed -i "s/localhost/$WORDPRESS_DB_HOST/g" wp-config.php
sed -i "s/database_name_here/$WORDPRESS_DB_NAME/g" wp-config.php
sed -i "s/WP_CACHE_KEY_SALT/$WORDPRESS_CASHE_SALT/g" wp-config.php
sed -i "s/WP_REDIS_HOST/redis/g" wp-config.php
sed -i "s/WP_CACHE/true/g" wp-config.php

# wp --allow-root config create --dbname=$WORDPRESS_DB_NAME --dbuser=$WORDPRESS_DB_USER --dbpass=$WORDPRESS_DB_PASSWORD --dbhost=$WORDPRESS_DB_HOST --dbprefix=wp_

wp  --allow-root core install \
    --url="del-khay.42.fr"  \
    --title="landing page" \
    --admin_user=$WORDPRESS_ADMIN_USER \
    --admin_password=$WORDPRESS_ADMIN_PASSWORD \
    --admin_email=$WORDPRESS_ADMIN_EMAIL

wp  --allow-root user create $WORDPRESS_USER  $WORDPRESS_EMAIL  \
    --role=author \
    --user_pass=$WORDPRESS_PASSWORD

# ! add user (default)
sed -i 's#listen = /run/php/php7.4-fpm.sock#listen = 0.0.0.0:9000#g' /etc/php/7.4/fpm/pool.d/www.conf
sed -i 's#chdir = /var/www#chdir = /var/www/wordpress#g' /etc/php/7.4/fpm/pool.d/www.conf
echo "starting fpm ... "
php-fpm7.4 -F
echo "fpm  failed ! ... "
