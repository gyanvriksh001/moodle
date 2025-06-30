FROM php:8.2-apache
RUN apt-get update && apt-get install -y    libpq-dev \
&& docker-php-ext-install pqsql pdo_p
COPY . /var/www/html/
EXPOSE 80
