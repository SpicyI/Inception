FROM debian:bullseye

RUN apt update && apt install wget -y \
&& wget -O portainer.tar.gz https://github.com/portainer/portainer/releases/download/2.16.1/portainer-2.16.1-linux-amd64.tar.gz \
&& tar -xf portainer.tar.gz && rm -rf portainer.tar.gz 

WORKDIR /portainer

CMD ["./portainer"]