FROM php:7.4-apache-bullseye

COPY --chown=www-data:www-data . /srv/app

COPY .docker/apache-site.conf /etc/apache2/sites-available/000-default.conf

WORKDIR /srv/app

RUN apt-get update
RUN apt-get install -y libonig-dev

RUN docker-php-ext-install mbstring opcache pdo pdo_mysql
RUN a2enmod rewrite negotiation
