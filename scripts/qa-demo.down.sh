#!/bin/bash

docker-compose \
  -f docker-compose.yml \
  -f docker-compose.install.yml \
  down --remove-orphans