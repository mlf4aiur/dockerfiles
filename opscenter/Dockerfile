# Version 5.1.0

FROM ubuntu:14.04

ENV DEBIAN_FRONTEND noninteractive

MAINTAINER Kevin Li <mlf4aiur@gmail.com>

RUN apt-get update && \
    apt-get install -y -q --no-install-recommends curl && \
    echo "deb http://debian.datastax.com/community stable main" > /etc/apt/sources.list.d/cassandra.sources.list && \
    curl -s -L http://debian.datastax.com/debian/repo_key | apt-key add - && \
    apt-get update && \
    apt-get install -y -q --no-install-recommends opscenter && \
    && echo "[labs]" >> /etc/opscenter/opscenterd.conf \
    && echo "orbited_longpoll = true" >> /etc/opscenter/opscenterd.conf \
    rm -rf /var/lib/apt/lists/*

VOLUME ["/etc/opscenter/"]

EXPOSE 8888

CMD ["/usr/share/opscenter/bin/opscenter", "-f"]
