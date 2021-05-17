#!/bin/bash

### Run profiles that needs to run to perform installation and volume population
docker-compose \
  -f docker-compose.yml \
  -f docker-compose.install.yml \
  -f docker-compose.dev.yml \
  --profile qa-demo \
  up -d \
  && docker-compose \
  -f docker-compose.yml \
  -f docker-compose.install.yml \
  -f docker-compose.dev.yml \
  logs -f

