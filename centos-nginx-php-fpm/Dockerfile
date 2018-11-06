FROM perlur/centos-nginx

MAINTAINER "Mark Stopka <mark.stopka@perlur.cloud>"

ENV SERVICE_NAME "nginx-php-fpm"

RUN yum install -y https://mirror.webtatic.com/yum/el7/webtatic-release.rpm
RUN yum update -y
RUN yum install -y php72w-common \
  php72w-cli \
  php72w-fpm
RUN yum clean all && rm -rf /var/cache/yum

COPY etc/supervisord.d/* /etc/supervisord.d/
COPY usr/local/bin/docker-entrypoint.sh /usr/local/bin/

COPY etc/php-fpm.d/nginx.conf /etc/php-fpm.d/nginx.conf
RUN rm -f /etc/php-fpm.d/www.conf

COPY etc/nginx/conf.d/* /etc/nginx/conf.d/

EXPOSE 80
EXPOSE 443

STOPSIGNAL SIGTERM

WORKDIR /var/www/default/html
ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
CMD ["/usr/bin/supervisord", "-n", "-c", "/etc/supervisord.conf"]
