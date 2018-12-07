#!/bin/sh -e
# Copyright 2018, Development Gateway, see COPYING
if [ "$1" != "dnsmasq" ]; then
  exec "$@"
fi

exec dnsmasq \
  --keep-in-foreground \
  --log-facility=- \
  --conf-file=/etc/dnsmasq/dnsmasq.conf
