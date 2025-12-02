#!/command/with-contenv bashio
# vim: ft=bash
# shellcheck shell=bash

set -e


# Check required configuration
if ! bashio::config.has_value 'controller.serial' || ! bashio::config.has_value 'controller.pin'; then
    bashio::log.error "Controller serial and pin are required."
    exit 1
fi

if ! bashio::config.has_value 'controller.username' || ! bashio::config.has_value 'controller.password'; then
    bashio::log.error "Controller username and password are required."
    exit 1
fi

# Run node application
exec node /app/bundle.js