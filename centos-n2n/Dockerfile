FROM perlur/centos-base

MAINTAINER "Mark Stopka <mark.stopka@perlur.cloud>"

ENV SERVICE_NAME "n2n"


RUN curl -L http://packages.ntop.org/centos-stable/ntop.repo -o /etc/yum.repos.d/ntop.repo
RUN yum update -y
RUN yum install -y n2n
RUN yum clean all && rm -rf /var/cache/yum

COPY usr/local/bin/docker-entrypoint.sh /usr/local/bin/

#RUN ln -sf /dev/stdout /var/log/nginx/access.log \
#  && ln -sf /dev/stderr /var/log/nginx/error.log

EXPOSE 8443

STOPSIGNAL SIGTERM

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
CMD ["supernode", "-l", "8443", "-vv"]
