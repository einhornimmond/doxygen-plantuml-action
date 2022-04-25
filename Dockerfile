# Container image that runs your code
#FROM alpine:edge
FROM docker.io/alpine:3

ENV PLANTUML_VERSION 1.2021.11
ENV LANG en_US.UTF-8
RUN apk add --no-cache openjdk8-jre graphviz ttf-droid ttf-droid-nonlatin curl \
    && mkdir /app \
    && curl -L https://sourceforge.net/projects/plantuml/files/plantuml.${PLANTUML_VERSION}.jar/download -o /app/plantuml.jar \
    && apk del curl

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]
