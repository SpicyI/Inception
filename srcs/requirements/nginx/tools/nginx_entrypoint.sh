#!/bin/sh

# This script installs SSL certificates for Nginx server and starts the server.
# It generates a self-signed SSL certificate with the specified subject and gives access to it.
# Then it starts the Nginx server in the foreground.

openssl req -x509 -nodes -days 365 \
    -newkey rsa:2048 \
    -keyout /etc/ssl/private/nginx-selfsigned.key \
    -out /etc/ssl/certs/nginx-selfsigned.crt \
    -subj "/C=US/ST=CA/L=San Francisco/O=My Company/CN=del-khay.42.fr"

# give access to the certificate

chmod 644 /etc/ssl/certs/nginx-selfsigned.crt
chmod 600 /etc/ssl/private/nginx-selfsigned.key
chown root:root \
    /etc/ssl/certs/nginx-selfsigned.crt \
    /etc/ssl/private/nginx-selfsigned.key

# start nginx

nginx -g "daemon off;"