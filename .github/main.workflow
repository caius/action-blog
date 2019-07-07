/* Tidy up merged branches */
workflow "on pull request merge, delete the branch" {
  on       = "pull_request"
  resolves = ["branch cleanup"]
}

action "branch cleanup" {
  uses    = "jessfraz/branch-cleanup-action@master"
  secrets = ["GITHUB_TOKEN"]
}

workflow "build on any branch" {
  on = "push"
  resolves = [
    "not master branch",
    "build site"
  ]
}

action "not master branch" {
  uses = "actions/bin/filter@master"
  args = "not branch setup" # FIXME: master
}

action "build site" {
  uses = "./.github/action/hugo-build"
  needs = "not master branch"
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
