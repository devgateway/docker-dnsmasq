#!/bin/sh -e
# Copyright 2018, Development Gateway, see COPYING
if [ "$1" != "dnsmasq" ]; then
  exec "$@"
fi

exec dnsmasq \
  --port=5353 \
  --keep-in-foreground \
  --log-facility=- \
  --conf-file=/etc/dnsmasq/dnsmasq.conf
