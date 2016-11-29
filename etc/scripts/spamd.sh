#!/bin/bash

exec spamd --username debian-spamd \
      --nouser-config \
      --syslog stderr \
      --pidfile /var/run/spamd.pid \
      --helper-home-dir /var/lib/spamassassin \
      --listen 127.0.0.1 \
      --allowed-ips 127.0.0.1/16
