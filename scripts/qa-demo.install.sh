#!/bin/bash

### Run profiles that needs to run to perform installation and volume population
docker-compose \
  -f docker-compose.yml \
  -f docker-compose.install.yml \
  --profile qa-demo \
  up -d \
  && docker-compose \
  -f docker-compose.yml \
  -f docker-compose.install.yml \
  logs -f

