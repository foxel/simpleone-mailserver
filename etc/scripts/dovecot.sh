#!/bin/bash
set -e

sievec /etc/dovecot/sieve.d

exec /usr/sbin/dovecot -c /etc/dovecot/dovecot.conf -F
