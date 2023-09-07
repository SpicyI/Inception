#!/bin/bash


REDIS_CONF="/etc/redis/redis.conf"
BIND_ADDRESS="0.0.0.0"
MAXMEMORY="256mb"
MAXMEMORY_POLICY="allkeys-lru"


update_config() {

    if grep -q "^$1" "$REDIS_CONF"; then
        sed -i "s/^$1 .*/$1 $2/" "$REDIS_CONF"
    else
        echo "$1 $2" >> "$REDIS_CONF"
    fi
}

update_config "bind" "$BIND_ADDRESS"
update_config "maxmemory" "$MAXMEMORY"
update_config "maxmemory-policy" "$MAXMEMORY_POLICY"

# echo madvise > /sys/kernel/mm/transparent_hugepage/enabled
# echo "vm.overcommit_memory = 1" >> /etc/sysctl.conf

# wget https://assets.digitalocean.com/articles/wordpress_redis/object-cache.php


# mv object-cache.php /var/www/wordpress/wp-content/

redis-server --daemonize no --protected-mode no