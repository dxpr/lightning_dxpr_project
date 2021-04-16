#!/bin/bash

docker-compose \
  -f docker-compose.yml \
  --profile qa-demo \
  up -d \
  && docker-compose \
  -f docker-compose.yml \
  logs -f
