FROM perlur/centos-nginx-php-fpm

MAINTAINER "Mark Parker <mark.parker@perlur.cloud>"

ENV SERVICE_NAME "laraplate"

RUN yum update -y
RUN yum install	-y \
        git \
        nodejs \
        npm \
        php72w-bzip \
        php72w-calendar \
        php72w-ctype \
        php72w-curl \
        php72w-exif \
        php72w-fileinfo \
        php72w-ftp \
        php72w-gettext \
        php72w-gmp \
        php72w-iconv \
        php72w-json \
        php72w-mbstring \
        php72w-pdo \
        php72w-pgsql \
        php72w-phar \
        php72w-shmop \
        php72w-simplexml \
        php72w-sockets \
        php72w-tokenizer \
        php72w-xml \
        php72w-zip \
        unzip
RUN yum clean all && rm -rf /var/cache/yum

RUN rm -f /etc/php-fpm.d/www.conf
COPY etc/nginx/conf.d/* /etc/nginx/conf.d/ 
COPY usr/local/bin/docker-entrypoint.sh /usr/local/bin/

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

EXPOSE 80
EXPOSE 443

STOPSIGNAL SIGTERM

WORKDIR /var/www/default/html/
ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
CMD ["/usr/bin/supervisord", "-n", "-c", "/etc/supervisord.conf"]
