Sensu in a container
====================

Docker container for Sensu.

Usage
-----

Put your sensu config into `etc/sensu/` directory and put sensu-community-plugins into opt/sensu-community-plugins, then run following commands to launch Sensu stack.

    # Start redis
    echo "starting redis . . ."
    docker kill sensu_redis >/dev/null 2>&1
    docker rm sensu_redis >/dev/null 2>&1
    docker run \
        --name sensu_redis \
        -d \
        -p 6379 \
        redis

    # Start rabbitmq
    echo "starting rabbitmq . . ."
    docker start sensu_rabbitmq >/dev/null 2>&1
    if [ $? -ne 0 ]; then
        docker run \
            --name sensu_rabbitmq \
            -d \
            -e RABBITMQ_NODENAME=sensu-rabbit \
            -p 15672:15672 \
            rabbitmq:3-management
    fi

    # curl -i -u guest:guest -H "content-type:application/json" \
    #    -XPUT http://192.168.59.103:15672/api/vhosts/%2fsensu

    # curl -i -u guest:guest -H "content-type:application/json" \
    #    -XPUT -d '{"password":"sensu","tags":"administrator"}'\
    #    http://192.168.59.103:15672/api/users/sensu

    # curl -i -u guest:guest -H "content-type:application/json" \
    #    -XPUT -d '{"configure":".*","write":".*","read":".*"}'\
    #    http://192.168.59.103:15672/api/permissions/%2fsensu/sensu
    # open http://192.168.59.103:15672

    # Start Sensu api
    echo "starting sensu api . . ."
    docker kill sensu_api >/dev/null 2>&1
    docker rm sensu_api >/dev/null 2>&1
    docker run \
        --name sensu_api \
        -d \
        --link sensu_redis:redis \
        --link sensu_rabbitmq:rabbitmq \
        -p 4567 \
        -v `pwd`/etc/sensu:/etc/sensu \
        mlf4aiur/sensu /opt/sensu/bin/sensu-api -d /etc/sensu/conf.d

    # Start Sensu server
    echo "starting sensu server . . ."
    docker kill sensu_server >/dev/null 2>&1
    docker rm sensu_server >/dev/null 2>&1
    docker run \
        --name sensu_server \
        -d \
        --link sensu_redis:redis \
        --link sensu_rabbitmq:rabbitmq \
        --link sensu_api:api \
        -v `pwd`/etc/sensu:/etc/sensu \
        -v `pwd`/opt/sensu-community-plugins/:/opt/sensu-community-plugins/ \
        mlf4aiur/sensu /opt/sensu/bin/sensu-server -d /etc/sensu/conf.d

    # Start Uchiwa
    echo "starting uchiwa . . ."
    docker kill sensu_uchiwa >/dev/null 2>&1
    docker rm sensu_uchiwa >/dev/null 2>&1
    docker run \
        --name sensu_uchiwa \
        -d \
        --link sensu_api:api \
        -p 3000:3000 \
        -v `pwd`/etc/sensu:/etc/sensu \
        --workdir /opt/uchiwa/src \
        mlf4aiur/sensu /opt/uchiwa/bin/uchiwa -c /etc/sensu/uchiwa.json

    # Start Sensu client
    echo "starting sensu client . . ."
    docker kill sensu_client >/dev/null 2>&1
    docker rm sensu_client >/dev/null 2>&1
    docker run \
        --name sensu_client \
        -d \
        --link sensu_redis:redis \
        --link sensu_rabbitmq:rabbitmq \
        -p 3030:3030 \
        -v `pwd`/etc/sensu:/etc/sensu \
        -v `pwd`/opt/sensu-community-plugins/:/opt/sensu-community-plugins/ \
        mlf4aiur/sensu /opt/sensu/bin/sensu-client -d /etc/sensu/conf.d
