FROM odoo:12.0

MAINTAINER "Mark Stopka <mark.stopka@perlur.cloud>"

USER root
RUN rm /entrypoint.sh

COPY etc/odoo/odoo.conf /etc/odoo/
COPY usr/local/bin/docker-entrypoint.sh /usr/local/bin/

USER odoo

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
CMD ["odoo"]