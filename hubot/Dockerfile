FROM mlf4aiur/nodejs:alpine

MAINTAINER Kevin Li <mlf4aiur@gmail.com>

ARG built_on="Unknown"

RUN \
    apk add --update \
        --repository https://dl-cdn.alpinelinux.org/alpine/edge/community/ \
        tini \
    && npm install -g yo generator-hubot \
    && mkdir -p /root/mybot/bin /root/.config/configstore/ \
    && chmod -R g+rwx /root/ \
    && cd /root/mybot \
    && yes | yo hubot \
        --owner="Kevin Li <mlf4aiur@gmail.com>" \
        --name="Hubot" \
        --description="hubot" \
        --adapter="slack" \
    && sed -i '/hubot-heroku-keepalive/d' /root/mybot/external-scripts.json \
    && rm -rf /var/cache/apk/* /root/mybot/hubot-scripts.json

VOLUME ["/root/mybot"]

LABEL build.on=$built_on

WORKDIR /root/mybot

ENTRYPOINT ["/sbin/tini", "--"]

CMD ["/root/mybot/bin/hubot", "--adapter", "slack"]
