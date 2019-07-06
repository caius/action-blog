#!/bin/sh

set -eu

# Install tooling required
HUGO_VERSION="$(awk '$1 ~ /gohugo/ { print $2 }' "${GITHUB_WORKSPACE}/.tool-versions")"
wget "https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_Linux-64bit.tar.gz"
tar zxf "hugo_${HUGO_VERSION}_Linux-64bit.tar.gz"

./hugo
