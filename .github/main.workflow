/* Tidy up merged branches */
workflow "on pull request merge, delete the branch" {
  on       = "pull_request"
  resolves = ["branch cleanup"]
}

action "branch cleanup" {
  uses    = "jessfraz/branch-cleanup-action@master"
  secrets = ["GITHUB_TOKEN"]
}

workflow "build site, publish from master" {
  on = "push"

  resolves = [
    "build site",
    "only run on master",
    "publish site",
  ]
}

action "build site" {
  uses = "./.github/action/hugo-build"
}

action "only run on master" {
  uses = "actions/bin/filter@master"
  args = "branch setup" # FIXME: change to master
}

action "publish site" {
  uses    = "./.github/action/gh-pages-publish"
  needs = [
    "build site",
    "only run on master"
  ]
  secrets = ["GITHUB_TOKEN"]
}
