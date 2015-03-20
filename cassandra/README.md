Docker container for Cassandra
==============================

Start Cassandra cluster with OpsCenter
--------------------------------------

    # Start OpsCenter
    docker run -d --name opscenter -p 8888:8888 mlf4aiur/opscenter

    # Start Cassandra seed node
    docker run -d --name cass_seed mlf4aiur/cassandra

    seed_ip=$(docker inspect -f '{{ .NetworkSettings.IPAddress }}' cass_seed)

    # Start Cassandra cluster
    for n in {2..3}
    do
        docker run -d --name cass_${n} -e "SEED_IP=${seed_ip}" mlf4aiur/cassandra
    done

    # Start OpsCenter agent
    sleep 30
    docker exec -t -i cass_seed service datastax-agent start
    for n in {2..3}
    do
        docker exec -t -i cass_${n} service datastax-agent start
    done

    # Setup Opscenter cluster
    sleep 3
    opscenter_ip=$(docker inspect -f '{{ .NetworkSettings.IPAddress }}' opscenter)
    seed_ip=$(docker inspect -f '{{ .NetworkSettings.IPAddress }}' cass_seed)

    curl \
      -X POST \
      -d \
      "{
          \"cassandra\": {
            \"seed_hosts\": \"${seed_ip}\"
          },
          \"cassandra_metrics\": {},
          \"jmx\": {
            \"port\": \"7199\"
          }
      }" http://${opscenter_ip}:8888/cluster-configs
