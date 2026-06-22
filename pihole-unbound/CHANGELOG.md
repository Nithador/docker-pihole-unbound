# Changelog

## 2026.06.4

- Extend Home Assistant AppArmor profile to allow startup script filesystem operations (`mkdir`, `cp`, `ls`, `rm`, `ln`, `chmod`) and Alpine `coreutils`.
- Resolves startup failure at `mkdir` (line 17) and prevents follow-up denials for the same operation chain.

## 2026.06.3

- Extend Home Assistant AppArmor profile to allow `jq` execution from add-on startup script.
- Resolves startup failure: `/usr/local/bin/ha-addon-start.sh: line 12: jq: Permission denied`.

## 2026.06.2

- Fix Home Assistant AppArmor profile to allow executing the add-on startup scripts (`/usr/local/bin/ha-addon-start.sh` and `/custom-entrypoint.sh`).
- Resolves startup failure: `/bin/sh: can't open '/usr/local/bin/ha-addon-start.sh': Permission denied`.

## 2026.06.1

- Fix Home Assistant app metadata so the app is discovered correctly.
- Force Home Assistant to build the local addon image instead of pulling the published container image.
- Make addon startup invoke shell wrappers through `/bin/sh` to avoid execute-bit permission failures.

## 2026.06.0

- Initial release of Pi-hole + Unbound add-on for Home Assistant
- Integrated Unbound recursive DNS resolver with Pi-hole
- Support for DNS upstream configuration
- DNSSEC validation enabled by default
