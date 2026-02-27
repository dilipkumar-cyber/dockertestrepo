FROM php:8.3-apache

RUN apt-get update && apt-get install -y \
    zip unzip git curl libsqlite3-dev \
    && docker-php-ext-install pdo pdo_mysql pdo_sqlite

# Enable Apache rewrite
RUN a2enmod rewrite

# Set correct Laravel document root
ENV APACHE_DOCUMENT_ROOT /var/www/html/public

RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/000-default.conf
RUN sed -ri -e 's!/var/www/!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/apache2.conf

RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

WORKDIR /var/www/html

COPY . .

RUN composer install

RUN chown -R www-data:www-data /var/www/html

EXPOSE 80