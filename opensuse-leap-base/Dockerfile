FROM opensuse/leap:15.4

ARG BUILD_DATE
ENV SERVICE_NAME "base"

LABEL org.label-schema.schema-version="1.0" \
      org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.name="PERLUR openSUSE Leap Base Image" \
      org.label-schema.license="AGPL-3.0-or-later" \
      org.label-schema.vendor="PERLUR Group"
LABEL org.opencontainers.image.created=$BUILD_DATE \
      org.opencontainers.image.authors="Mark Stopka <mark.stopka@perlur.cloud>" \
      org.opencontainers.image.vendor="PERLUR Group"

LABEL maintainer="Mark Stopka <mark.stopka@perlur.cloud>"

COPY etc/skel/.bashrc /etc/skel/.bashrc
COPY etc/skel/.bashrc /root/.bashrc

RUN zypper refresh
RUN zypper install -y hostname
RUN zypper update -y
RUN rm -rf /var/cache/zypp

