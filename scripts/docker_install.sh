#!/bin/bash

#install docker script

# add gpg key
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -

# add repository to apt
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"

# update repository index
sudo apt-get update
sudo apt-get update --allow-insecure-repositories

# install docker
sudo apt install docker-ce

# check docker status
sudo systemctl status docker

# use docker without sudo
sudo usermod -aG docker ${USER}
su - ${USER}
id -nG

#install docker-compose
sudo curl -L https://github.com/docker/compose/releases/download/1.29.2/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose


# Do not terminate containers when restarting docker service
sudo su -c 'printf "{\n\t\"live-restore\": true\n}" > /etc/docker/docker.json'

# restart docker
sudo systemctl restart docker



