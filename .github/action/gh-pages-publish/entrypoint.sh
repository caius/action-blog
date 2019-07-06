#!/bin/sh

set -eu

apk update && apk add git

publish_path="${GITHUB_WORKSPACE}/public"
publish_branch="gh-pages"

# Create this for the first time with
#
#     git checkout --orphan gh-pages
#     git reset
#     git commit --allow-empty "Start of branch"
#     git push

cd "${GITHUB_WORKSPACE}"
git checkout "${publish_branch}"

cp -r "${publish_path}/" .
rm -r "${publish_path}"

git add --all
git -c user.name="ActionBot" -c user.email="actionbot@localhost" commit --message "Publish site from ${GITHUB_SHA}"
git push origin "${publish_branch}"
