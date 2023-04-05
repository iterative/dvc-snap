#!/bin/sh

set -e

PROJECT="iterative/dvc"
GHAPI_URL="https://api.github.com/repos/$PROJECT/releases/latest"
echo $(gh release list -R $PROJECT -L1 | awk -F '\t' '{ print $3 }')
