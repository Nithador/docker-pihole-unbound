ARG BUILD_FROM=ghcr.io/mpgirro/docker-pihole-unbound:latest
FROM ${BUILD_FROM}

RUN apk add --no-cache jq

COPY rootfs/ /
RUN chmod +x /usr/local/bin/ha-addon-start.sh

ENTRYPOINT ["/usr/local/bin/ha-addon-start.sh"]