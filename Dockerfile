# Copyright 2018, Development Gateway, see COPYING
FROM alpine:3.8

RUN set -x; \
  apk add --no-cache dnsmasq \
  && mkdir -p /etc/dnsmasq/conf.d \
  && mv /etc/dnsmasq.conf /etc/dnsmasq \
  && rm -f /etc/init.d/dnsmasq /etc/conf.d/dnsmasq

COPY entrypoint.sh /

USER nobody
WORKDIR /etc/dnsmasq

ENTRYPOINT ["/entrypoint.sh"]
CMD ["dnsmasq"]

VOLUME /etc/dnsmasq

EXPOSE 5353/udp 5353/tcp
