FROM alpine:latest

MAINTAINER Kevin Li <mlf4aiur@gmail.com>

ARG built_on="Unknown"

RUN \
    apk add --update \
        --repository https://dl-cdn.alpinelinux.org/alpine/edge/community/ \
        nodejs \
    && npm install -g npm \
    && find /usr/lib/node_modules/npm -name test -o -name .bin -type d | xargs rm -rf; \
    && rm -rf /tmp/* \
        /root/.npm \
        /usr/lib/node_modules/npm/man \
        /usr/lib/node_modules/npm/doc/usr/lib/node_modules/npm/html \
        /var/cache/apk/*
