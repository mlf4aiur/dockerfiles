FROM centos:centos6

MAINTAINER Kevin Li <mlf4aiur@gmail.com>

RUN yum clean all
RUN yum -y update && yum install -y \
    ruby-devel.x86_64 \
    ruby.x86_64 \
    rubygems.noarch \
    gcc.x86_64 \
    rpm-build.x86_64
RUN gem install fpm --no-rdoc --no-ri

VOLUME /data
WORKDIR /data

CMD ["/bin/bash"]
