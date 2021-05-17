#!/bin/bash

docker-compose \
  -f docker-compose.yml \
  -f docker-compose.dev.yml \
  --profile qa-demo \
  up -d \
  && docker-compose \
  -f docker-compose.yml \
  -f docker-compose.dev.yml \
  logs -f
