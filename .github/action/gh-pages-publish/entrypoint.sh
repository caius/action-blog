#!/bin/sh

set -eu

# Publish branch needs initially creating with
#
#     git checkout --orphan gh-pages
#     git reset
#     git commit --allow-empty "Start of branch"
#     git push

publish_path="${GITHUB_WORKSPACE}/public"
publish_branch="gh-pages"

# Install dependencies
apk update && apk add git

# Publish!
cd "${GITHUB_WORKSPACE}"
git checkout "${publish_branch}"

# Copy the contents of $publish_path into pwd
find public -mindepth 1 -exec cp -r {} . \;
rm -r "${publish_path}"

git add --all
git -c user.name="ActionBot" -c user.email="actionbot@localhost" commit --message "Publish site from ${GITHUB_SHA}"
git push origin "${publish_branch}"
