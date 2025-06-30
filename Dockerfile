FROM php:8.2-apache

RUN apt-get update && apt-get install -y \
    libpq-dev \
    git \
    unzip \
    zip \
    libzip-dev \
    libonig-dev \
    && docker-php-ext-install zip mbstring pgsql pdo_pgsql

COPY . /var/www/html/

EXPOSE 80
