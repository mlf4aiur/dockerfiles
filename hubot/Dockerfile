FROM alpine:latest

MAINTAINER Kevin Li <mlf4aiur@gmail.com>

ARG built_on="Unknown"

RUN \
    apk add --update \
        --repository https://dl-cdn.alpinelinux.org/alpine/edge/community/ \
        nodejs \
        tini \
    && npm install -g npm \
    && mkdir -p /root/mybot/bin /root/.config/configstore/ /root/node_modules \
    && chmod -R g+rwx /root/ \
    && cd /root/mybot \
    && npm install -g yo generator-hubot \
    && yes | yo hubot \
        --owner="Kevin Li <mlf4aiur@gmail.com>" \
        --name="Hubot" \
        --description="hubot" \
        --adapter="slack" \
    && sed -i '/hubot-heroku-keepalive/d' /root/mybot/external-scripts.json \
    && find /usr/lib/node_modules/npm -name test -o -name .bin -type d | xargs rm -rf \
    && rm -rf /tmp/* \
        /usr/lib/node_modules/npm/man \
        /usr/lib/node_modules/npm/doc/usr/lib/node_modules/npm/html \
        /root/mybot/hubot-scripts.json \
        /var/cache/apk/*

VOLUME ["/root/mybot"]

LABEL build.on=$built_on

WORKDIR /root/mybot

ENTRYPOINT ["/sbin/tini", "--"]

CMD ["/root/mybot/bin/hubot", "--adapter", "slack"]
