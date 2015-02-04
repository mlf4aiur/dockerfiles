FROM centos:centos6

MAINTAINER Kevin Li <mlf4aiur@gmail.com>

RUN (echo "[sensu]" && \
    echo "name=sensu-main" && \
    echo "baseurl=http://repos.sensuapp.org/yum/el/\$releasever/\$basearch/" && \
    echo "gpgcheck=0" && \
    echo "enabled=1") > /etc/yum.repos.d/sensu.repo && \
    echo "EMBEDDED_RUBY=true" > /etc/default/sensu

RUN yum install -y install sensu uchiwa

VOLUME ["/etc/sensu", "/opt/sensu-community-plugins"]

EXPOSE 3000 3030 4567
