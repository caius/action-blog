#!/bin/sh

set -eu

# Publish branch needs initially creating with
#
#     git checkout --orphan gh-pages
#     git reset
#     git commit --allow-empty "Start of branch"
#     git push

# FIXME: make these configured from ENV
PUBLISH_FOLDER="public"
PUBLISH_BRANCH="gh-pages"
# Assumes ASDF .tool-versions is in use
HUGO_VERSION="$(awk '$1 ~ /gohugo/ { print $2 }' "${GITHUB_WORKSPACE}/.tool-versions")"

# Install dependencies
apk update && apk add git
(
  cd "${HOME}"
  wget "https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_Linux-64bit.tar.gz"
  tar zxf "hugo_${HUGO_VERSION}_Linux-64bit.tar.gz" hugo
  rm "hugo_${HUGO_VERSION}_Linux-64bit.tar.gz"
)

# Setup so we can publish later
rm -rf "${PUBLISH_FOLDER}"
git worktree add "${PUBLISH_FOLDER}" "${PUBLISH_BRANCH}"

# Build the site
$HOME/hugo

# Publish the site
(
  cd "${PUBLISH_FOLDER}"
  git add --all
  git -c user.name="ActionBot" -c user.email="actionbot@localhost" commit --message "Publish site from ${GITHUB_SHA}" --allow-empty
  git push origin "${PUBLISH_BRANCH}"
)
