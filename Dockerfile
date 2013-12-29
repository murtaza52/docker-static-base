# Base Dockerfile for ubuntu 13.10, git and nginx

FROM stackbrew/ubuntu:13.10

MAINTAINER Murtaza Husain murtaza52@gmail.com

RUN (apt-get update && apt-get upgrade -y -q && apt-get dist-upgrade -y -q && apt-get -y -q autoclean && apt-get -y -q autoremove)

# Install prereq packages
RUN apt-get -y install git-core wget

# Install nginx
RUN apt-get -y install libpcre3-dev nginx
RUN echo "daemon off;" >> /etc/nginx/nginx.conf
RUN update-rc.d nginx defaults

RUN mkdir /var/www

# start nginx for the first time
RUN service nginx start

# Expose ports
EXPOSE 80