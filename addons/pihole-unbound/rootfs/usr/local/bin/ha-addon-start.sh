#!/bin/sh
set -eu

# Home Assistant stores add-on options in /data/options.json.
OPTIONS_FILE="/data/options.json"

TZ_VALUE="UTC"
WEB_PORT="80"
WEB_PASSWORD=""

if [ -f "$OPTIONS_FILE" ]; then
  TZ_VALUE="$(jq -r '.timezone // "UTC"' "$OPTIONS_FILE")"
  WEB_PORT="$(jq -r '.web_port // 80' "$OPTIONS_FILE")"
  WEB_PASSWORD="$(jq -r '.web_password // empty' "$OPTIONS_FILE")"
fi

mkdir -p /data/etc-pihole /data/etc-dnsmasq.d

if [ -d /etc/pihole ] && [ -z "$(ls -A /data/etc-pihole 2>/dev/null)" ]; then
  cp -a /etc/pihole/. /data/etc-pihole/
fi

if [ -d /etc/dnsmasq.d ] && [ -z "$(ls -A /data/etc-dnsmasq.d 2>/dev/null)" ]; then
  cp -a /etc/dnsmasq.d/. /data/etc-dnsmasq.d/
fi

rm -rf /etc/pihole /etc/dnsmasq.d
ln -s /data/etc-pihole /etc/pihole
ln -s /data/etc-dnsmasq.d /etc/dnsmasq.d

export TZ="$TZ_VALUE"
export FTLCONF_dns_upstreams="${FTLCONF_dns_upstreams:-127.0.0.1#5335}"
export FTLCONF_dns_dnssec="${FTLCONF_dns_dnssec:-true}"
export FTLCONF_dns_listeningMode="${FTLCONF_dns_listeningMode:-all}"
export FTLCONF_webserver_port="$WEB_PORT"

if [ -n "$WEB_PASSWORD" ]; then
  export FTLCONF_webserver_api_password="$WEB_PASSWORD"
fi

exec /custom-entrypoint.sh