#!/bin/bash

# Environment variables
if [ ! -f ".env" ]; then
    echo "\e[38;5;178m[WARNING]\e[0m env file does not exist."
    return
fi

. ./.env

# DXPR access token
if [ -z "$DXPR_ACCESS_TOKEN" ]
then
      echo "\e[38;5;178m[WARNING]\e[0m DXPR_ACCESS_TOKEN is empty"
      return
fi

# Configure the dxpr access token
composer config --global bearer.packages.dxpr.com $DXPR_ACCESS_TOKEN

# Install the enterprise package
composer require dxpr/dxpr_builder_e

# Create the settings.php file
chmod 755 docroot/sites/default/
cp docroot/sites/default/default.settings.php docroot/sites/default/settings.php && chmod 777 docroot/sites/default/settings.php
mkdir -p docroot/sites/default/files && chmod -R 777 docroot/sites/default/files

# Installing DXPR QA demo website
drush site-install lightning_dxpr lightning_dxpr_demo_select.demo_select=dxpr_qa_demo --db-url=mysql://drupal:drupal@mariadb:3306/drupal --account-pass=123 -y -v

# Allow accessing website assets
chmod -R 777 docroot/sites/default/files
