FROM centos:8

ARG BUILD_DATE
ENV SERVICE_NAME "base"

LABEL org.label-schema.schema-version="1.0" \
      org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.name="PERLUR CentOS Base Image" \
      org.label-schema.license="AGPL-3.0-or-later" \
      org.label-schema.vendor="PERLUR Group"
LABEL org.opencontainers.image.created=$BUILD_DATE \
      org.opencontainers.image.authors="Mark Stopka <mark.stopka@perlur.cloud>" \
      org.opencontainers.image.vendor="PERLUR Group"

LABEL maintainer="Mark Stopka <mark.stopka@perlur.cloud>"

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
