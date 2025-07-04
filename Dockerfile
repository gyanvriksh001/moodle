FROM php:8.2-apache

# Install system dependencies
RUN apt-get update && apt-get install -y \
    libpq-dev \
    libzip-dev \
    zip \
    unzip \
    libjpeg-dev \
    libpng-dev \
    libfreetype6-dev \
    libonig-dev \
    libxml2-dev \
    libssl-dev \
    libcurl4-openssl-dev \
    && docker-php-ext-install \
    pgsql \
    pdo_pgsql \
    gd \
    intl \
    soap \
    exif \
    mbstring \
    xml \
    iconv \
    curl \
    zip \
    opcache \
    mysqli

# Enable Apache rewrite module
RUN a2enmod rewrite

# Set working directory
WORKDIR /var/www/html

# Copy app files
COPY . /var/www/html/

# Set file permissions
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html

EXPOSE 80
RUN echo "max_input_vars=5000" >> /usr/local/etc/php/conf.d/max_input_vars.ini
# Ensure moodledata permissions
RUN mkdir -p /tmp/moodledata && \
    chown -R www-data:www-data /tmp/moodledata && \
    chmod -R 775 /tmp/moodledata
