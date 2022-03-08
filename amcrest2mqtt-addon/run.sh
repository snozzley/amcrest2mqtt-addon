#!/usr/bin/env bashio

#set environment variables
export AMCREST_HOST=$(bashio::config 'amcrest_host')
export AMCREST_PORT=$(bashio::config 'amcrest_port')
export AMCREST_USERNAME=$(bashio::config 'amcrest_username')
export AMCREST_PASSWORD=$(bashio::config 'amcrest_password')
export STORAGE_POLL_INTERVAL=$(bashio::config 'storage_poll_interval')
export DEVICE_NAME=$(bashio::config 'device_name')
export HOME_ASSISTANT=$(bashio::config 'home_assistant')
export HOME_ASSISTANT_PREFIX=$(bashio::config 'home_assistant_prefix')

# MQTT auto configuration
if bashio::services.available "mqtt"; then
    export MQTT_HOST=$(bashio::services "mqtt" "host")
    export MQTT_PASSWORD=$(bashio::services "mqtt" "password")
    export MQTT_PORT=$(bashio::services "mqtt" "port")
    export MQTT_USERNAME=$(bashio::services "mqtt" "username")
else
    bashio::log.warning "MQTT service not available, please ensure the MQTT Broken addon is installed and configured"
fi

cd /amcrest2mqtt/
exec /usr/bin/python3 -u src/amcrest2mqtt.py