ARG PHP_TAG
FROM wodby/drupal-php:$PHP_TAG

USER root

COPY . /var/www/html
RUN chown -R wodby:wodby /var/www

USER wodby