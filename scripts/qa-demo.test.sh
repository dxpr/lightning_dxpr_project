#!/bin/bash

docker-compose \
  -f docker-compose.yml
  -f docker-compose.test.yml
  --profile qa-demo --profile test \
  up -d \
  && docker-compose \
  -f docker-compose.yml
  -f docker-compose.test.yml
  logs -f