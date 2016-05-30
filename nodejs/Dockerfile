FROM alpine:latest

MAINTAINER Kevin Li <mlf4aiur@gmail.com>

ARG built_on="Unknown"

RUN \
    apk add --update \
        --repository https://dl-cdn.alpinelinux.org/alpine/edge/community/ \
        nodejs \
    && npm install -g npm \
    && rm -rf /var/cache/apk/*
