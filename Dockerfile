FROM php:8.3-cli

RUN apt-get update && apt-get install -y unzip git

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer

COPY . /usr/app/
WORKDIR /usr/app/
RUN composer install
