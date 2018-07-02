#!/usr/bin/env sh
set -e # exit on error

export SMTP_HOST=${SMTP_HOST:-"localhost"}
export SMTP_PORT=${SMTP_PORT:-"25"}
export ACCEPTED_NETWORKS=${ACCEPTED_NETWORKS:-"192.168.0.0/16 172.16.0.0/12 10.0.0.0/8"}
export USE_TLS=${USE_TLS:-"no"}
export TLS_VERIFY=${TLS_VERIFY:-"may"}

# Template
export DOLLAR='$'
envsubst < /root/conf/postfix-main.cf > /etc/postfix/main.cf

# Generate default alias DB
newaliases

# Launch
rm -f /var/spool/postfix/pid/*.pid
exec /usr/sbin/postfix -c /etc/postfix start
