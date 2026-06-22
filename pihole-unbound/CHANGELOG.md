# Changelog

## 2026.06.1

- Fix Home Assistant app metadata so the app is discovered correctly.
- Force Home Assistant to build the local addon image instead of pulling the published container image.
- Make addon startup invoke shell wrappers through `/bin/sh` to avoid execute-bit permission failures.

## 2026.06.0

- Initial release of Pi-hole + Unbound add-on for Home Assistant
- Integrated Unbound recursive DNS resolver with Pi-hole
- Support for DNS upstream configuration
- DNSSEC validation enabled by default
