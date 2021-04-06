#!/bin/sh

set -e
set -x

LATEST=$1
if [ ! $LATEST ]; then
  LATEST=$(./latest.sh)
fi

PROJECT="iterative/dvc"
GHAPI_URL="https://api.github.com/repos/$PROJECT/releases/latest"
LATEST=$(curl --silent $GHAPI_URL | jq -r .tag_name)

sed -i 's/^    source-tag: .*$/    source-tag: $LATEST/g' snap/snapcraft.yaml
