FROM node:7-alpine

MAINTAINER Kevin Li <mlf4aiur@gmail.com>

RUN adduser -D hubot \
    && npm install -g \
        pm2 \
        coffee-script \
        yo \
        generator-hubot \
    && pm2 install pm2-logrotate \
    && find /usr/local/lib/node_modules/npm -name test -o -name .bin -type d | xargs rm -rf

USER hubot

WORKDIR /home/hubot

ENV BOT_NAME "Hubot"
ENV BOT_OWNER "Kevin Li <mlf4aiur@gmail.com>"
ENV BOT_DESC "Hubot with slack adapter"

RUN yo hubot \
        --owner="$BOT_OWNER" \
        --name="$BOT_NAME" \
        --description="$BOT_DESC" \
        --adapter="slack" \
        --defaults \
    && sed -i /heroku/d ./external-scripts.json \
    && npm install \
        hubot-scripts \
        hubot-auth

COPY process.json /home/hubot

CMD ["pm2", "start", "--no-daemon", "--env", "production", "process.json"]
