#!/usr/bin/with-contenv bash
set -e

# Retrieve the remote PiAware host from environment variables (default: http://piaware)
PIAWARE_HOST=${PIAWARE_HOST:-"http://piaware"}

echo "Starting Tar1090 Add-on..."
echo "Using PiAware host: ${PIAWARE_HOST}"

# Define the path to tar1090's configuration file that requires updating
CONFIG_FILE="/app/tar1090/config.js"

# Update tar1090 configuration with the remote PiAware host if the file exists
if [ -f "$CONFIG_FILE" ]; then
    echo "Updating tar1090 configuration to use remote PiAware..."
    sed -i "s|http://localhost|${PIAWARE_HOST}|g" "$CONFIG_FILE"
else
    echo "Warning: $CONFIG_FILE not found. Skipping configuration update."
fi

# Change directory to tar1090 and start the service
cd /app/tar1090
exec npm start
