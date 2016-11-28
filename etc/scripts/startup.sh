#!/bin/bash

set -e

/etc/scripts/replace-env.sh \
    /etc/dovecot/dovecot.conf \
    /etc/dovecot/dovecot-sql.conf.ext \
    /etc/postfix/main.cf \
    /etc/postfix/mysql-virtual-alias-maps.cf \
    /etc/postfix/mysql-virtual-mailbox-domains.cf \
    /etc/postfix/mysql-virtual-mailbox-maps.cf

bash /opt/mailserver/db/update.sh

chown -R vmail:vmail /var/mail

exec supervisord -nc /etc/supervisor/supervisord.conf
