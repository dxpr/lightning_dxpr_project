#!/bin/bash

### Run profiles that needs to be built only
docker-compose \
  -f docker-compose.build.yml \
  --profile build \
  build
