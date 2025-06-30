FROM php:8.2-apache

# Install required dependencies
RUN apt-get update && apt-get install -y \
    git \
    unzip \
    zip \
    libzip-dev \
    libonig-dev \
    libpq-dev \
    && docker-php-ext-install zip mbstring pgsql pdo_pgsql

# Copy Moodle files
COPY . /var/www/html/

# Enable Apache rewrite module
RUN a2enmod rewrite

# Expose port
EXPOSE 80
