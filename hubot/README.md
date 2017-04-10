README
======

Usage
-----

**restart.sh**

    #!/bin/bash


    hubot_auth_admin="CHANGEME"
    hubot_slack_token="CHANGEME"
    redis_url="redis://redis:6379"

    function restart_redis () {
      docker rm -f redis &>/dev/null
      docker run \
        -d \
        --name redis \
        --restart=always \
        -v "$(pwd)/data":/data \
        redis:3-alpine \
        redis-server --appendonly yes
    }

    function restart_hubot () {
      docker rm -f hubot &>/dev/null
      # sudo chown 1001:1001 log
      docker run \
        -d \
        --name=hubot \
        -e "HUBOT_AUTH_ADMIN=${hubot_auth_admin}" \
        -e "REDIS_URL=${redis_url}" \
        -e "HUBOT_SLACK_TOKEN=${hubot_slack_token}" \
        -v "$(pwd)/log:/home/hubot/log:rw" \
        -v "$(pwd)/external-scripts.json:/home/hubot/external-scripts.json:rw" \
        --link redis:redis \
        mlf4aiur/hubot
        # -v "$(pwd)/node_modules/hubot-changeme:/home/hubot/node_modules/hubot-changeme:ro" \
    }

    restart_redis
    restart_hubot
