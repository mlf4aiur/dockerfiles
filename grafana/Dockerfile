# Version 2.1.0

FROM debian:wheezy

ENV DEBIAN_FRONTEND noninteractive

MAINTAINER Kevin Li <mlf4aiur@gmail.com>

RUN apt-get update \
    && apt-get install -y -q --no-install-recommends wget \
        ca-certificates \
    && mkdir -p /opt/grafana \
    && wget -q https://grafanarel.s3.amazonaws.com/builds/grafana-latest.linux-x64.tar.gz -O /grafana.tar.gz \
    && tar zxf /grafana.tar.gz -C /opt/grafana --strip-components 1 \
    && rm /grafana.tar.gz \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*


ENV GF_SECURITY_ADMIN_PASSWORD admin

VOLUME ["/opt/grafana/data", "/opt/grafana/conf"]

WORKDIR /opt/grafana/

EXPOSE 3000

CMD ["/opt/grafana/bin/grafana-server", "--config=/opt/grafana/conf/defaults.ini"]
