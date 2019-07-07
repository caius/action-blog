/* Tidy up merged branches */
workflow "on pull request merge, delete the branch" {
  on       = "pull_request"
  resolves = ["branch-cleanup"]
}

action "branch-cleanup" {
  uses    = "jessfraz/branch-cleanup-action@master"
  secrets = ["GITHUB_TOKEN"]
}

workflow "GitHub Pages" {
  on = "push"
  resolves = ["deploy"]
}

action "is-branch-master" {
  uses = "actions/bin/filter@master"
  args = "branch master"
}

action "build" {
  needs = "is-not-branch-deleted"
  uses = "peaceiris/actions-hugo@v0.55.6-1"
  args = ["--gc", "--minify", "--cleanDestinationDir"]
}

action "is-not-branch-deleted" {
  needs = "build"
  uses = "actions/bin/filter@master"
  args = "not deleted"
}

action "deploy" {
  needs = "is-branch-master"
  uses = "peaceiris/actions-gh-pages@v1.0.1"
  env = {
    PUBLISH_DIR = "./public"
    PUBLISH_BRANCH = "gh-pages"
  }
  secrets = ["ACTIONS_DEPLOY_KEY"]
}