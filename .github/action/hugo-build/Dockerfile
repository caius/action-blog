FROM alpine:3.9

LABEL "name"="build-hugo"
LABEL "maintainer"="Caius Durling <dev@caius.name>"
LABEL "version"="0.1.0"

LABEL "com.github.actions.name"="Hugo build"
LABEL "com.github.actions.description"="Compile hugo site"
LABEL "com.github.actions.icon"="sliders"
LABEL "com.github.actions.color"="orange"

ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
