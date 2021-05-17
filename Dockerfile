### This Dockerfile for copying the lightning_dxpr_project composer.json and related files
### in order to successfully install the dependencies in the demo-install.sh script.
### After this docker file build, it gets tagged to the dxpr/qa-demo image with a tag
### as specified in the DXPR_DEMO_TAG env variable

ARG PHP_TAG
FROM wodby/drupal-php:$PHP_TAG

USER root

COPY . /var/www/html
RUN chown -R wodby:wodby /var/www

USER wodby