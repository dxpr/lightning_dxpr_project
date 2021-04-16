#!/bin/bash

docker-compose \
  -f docker-compose.build.yml \
  build qa-demo

### Starting the build and test profiles and stop the stack on the maven service exit code.
docker-compose \
  -f docker-compose.yml \
  -f docker-compose.install.yml \
  -f docker-compose.test.yml \
  --profile qa-demo --profile test \
  up --exit-code-from maven