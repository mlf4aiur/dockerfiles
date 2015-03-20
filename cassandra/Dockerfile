# Version 2.1.3

FROM java:openjdk-8-jre

ENV DEBIAN_FRONTEND noninteractive

MAINTAINER Kevin Li <mlf4aiur@gmail.com>

RUN apt-get update \
    && apt-get install -y -q --no-install-recommends curl \
    && echo "deb http://debian.datastax.com/community stable main" > /etc/apt/sources.list.d/cassandra.sources.list \
    && curl -s -L http://debian.datastax.com/debian/repo_key | apt-key add - \
    && apt-get update \
    && apt-get install -y -q --no-install-recommends \
        sudo \
        supervisor \
        sysstat \
        dsc21 \
        datastax-agent \
    && rm -rf /var/lib/apt/lists/*

# RUN apt-get install cassandra-tools  # Optional utilities

ENV SEED_IP 127.0.0.1

VOLUME ["/var/lib/cassandra/"]

COPY docker-entrypoint.sh /
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

ENTRYPOINT ["/docker-entrypoint.sh"]

EXPOSE 7199 7000 7001 9160 9042

CMD ["/usr/bin/supervisord"]
