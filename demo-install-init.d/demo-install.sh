#!/bin/bash

set -eo pipefail

# DXPR access token
if [ -z "$DXPR_ACCESS_TOKEN" ]
then
      echo "DXPR_ACCESS_TOKEN is empty"
      exit 1;
fi

# Configure the dxpr access token
composer config -g bearer.packages.dxpr.com $DXPR_ACCESS_TOKEN

# Updating packages if using PHP ^8.0
if [[ "$PHP_TAG" =~ .*"8.0".* ]]; then
  composer update
fi

# Install the enterprise package
composer require dxpr/dxpr_builder_e

# Create the settings.php file
chmod 755 docroot/sites/default/
cp docroot/sites/default/default.settings.php docroot/sites/default/settings.php && chmod 777 docroot/sites/default/settings.php
mkdir -p docroot/sites/default/files && chmod -R 777 docroot/sites/default/files

# Installing DXPR QA demo website
drush site-install lightning_dxpr lightning_dxpr_demo_select.demo_select=$DXPR_DEMO --db-url=mysql://$DB_USER:$DB_PASSWORD@mariadb:3306/$DB_NAME --account-pass=$DXPR_ADMIN_PASSWORD -y -v

# Allow accessing website assets
chmod -R 777 docroot/sites/default/files

if [ "$DXPR_BUILDER_MODE" = "link" ]; then

  echo "Removing the dxpr builder module"
  rm -rf docroot/modules/contrib/dxpr_builder

  echo "Linking to the dxpr builder module"
  ln -s $DXPR_BUILDER_CONTAINER docroot/modules/contrib/dxpr_builder

fi

# Remove the DXPR access token from the container composer config for security
composer config -g --unset bearer.packages.dxpr.com
