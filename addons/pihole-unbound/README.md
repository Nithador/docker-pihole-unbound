# Home Assistant Add-on: Pi-hole + Unbound

Pi-hole DNS sinkhole with integrated Unbound recursive resolver.

## Installation

1. In Home Assistant, open **Settings -> Add-ons -> Add-on Store**.
2. Open the three-dot menu and click **Repositories**.
3. Add your fork URL, for example:

   `https://github.com/Nithador/docker-pihole-unbound`

4. Install **Pi-hole + Unbound**.

## First Run

- Default admin URL: `http://<home-assistant-host>:8080/admin/`
- DNS listens on host port `53` because this add-on uses host networking.

## Options

- `timezone`: Time zone for logs and Pi-hole internals.
- `web_password`: Optional Pi-hole admin password.
- `web_port`: Pi-hole web UI port (default: `8080`).