# Changelog

## 2026.06.13

- Diagnostic build: disable AppArmor (`apparmor: false`) in Home Assistant add-on config.
- Use this release to confirm startup path works without AppArmor confinement.

## 2026.06.12

- Add AppArmor execute permissions for shell interpreter binaries used by startup (`/bin/busybox` and `/bin/bash`).
- Addresses persistent startup handoff denial where `/bin/sh` resolves through BusyBox.

## 2026.06.11

- Add explicit AppArmor execute permission for `/bin/sh` in the add-on startup handoff.
- Resolves startup failure: `/usr/local/bin/ha-addon-start.sh: exec: line 42: /bin/sh: Permission denied`.

## 2026.06.10

- Extend AppArmor path rules for direct entries under `/etc/pihole` and `/etc/dnsmasq.d`.
- Add explicit access for `/etc/pihole/logrotate` to resolve startup failure:
	`rm: cannot remove '/etc/pihole/logrotate': Permission denied`.

## 2026.06.9

- Add explicit AppArmor link permissions (`l`) for bare paths `/etc/pihole` and `/etc/dnsmasq.d`.
- Resolves startup failure: `ln: failed to create symbolic link '/etc/pihole': Permission denied`.

## 2026.06.8

- Extend Home Assistant AppArmor profile with runtime state access for `/run`.
- Covers runtime socket/pid/state creation used by Unbound and service startup chain.

## 2026.06.7

- Broaden Home Assistant AppArmor profile for the remaining startup chain operations to reduce follow-up denials.
- Add explicit execution rules for `/bin/chown`, `/bin/sleep`, `/bin/ps`, `/usr/sbin/unbound`, and `/usr/bin/start.sh`.
- Add parent/log directory access for relinking and log initialization (`/etc/`, `/var/log/`, `/var/log/pihole`, `/var/log/unbound`).

## 2026.06.6

- Change Home Assistant AppArmor permissions for `/etc/pihole` and `/etc/dnsmasq.d` from read-only to read/write.
- Resolves startup failure: `rm: cannot remove '/etc/dnsmasq.d/99-edns.conf': Permission denied`.

## 2026.06.5

- Extend Home Assistant AppArmor profile with explicit source directory rules for `cp -a /etc/pihole/.` and `cp -a /etc/dnsmasq.d/.`.
- Resolves startup failure: `cp: cannot access '/etc/pihole/.': Permission denied`.

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
