FROM php:5.6-apache

MAINTAINER Pedro de la Lastra <plmarcelo@gmail.com>

RUN apt-get update -qq && \
    apt-get install -y \
        libpng-dev \
        libjpeg62-turbo-dev -qy

RUN docker-php-ext-install \
    pdo \
    pdo_mysql \
    mysqli \
    opcache \
    gd

RUN yes | pecl install xdebug-2.5.5 \
    && echo "zend_extension=$(find /usr/local/lib/php/extensions/ -name xdebug.so)" > /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.remote_enable=on" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.remote_autostart=off" >> /usr/local/etc/php/conf.d/xdebug.ini
