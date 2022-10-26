#!/bin/bash

# Credits https://github.com/geosolutions-it/docker-geoserver for this script that allows a user to pass a password
# or username on runtime.

# Source the functions from other bash scripts

source /scripts/env-data.sh

if [ -e "${GEOSERVER_DATA_DIR}"/security/auth/aurin-geoserver-auth/config.xml ]
then
  echo "Web Auth Plugin Already Configured"
else
  mkdir -p "${GEOSERVER_DATA_DIR}"/security/auth/aurin-geoserver-auth

  cp /custom_resuorces/geoserver-config.xml "${GEOSERVER_DATA_DIR}"/security/auth/aurin-geoserver-auth/config.xml
  cp /custom_resuorces/config.xml "${GEOSERVER_DATA_DIR}"/security/config.xml
  cp /custom_resuorces/monitor.properties "${GEOSERVER_DATA_DIR}"/monitoring/monitor.properties
  cp /custom_resuorces/content.ftl "${GEOSERVER_DATA_DIR}"/monitoring/content.ftl

#  sed -i "s#AURIN_GEOSERVER_AUTHZ_SERVICE#${AURIN_GEOSERVER_AUTHZ_SERVICE}#g" "${GEOSERVER_DATA_DIR}"/security/auth/aurin-geoserver-auth/config.xml
fi
