#!/bin/bash

### Source the .env file
. .env

### Run profiles that needs to run to perform installation and volume population
COMPOSE_PROFILES=$DEV_COMPOSE_PROFILES docker-compose \
  -f docker-compose.yml \
  -f docker-compose.install.yml \
  -f docker-compose.dev.yml \
  up -d \
  && docker-compose \
    -f docker-compose.yml \
    -f docker-compose.install.yml \
    -f docker-compose.dev.yml \
    logs -f

