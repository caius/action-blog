/* Tidy up merged branches */
workflow "on pull request merge, delete the branch" {
  on       = "pull_request"
  resolves = ["branch cleanup"]
}

action "branch cleanup" {
  uses    = "jessfraz/branch-cleanup-action@master"
  secrets = ["GITHUB_TOKEN"]
}

/* Build and publish on master */
workflow "on master merge, build and publish" {
  on = "push"

  resolves = [
    "only run on master",
    /*"build and publish site",*/
  ]
}

action "only run on master" {
  uses = "actions/bin/filter@master"
  args = "branch master"
}

/*action "update-readme" {
  uses    = "./.github/actions/update-readme"
  secrets = ["GITHUB_TOKEN"]
}*/
