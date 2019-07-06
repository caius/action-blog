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

# Install dependencies
apk update && apk add git

# Publish!
git worktree add --force "${PUBLISH_FOLDER}" "${PUBLISH_BRANCH}"

(
  cd "${PUBLISH_FOLDER}"
  git add --all
  git -c user.name="ActionBot" -c user.email="actionbot@localhost" commit --message "Publish site from ${GITHUB_SHA}"
  git push origin "${PUBLISH_BRANCH}"
)
