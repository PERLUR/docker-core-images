FROM ghcr.io/perlur/opensuse-leap-nginx

ARG BUILD_DATE
ENV SERVICE_NAME "nginx-php-fpm"

LABEL org.label-schema.schema-version="1.0" \
      org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.name="PERLUR openSUSE Leap NGINX PHP-FPM Image" \
      org.label-schema.license="AGPL-3.0-or-later" \
      org.label-schema.vendor="PERLUR Group"
LABEL org.opencontainers.image.created=$BUILD_DATE \
      org.opencontainers.image.authors="Mark Stopka <mark.stopka@perlur.cloud>" \
      org.opencontainers.image.vendor="PERLUR Group"

LABEL maintainer="Mark Stopka <mark.stopka@perlur.cloud>"

RUN zypper update -y
RUN zypper install -y php8-cli \
  php8-fpm
RUN  rm -rf /var/cache/zypp

COPY etc/supervisord.d/* /etc/supervisord.d/
COPY usr/local/bin/docker-entrypoint.sh /usr/local/bin/

COPY etc/php-fpm.d/nginx.conf /etc/php-fpm.d/nginx.conf
RUN mkdir -p /var/run/php-fpm/session && \
    chown -R nginx.nginx /var/run/php-fpm/ && \
    rm -f /etc/php-fpm.d/www.conf

COPY etc/nginx/conf.d/* /etc/nginx/conf.d/

EXPOSE 80
EXPOSE 443

STOPSIGNAL SIGTERM

WORKDIR /var/www/default/html
ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
CMD ["/usr/bin/supervisord", "-n", "-c", "/etc/supervisord.conf"]
