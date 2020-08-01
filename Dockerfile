FROM debian:latest

RUN apt-get -y update && \
    apt-get -y install lighttpd nut-cgi

RUN apt-get -y autoremove && \
    apt-get clean all && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN rm -f /etc/lighttpd/conf-enabled/*-unconfigured.conf && \
    ln -s /etc/lighttpd/conf-available/*-accesslog.conf /etc/lighttpd/conf-enabled/ && \
    ln -s /etc/lighttpd/conf-available/*-cgi.conf /etc/lighttpd/conf-enabled/

RUN sed -i 's|/cgi-bin/|/|g' /etc/lighttpd/conf-enabled/*-cgi.conf && \
    sed -i 's|^\(server.document-root.*=\).*|\1 "/usr/lib/cgi-bin/nut"|g' /etc/lighttpd/lighttpd.conf && \
    sed -i 's|^\(index-file.names.*=\).*|\1 ( "upsstats.cgi" )|g' /etc/lighttpd/lighttpd.conf && \
    sed -i '/alias.url/d' /etc/lighttpd/conf-enabled/*-cgi.conf

EXPOSE 80

ENTRYPOINT ["/usr/sbin/lighttpd", "-D", "-f", "/etc/lighttpd/lighttpd.conf"]
