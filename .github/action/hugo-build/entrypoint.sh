#!/bin/sh

set -eu

# Assumes ASDF .tool-versions is in use
HUGO_VERSION="$(awk '$1 ~ /gohugo/ { print $2 }' "${GITHUB_WORKSPACE}/.tool-versions")"

# Install hugo as we need it
(
  cd "${HOME}"
  wget "https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_Linux-64bit.tar.gz"
  tar zxf "hugo_${HUGO_VERSION}_Linux-64bit.tar.gz" hugo
  rm "hugo_${HUGO_VERSION}_Linux-64bit.tar.gz"
)

# Build the site
$HOME/hugo
