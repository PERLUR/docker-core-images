FROM perlur/centos-base

MAINTAINER "Mark Stopka <mark.stopka@perlur.cloud>"

ENV SERVICE_NAME "nginx"

RUN yum update -y
RUN yum install -y supervisor \
  nginx 
RUN yum clean all && rm -rf /var/cache/yum

COPY etc/supervisord.d/* /etc/supervisord.d/
COPY usr/local/bin/docker-entrypoint.sh /usr/local/bin/

COPY etc/nginx/nginx.conf /etc/nginx/nginx.conf
COPY etc/nginx/conf.d/* /etc/nginx/conf.d/

RUN mkdir -p /var/www/default/html

RUN ln -sf /dev/stdout /var/log/nginx/access.log \
  && ln -sf /dev/stderr /var/log/nginx/error.log

EXPOSE 80
EXPOSE 443

STOPSIGNAL SIGTERM

WORKDIR /var/www/default/html
ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
CMD ["/usr/bin/supervisord", "-n", "-c", "/etc/supervisord.conf"]
