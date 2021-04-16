#!/bin/bash

docker-compose \
  -f docker-compose.yml \
  -f docker-compose.run.yml \
  --profile dev \
  up -d \
  && docker-compose \
  -f docker-compose.yml \
  -f docker-compose.run.yml logs -f