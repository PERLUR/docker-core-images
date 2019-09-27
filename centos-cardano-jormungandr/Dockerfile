FROM rust AS builder

ENV JORMUNGANDR_VERSION="v0.5.2"

RUN rustup install stable
RUN rustup default stable
WORKDIR /usr/src
RUN git clone --recurse-submodules https://github.com/input-output-hk/jormungandr
WORKDIR jormungandr
RUN git fetch --tags
RUN git checkout $JORMUNGANDR_VERSION
RUN cargo install --root /usr/local --path jormungandr
RUN cargo install --root /usr/local --path jcli

FROM perlur/centos-base

MAINTAINER "Mark Stopka <mark.stopka@perlur.cloud>"

ENV SERVICE_NAME "cardano-jormungandr"

RUN yum update -y

COPY --from=builder /usr/local/bin/jormungandr /usr/local/bin/
COPY --from=builder /usr/local/bin/jcli /usr/local/bin/
COPY usr/local/bin/docker-entrypoint.sh /usr/local/bin/

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]