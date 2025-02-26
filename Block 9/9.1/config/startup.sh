#!/bin/bash

# Check if the secrets.yaml exists in the /config directory
if [ ! -f /config/secrets.yaml ]; then
    echo "Copying secrets.yaml to /config"
    cp /config_temp/secrets.yaml /config/secrets.yaml
else
    echo "secrets.yaml already exists in /config"
fi

# Start the Home Assistant service
echo "Starting Home Assistant service..."
exec /init
