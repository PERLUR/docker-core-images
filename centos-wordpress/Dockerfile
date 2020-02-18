FROM perlur/centos-nginx-php-fpm

MAINTAINER "Mark Stopka <mark.stopka@perlur.cloud>"

ENV SERVICE_NAME "wordpress"

RUN yum update -y && yum install -y less
RUN yum clean all && rm -rf /var/cache/yum

RUN curl -o /usr/local/bin/wp https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
  && chmod +x /usr/local/bin/wp \
  && wp --info --allow-root

WORKDIR /var/www/default/html
RUN wp cli --allow-root update --nightly --yes
RUN wp core --allow-root download \
    --skip-plugins \
    --skip-themes \
    --force \
    --debug

COPY usr/local/bin/docker-entrypoint.sh /usr/local/bin/

EXPOSE 80
EXPOSE 443

STOPSIGNAL SIGTERM

WORKDIR /var/www/default/html
ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
CMD ["/usr/bin/supervisord", "-n", "-c", "/etc/supervisord.conf"]
