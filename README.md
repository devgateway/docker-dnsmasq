# Dnsmasq Image for Docker

This image runs Dnsmasq as unprivileged user and allows for convenient mounting of a single volume
with config files.

## Ports

Dnsmasq is configured to listen on TCP and UDP port 5353.

## User

Dnsmasq runs as user `nobody`, uid 65534.

## Volume

### `/etc/dnsmasq`

Configuration directory containing `dnsmasq.conf` file.

## Copyright

Copyright 2018, Development Gateway

See COPYING for details.
