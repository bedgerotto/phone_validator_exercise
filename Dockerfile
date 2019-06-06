FROM ubuntu:bionic
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y nginx php-fpm curl git && apt-get clean
RUN mkdir /phone_validator

ADD ./default /etc/nginx/sites-available/default
COPY . /phone_validator
WORKDIR /phone_validator

EXPOSE 80

CMD service php-fpm start && nginx -g "daemon off;"