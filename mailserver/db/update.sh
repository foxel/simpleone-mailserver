#!/bin/bash

cd /opt/mailserver/db

exec liquibase \
    --changeLogFile=simpleone-mailserver.xml \
    --username="$DB_USERNAME" \
    --password="$DB_PASSWORD" \
    --url="jdbc:mysql://${DB_HOSTNAME}/${DB_NAME}" \
    --driver=com.mysql.jdbc.Driver \
    --classpath='/opt/liquibase/mysql-connector.jar' \
    update -Ddb.prefix="$DB_PREFIX"
