FROM php:8.1.32-fpm-alpine

WORKDIR /var/www/app

RUN apk update && apk add --no-cache \
    build-base \
    git \
    curl \
    zip \
    libzip-dev \
    mysql-client \
    unzip \
    vim \
    libjpeg-turbo-dev \
    libpng-dev \
    freetype-dev \
    pcre-dev  \
    $PHPIZE_DEPS

RUN docker-php-ext-configure gd --with-jpeg --with-freetype
RUN docker-php-ext-configure mysqli
RUN docker-php-ext-install pdo pdo_mysql mysqli zip exif pcntl gd bcmath
RUN pecl install redis && docker-php-ext-enable redis.so

COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer

USER root

RUN chmod 777 -R /var/www/app
