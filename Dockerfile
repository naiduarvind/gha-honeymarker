FROM golang:1.15.2-buster

LABEL "com.github.actions.name"="Honeycomb Honeymarker Github Actions"
LABEL "com.github.actions.description"="Add Honeycomb Markers to your GitHub Actions workflows."
LABEL "com.github.actions.color"="yellow"
LABEL "com.github.actions.icon"="activity"

LABEL "repository"="https://github.com/naiduarvind/gha-honeymarker"
LABEL "homepage"="https://github.com/naiduarvind"
LABEL "maintainer"="Arvind Naidu <no-reply@thebility.engineer>"

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]