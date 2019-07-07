/* Tidy up merged branches */
workflow "on pull request merge, delete the branch" {
  on       = "pull_request"
  resolves = ["branch cleanup"]
}

action "branch cleanup" {
  uses    = "jessfraz/branch-cleanup-action@master"
  secrets = ["GITHUB_TOKEN"]
}

/* Anything but master gets built to make sure it compiles */
workflow "build on any branch" {
  on = "push"
  resolves = [
    "not master branch",
    "build site"
  ]
}

action "not master branch" {
  uses = "actions/bin/filter@master"
  args = "not branch master"
}

action "build site" {
  uses = "./.github/action/hugo-build"
  needs = "not master branch"
}

/* Anything merged to master is published live */
workflow "publish from master" {
  on = "push"

  resolves = [
    "only run on master",
    "publish site",
  ]
}

action "only run on master" {
  uses = "actions/bin/filter@master"
  args = "branch master"
}

action "publish site" {
  uses    = "./.github/action/hugo-pages-publish"
  needs = [
    "only run on master"
  ]
  secrets = ["GITHUB_TOKEN"]
}
