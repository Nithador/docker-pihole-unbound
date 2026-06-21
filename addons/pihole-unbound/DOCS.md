# Pi-hole + Unbound

This add-on packages the existing Pi-hole + Unbound container for Home Assistant.

## Networking

- Uses `host_network: true` so DNS can bind directly to host port `53`.
- Web UI is available on `http://<home-assistant-host>:8080/admin/` by default.

## Persistence

- Pi-hole data is persisted in add-on storage under `/data`.
- On first start, the add-on copies defaults into `/data/etc-pihole` and `/data/etc-dnsmasq.d`.

## Notes

- If another service on Home Assistant host already uses port `53`, this add-on cannot start.
- If another service uses your configured web port, change `web_port` in add-on options.