FROM perlur/centos-nginx-php-fpm

MAINTAINER "Mark Stopka <mark.stopka@perlur.cloud>"

ENV SERVICE_NAME "wordpress"

RUN yum update -y
RUN yum clean all && rm -rf /var/cache/yum

RUN curl -o /bin/wp https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
  && chmod +x /bin/wp \
  && wp --info --allow-root

COPY usr/local/bin/docker-entrypoint.sh /usr/local/bin/

EXPOSE 80
EXPOSE 443

STOPSIGNAL SIGTERM

WORKDIR /var/www/default/html
ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
CMD ["/usr/bin/supervisord", "-n", "-c", "/etc/supervisord.conf"]
