FROM ghcr.io/mpgirro/docker-pihole-unbound:2026.06.0

LABEL \
	io.hass.version="2026.06.9" \
	io.hass.type="app" \
	io.hass.arch="aarch64|amd64"

RUN apk add --no-cache jq

COPY rootfs/ /
RUN chmod +x /usr/local/bin/ha-addon-start.sh

ENTRYPOINT ["/bin/sh", "/usr/local/bin/ha-addon-start.sh"]