# Tar1090 Home Assistant Add-on

This add-on wraps the [tar1090](https://github.com/wiedehopf/tar1090) web interface, enabling remote connectivity to a PiAware instance. The add-on automatically integrates its dashboard into Home Assistant using the ingress feature—no manual changes to your configuration.yaml are required.

## Features

- **Remote PiAware Integration:**  
  Configure the remote PiAware host (default: `http://piaware`) via the add-on options. The add-on automatically updates tar1090’s configuration at startup.

- **Automatic Dashboard:**  
  With `"ingress": true` set in the add-on configuration, the tar1090 dashboard is automatically available through Home Assistant’s UI (via the “OPEN WEB UI” button).

- **Easy Maintenance:**  
  The add-on builds on the upstream tar1090 repository, so you can easily pull in updates from active contributors.

## Installation

1. Clone this repository into your Home Assistant add-ons directory.
2. Install the add-on via Home Assistant’s Supervisor panel.
3. Configure the `piaware_host` option if your PiAware instance is located at a different URL.
4. Start the add-on. The tar1090 dashboard will be automatically available through the “OPEN WEB UI” button.

## Updating tar1090

Rebuilding the add-on image will pull in the latest changes from the upstream [tar1090](https://github.com/wiedehopf/tar1090) repository. Always test new builds in a development environment before deploying to production.

## Security & Best Practices

- The add-on follows Home Assistant add-on development best practices, including the use of the S6 overlay for environment variable management.
- By automatically enabling ingress, the add-on minimizes manual configuration errors and improves the user experience.

tar1090-addon/
├── config.json          # Add-on metadata & configuration, including automatic ingress
├── Dockerfile           # Docker build instructions for the add-on container
├── run.sh               # Entrypoint script that updates tar1090’s config and starts the service
├── README.md            # Documentation for users and developers
└── rootfs/              # Optional overlay directory (currently contains a README placeholder)
    └── README.md
