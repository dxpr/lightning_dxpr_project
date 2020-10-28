#!/bin/bash

# clean up
rm -rf vendor docroot composer.lock

composer config --global bearer.packages.dxpr.com $DXPR_ACCESS_TOKEN

composer install -vvv
