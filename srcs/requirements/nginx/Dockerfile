FROM debian:bullseye

WORKDIR /nginx_test


COPY ./conf/default.conf /etc/nginx/conf.d/

COPY ./tools/index.html .

RUN apt-get -y update && apt-get -y install nginx openssl 

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt \
    -subj "/C=US/ST=CA/L=San Francisco/O=My Company/CN=3alam.com"

RUN chmod 644 /etc/ssl/certs/nginx-selfsigned.crt  && \
    chmod 600 /etc/ssl/private/nginx-selfsigned.key && \
    chown root:root /etc/ssl/certs/nginx-selfsigned.crt /etc/ssl/private/nginx-selfsigned.key


EXPOSE 443

CMD ["/usr/sbin/nginx", "-g", "daemon off;"];

