FROM debian:12

RUN apt-get -y update && apt-get -y install nginx openssl

EXPOSE 80/tcp

CMD ["/usr/sbin/nginx", "-g", "daemon off;"];

