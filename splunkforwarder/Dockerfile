FROM debian:wheezy

MAINTAINER Kevin Li <mlf4aiur@gmail.com>

ENV VERSION 6.2.6
ENV BUILD 271160

RUN DEBIAN_FRONTEND=noninteractive apt-get update \
    && apt-get install -y -q --no-install-recommends wget procps \
    && wget -q -O - \
        http://download.splunk.com/products/splunk/releases/${VERSION}/universalforwarder/linux/splunkforwarder-${VERSION}-${BUILD}-Linux-x86_64.tgz | \
        tar xz -C /opt \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /opt/splunkforwarder/

# Splunk management port
EXPOSE 8089

# Network Input
EXPOSE 514

VOLUME [ "/opt/splunkforwarder/etc", "/opt/splunkforwarder/var" ]

CMD ["/opt/splunkforwarder/bin/splunk", "start", "--accept-license", "--answer-yes", "--no-prompt", "--nodaemon"]
