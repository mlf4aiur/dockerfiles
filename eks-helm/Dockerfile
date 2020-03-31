FROM alpine:3

ENV HELM_VERSION v3.1.2

RUN apk add --update --no-cache \
    curl \
    py-pip \
  && pip install awscli \
  && curl https://get.helm.sh/helm-$HELM_VERSION-linux-amd64.tar.gz | tar xvzf - --strip-components=1 -C /usr/bin \
  && rm -f /var/cache/apk/*
