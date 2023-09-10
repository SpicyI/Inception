# This Dockerfile sets up a Debian Bullseye image with Nginx installed and configured to use a custom default.conf file.
# It also sets up an entrypoint script to start Nginx and create a directory for WordPress.
# Port 443 is exposed for HTTPS traffic.

FROM debian:bullseye

WORKDIR /nginx_dir

COPY ./conf/default.conf /etc/nginx/conf.d/

RUN apt-get -y update && apt-get -y install nginx openssl 

COPY ./tools/nginx_entrypoint.sh .

RUN chmod +x nginx_entrypoint.sh

RUN mkdir -p /var/www/wordpress && \
    chown -R 755 /var/www/wordpress

EXPOSE 443

ENTRYPOINT [ "/nginx_dir/nginx_entrypoint.sh" ]

