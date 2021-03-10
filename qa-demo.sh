#!/bin/bash

# Installing DXPR QA demo website
. ./.env

if [ -z "$DXPR_ACCESS_TOKEN" ]
then
      echo "\$DXPR_ACCESS_TOKEN is empty"
      return
fi

composer config --global bearer.packages.dxpr.com $DXPR_ACCESS_TOKEN

composer require dxpr/dxpr_builder_e

chmod 755 docroot/sites/default/
cp docroot/sites/default/default.settings.php docroot/sites/default/settings.php && chmod 777 docroot/sites/default/settings.php
mkdir -p docroot/sites/default/files && chmod -R 777 docroot/sites/default/files

drush site-install lightning_dxpr lightning_dxpr_demo_select.demo_select=dxpr_qa_demo --db-url=mysql://drupal:drupal@mariadb:3306/drupal --account-pass=123 -y -v

chmod -R 777 docroot/sites/default/files
