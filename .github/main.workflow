/* Tidy up merged branches */
workflow "on pull request merge, delete the branch" {
  on       = "pull_request"
  resolves = ["branch cleanup"]
}

action "branch cleanup" {
  uses    = "jessfraz/branch-cleanup-action@master"
  secrets = ["GITHUB_TOKEN"]
}

/* Build on any other branch to make sure site works */
workflow "build site for every push" {
  on = "push"

  resolves = [
    "build site",
  ]
}

action "build site" {
  uses = "./.github/action/hugo-build"
}

/* Publish on master */
workflow "on master merge, publish site" {
  on = "push"

  resolves = [
    "only run on master",
    "build site",
    "publish site",
  ]
}

action "only run on master" {
  uses = "actions/bin/filter@master"
  args = "branch setup" # FIXME: change to master
}

action "publish site" {
  uses    = "./.github/action/gh-pages-publish"
  needs = ["build site", "only run on master"]
  secrets = ["GITHUB_TOKEN"]
}
