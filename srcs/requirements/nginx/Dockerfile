# This Dockerfile builds an image for an Nginx server with SSL support.
# It starts with a Debian Bullseye base image, installs Nginx and OpenSSL, 
# generates a self-signed SSL certificate, and exposes port 443.
# The default Nginx configuration file is replaced with a custom one located at /etc/nginx/conf.d/default.conf.
# The CMD instruction starts the Nginx server in the foreground.


FROM debian:bullseye

WORKDIR /nginx_dir

COPY ./conf/default.conf /etc/nginx/conf.d/

RUN apt-get -y update && apt-get -y install nginx openssl 

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt \
    -subj "/C=US/ST=CA/L=San Francisco/O=My Company/CN=del-khay.42.fr"

RUN chmod 644 /etc/ssl/certs/nginx-selfsigned.crt  && \
    chmod 600 /etc/ssl/private/nginx-selfsigned.key && \
    chown root:root \
        /etc/ssl/certs/nginx-selfsigned.crt \
        /etc/ssl/private/nginx-selfsigned.key

EXPOSE 443

CMD ["/usr/sbin/nginx", "-g", "daemon off;"]

