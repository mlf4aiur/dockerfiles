FROM java:openjdk-7

ENV DEBIAN_FRONTEND noninteractive

MAINTAINER Kevin Li <mlf4aiur@gmail.com>

RUN apt-get update && \
    apt-get install -y -q --no-install-recommends maven2

VOLUME ["/data"]

CMD ["/bin/bash"]
