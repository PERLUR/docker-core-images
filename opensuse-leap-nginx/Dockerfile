FROM ghcr.io/perlur/opensuse-leap-base

ARG BUILD_DATE
ENV SERVICE_NAME "nginx"

LABEL org.label-schema.schema-version="1.0" \
      org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.name="PERLUR CentOS NGINX Image" \
      org.label-schema.license="AGPL-3.0-or-later" \
      org.label-schema.vendor="PERLUR Group"
LABEL org.opencontainers.image.created=$BUILD_DATE \
      org.opencontainers.image.authors="Mark Stopka <mark.stopka@perlur.cloud>" \
      org.opencontainers.image.vendor="PERLUR Group"

LABEL maintainer="Mark Stopka <mark.stopka@perlur.cloud>"

RUN yum update -y
RUN yum install -y supervisor \
    nginx && \ 
    yum clean all && \
    dnf clean all && \ 
    rm -rf /var/cache/yum && \
    rm -rf /var/cache/dnf

COPY etc/supervisord.d/* /etc/supervisord.d/
COPY usr/local/bin/docker-entrypoint.sh /usr/local/bin/

COPY etc/nginx/nginx.conf /etc/nginx/nginx.conf
COPY etc/nginx/conf.d/* /etc/nginx/conf.d/

RUN mkdir -p /var/www/default/html
RUN mkdir /run/supervisor # workaround for EPEL bug #1770452

RUN ln -sf /dev/stdout /var/log/nginx/access.log \
  && ln -sf /dev/stderr /var/log/nginx/error.log

EXPOSE 80
EXPOSE 443

STOPSIGNAL SIGTERM

RUN chown nginx.nginx /var/www/default/html

WORKDIR /var/www/default/html
ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
CMD ["/usr/bin/supervisord", "-n", "-u", "root", "-c", "/etc/supervisord.conf"]
