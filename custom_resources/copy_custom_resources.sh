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

  cp /mnt/config/geoserver-config.xml "${GEOSERVER_DATA_DIR}"/security/auth/aurin-geoserver-auth/config.xml
  cp /mnt/config/config.xml "${GEOSERVER_DATA_DIR}"/security/config.xml
  cp /mnt/config/monitor.properties "${GEOSERVER_DATA_DIR}"/monitoring/monitor.properties
  cp /mnt/config/content.ftl "${GEOSERVER_DATA_DIR}"/monitoring/content.ftl

#  sed -i "s#AURIN_GEOSERVER_AUTHZ_SERVICE#${AURIN_GEOSERVER_AUTHZ_SERVICE}#g" "${GEOSERVER_DATA_DIR}"/security/auth/aurin-geoserver-auth/config.xml
fi
