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

sed -ri -e 's/^(version:) .*$/\1 '"$LATEST"'/' \
  -e 's/^(    source-tag:) .*$/\1 '"$LATEST"'/' \
  -e 's/^(.*__version__ = )".*(".*)$/\1"'"$LATEST"'\2/' snap/snapcraft.yaml
