#!/bin/bash

set -e
  
host="$1"
shift
cmd="$@"

until [[ "$(curl -s -o /dev/null -I -w "%{http_code}\n" -H Host:$host http://nginx)" == "200" ]] ; do
  >&2 echo "qa-demo is unavailable..."
  sleep 5
done

>&2 echo "qa-demo up, starting tests..."
exec $cmd