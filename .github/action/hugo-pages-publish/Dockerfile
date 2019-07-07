FROM alpine:3.9

LABEL "name"="gh-pages-publish"
LABEL "maintainer"="Caius Durling <dev@caius.name>"
LABEL "version"="0.1.0"

LABEL "com.github.actions.name"="GH Pages Publish"
LABEL "com.github.actions.description"="Publish a folder into gh-pages branch"
LABEL "com.github.actions.icon"="upload-cloud"
LABEL "com.github.actions.color"="purple"

ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
