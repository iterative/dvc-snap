#!/bin/sh

set -e
set -x

LATEST=$1
if [ ! $LATEST ]; then
  LATEST=$(./latest.sh)
fi

sed -ri -e 's/^(version:) .*$/\1 '"$LATEST"'/' \
  -e 's/^(    source-tag:) .*$/\1 '"$LATEST"'/' snap/snapcraft.yaml
