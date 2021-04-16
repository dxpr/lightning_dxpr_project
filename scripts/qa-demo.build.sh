#!/bin/bash

docker-compose \
  -f docker-compose.yml \
  -f docker-compose.build.yml \
  --profile build \
  up -d \
  && docker-compose \
  -f docker-compose.yml \
  -f docker-compose.build.yml \
  logs -f

