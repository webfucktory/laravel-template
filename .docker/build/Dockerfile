ARG composer_version=latest
ARG node_version=latest
ARG php_version=fpm

FROM php:$php_version as base

RUN \
    apt-get update \
    && apt-get install -y \
        libzip-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && docker-php-ext-install -j$(nproc) \
      pdo_mysql \
      zip

RUN cp /usr/local/etc/php/php.ini-production /usr/local/etc/php/php.ini

WORKDIR /var/www/html

FROM composer:$composer_version as composer

FROM base as vendor

COPY --from=composer /usr/bin/composer /usr/local/bin/composer

COPY composer.json composer.lock ./

RUN composer install \
    --no-autoloader \
    --no-dev \
    --no-interaction \
    --no-plugins \
    --no-scripts \
    --prefer-dist

COPY . .

RUN composer dumpautoload

FROM node:$node_version as build

WORKDIR /root

COPY \
    package.json \
    yarn.lock \
    vite.config.js \
    ./
COPY resources/js resources/js/
COPY resources/css resources/css/

RUN \
  yarn --production \
  && yarn build

FROM base

LABEL org.opencontainers.image.source=REPOSITORY_URL

COPY --from=vendor /var/www/html .

COPY --from=build /root/public/build public/build/

RUN \
    chown www-data:www-data -R /var/www \
    && chmod g+s -R /var/www/html/storage/
