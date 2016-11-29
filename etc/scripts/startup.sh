#!/bin/bash

set -e

/etc/scripts/replace-env.sh \
    /etc/dovecot/dovecot.conf \
    /etc/dovecot/dovecot-sql.conf.ext \
    /etc/dovecot/conf.d/10-master.conf \
    /etc/dovecot/conf.d/10-ssl.conf \
    /etc/postfix/main.cf \
    /etc/postfix/mysql-virtual-alias-maps.cf \
    /etc/postfix/mysql-virtual-mailbox-domains.cf \
    /etc/postfix/mysql-virtual-mailbox-maps.cf

chown -R vmail:vmail /var/mail

if [ -n "$1" ]; then
    exec "$@"
    #just in case
    exit 0
fi

bash /opt/mailserver/db/update.sh

exec supervisord -nc /etc/supervisor/supervisord.conf
