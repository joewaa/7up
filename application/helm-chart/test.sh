#!/bin/sh

#helm install --debug --dry-run test-app . \
helm template . \
  --namespace demo \
  --set volumeMounts[0].name=foo \
  --set volumeMounts[0].mountPath="/etc/foo" \
  --set volumeMounts[0].readOnly=true \
  --set volumes[0].name=foo \
  --set volumes[0].configMap.name=mychart-configmap \
  --set containerConfig."application-app-prd\.properties"='
  logging.config=config/log4j2.properties
  #eureka.instance.hostname=${HOSTNAME}
  spring.cloud.client.hostname=${HOSTNAME}
  spring.profiles=app-pro
  spring.application.name=api-gateway
  server.port=8080
  ' \
  
  