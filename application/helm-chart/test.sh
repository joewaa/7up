#!/bin/sh

#helm install --debug --dry-run test-app . --values=values.yaml \
helm template demo  . \
  --namespace demo \
  --set appProperties."/apps/prod/application-app-prd\.properties"='
  logging.config=config/log4j2.properties
  #eureka.instance.hostname=${HOSTNAME}
  spring.cloud.client.hostname=${HOSTNAME}
  spring.profiles=app-pro
  spring.application.name=api-gateway
  server.port=8080
  ' \
  --set appProperties."/apps/dev/dev\.properites"='
  helloworld
  '  
  # --set volumeMounts[0].name=foo \
  # --set volumeMounts[0].mountPath="/etc/foo" \
  # --set volumeMounts[0].readOnly=true \
  # --set volumes[0].name=foo \
  # --set volumes[0].configMap.name=demo-config \
  
  
  #--set podAnnotations.configchecksum="{{ include (print .Template.BasePath '/configmap.yaml') . | sha256sum | trunc 63 }}"
  
        #{{- if .Values.appProperties }}
        #configchecksum: {{ include (print .Template.BasePath "/configmap.yaml") . | sha256sum | trunc 63 }}
        #{{- end }}