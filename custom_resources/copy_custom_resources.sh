if [ -e "${GEOSERVER_DATA_DIR}"/security/auth/aurin-geoserver-auth/config.xml ]
then
  echo "Web Auth Plugin Already Configured"
else
  mkdir -p "${GEOSERVER_DATA_DIR}"/security/auth/aurin-geoserver-auth

  cp /custom_resources/web-auth-plugin/geoserver-auth/config.xml "${GEOSERVER_DATA_DIR}"/security/auth/aurin-geoserver-auth/config.xml
  cp /custom_resources/web-auth-plugin/config.xml "${GEOSERVER_DATA_DIR}"/security/config.xml
  cp /custom_resources/config/monitor.properties "${GEOSERVER_DATA_DIR}"/monitoring/monitor.properties
  cp /custom_resources/config/content.ftl "${GEOSERVER_DATA_DIR}"/monitoring/content.ftl

  sed -i "s#AURIN_GEOSERVER_AUTHZ_SERVICE#${AURIN_GEOSERVER_AUTHZ_SERVICE}#g" "${GEOSERVER_DATA_DIR}"/security/auth/aurin-geoserver-auth/config.xml
fi
