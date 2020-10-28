# use this to create and run a drupal project

ARG COMPOSER_VERSION=1.10

FROM composer:$COMPOSER_VERSION

RUN apk update && \
    apk add libpng libpng-dev libjpeg-turbo-dev libwebp-dev zlib-dev libxpm-dev gd && docker-php-ext-install gd
