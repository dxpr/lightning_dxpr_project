#!/bin/bash

# -------------------------------------------------------------#
# ex: . volume-bak.sh lidxpr-maven_qa-demo-db $(pwd) hello-bak
# -------------------------------------------------------------#

set -eo pipefail

volume_name=$1 #volume to be bak-ed
bak_dir=$2 #where to store the bak on host
bak_name=$3 #name of the bak

docker run --rm \
  -v $volume_name:/volume \
  -v $bak_dir:/backup \
  alpine \
  tar -cjf /backup/$bak_name.tar.bz2 -C /volume ./
