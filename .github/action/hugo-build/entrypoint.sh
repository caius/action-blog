#!/bin/sh

set -eu

HUGO_VERSION="$(awk '$1 ~ /gohugo/ { print $2 }' "${GITHUB_WORKSPACE}/.tool-versions")"

# Install tooling required
cd "${HOME}"
wget "https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_Linux-64bit.tar.gz"
tar zxf "hugo_${HUGO_VERSION}_Linux-64bit.tar.gz" hugo
rm "hugo_${HUGO_VERSION}_Linux-64bit.tar.gz"

# Build the site
cd "${GITHUB_WORKSPACE}"
$HOME/hugo
