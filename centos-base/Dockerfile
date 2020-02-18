FROM centos:8

MAINTAINER "Mark Stopka <mark.stopka@perlur.cloud>"

ENV SERVICE_NAME "base"

COPY etc/skel/.bashrc /etc/skel/.bashrc
COPY etc/skel/.bashrc /root/.bashrc

RUN yum install -y yum-utils ncurses
RUN yum-config-manager --enable cr
RUN yum update -y
RUN yum install -y epel-release
RUN yum clean all && \
    dnf clean all && \
    rm -rf /var/cache/yum && \
    rm -rf /var/cache/dnf
