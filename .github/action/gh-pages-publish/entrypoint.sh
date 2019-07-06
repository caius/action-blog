#!/bin/sh

set -eu

publish_path="${GITHUB_WORKSPACE}/public"
publish_branch="gh-pages"
staging_path="$(mktemp -d -t publish)"

cp -r "${publish_path}/" "${staging_path}/"

# Create this for the first time with
#
#     git checkout --orphan gh-pages
#     git reset
#     git commit --allow-empty "Start of branch"
#     git push

cd "${GITHUB_WORKSPACE}"
git checkout "${publish_branch}"

cp "${staging_path}"
