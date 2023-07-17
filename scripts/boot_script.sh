#!/bin/bash
# switch user
su -

# Update Repository Index
apt-get update

# sudo install
apt-get install -y sudo

# Set the package manager to use https
sudo apt-get install -y apt-transport-https

# Obtain a certificate from CA (Certificate Authorities) to enable SSL communication
sudo apt-get install -y ca-certificates

# Data transmission and reception package supporting various communication protocols
sudo apt-get install -y curl

# A package that configures adding and deleting Repositories
sudo apt-get install -y software-properties-common

# git install
sudo apt-get install -y git

# install make
sudo apt-get install -y make

# install vim
sudo apt-get install -y vim

# install systemd
sudo apt-get install -y systemd