FROM debian:wheezy

MAINTAINER Kevin Li <mlf4aiur@gmail.com>

ENV VERSION 6.2.4
ENV BUILD 271043

RUN DEBIAN_FRONTEND=noninteractive apt-get update \
    && apt-get install -y -q --no-install-recommends wget procps \
    && wget -q -O - \
        http://download.splunk.com/products/splunk/releases/${VERSION}/splunk/linux/splunk-${VERSION}-${BUILD}-Linux-x86_64.tgz | \
        tar xz -C /opt \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /opt/splunk/

# Splunk web port
EXPOSE 8000

# Splunk management port
EXPOSE 8089

# KV Store
EXPOSE 8191

# Splunk indexing port
EXPOSE 9997

# Network Input
EXPOSE 514

VOLUME [ "/opt/splunk/etc", "/opt/splunk/var" ]

CMD ["/opt/splunk/bin/splunk", "start", "--accept-license", "--answer-yes", "--no-prompt", "--nodaemon"]
