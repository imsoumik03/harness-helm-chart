# event-service

![Version: 0.12.0](https://img.shields.io/badge/Version-0.12.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.0.80908](https://img.shields.io/badge/AppVersion-0.0.80908-informational?style=flat-square)

A Helm chart for Kubernetes

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://harness.github.io/helm-common | harness-common | 1.x.x |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| additionalConfigs | object | `{}` |  |
| affinity | object | `{}` |  |
| autoscaling.enabled | bool | `false` |  |
| autoscaling.targetCPU | string | `""` |  |
| autoscaling.targetMemory | string | `""` |  |
| config.DEPLOY_MODE | string | `"KUBERNETES_ONPREM"` |  |
| config.EVEMTS_MONGO_INDEX_MANAGER_MODE | string | `"AUTO"` |  |
| config.LOGGING_LEVEL | string | `"INFO"` |  |
| config.MEMORY | string | `"{{ .Values.java.memory }}"` |  |
| config.MONGO_INDEX_MANAGER_MODE | string | `"AUTO"` |  |
| config.STACK_DRIVER_LOGGING_ENABLED | string | `"{{ .Values.global.stackDriverLoggingEnabled }}"` |  |
| database.mongo.dmsharness.enabled | bool | `false` |  |
| database.mongo.dmsharness.extraArgs | string | `""` |  |
| database.mongo.dmsharness.hosts | list | `[]` |  |
| database.mongo.dmsharness.protocol | string | `""` |  |
| database.mongo.dmsharness.secrets.kubernetesSecrets[0].keys.MONGO_PASSWORD | string | `""` |  |
| database.mongo.dmsharness.secrets.kubernetesSecrets[0].keys.MONGO_USER | string | `""` |  |
| database.mongo.dmsharness.secrets.kubernetesSecrets[0].secretName | string | `""` |  |
| database.mongo.dmsharness.secrets.secretManagement.externalSecretsOperator[0].remoteKeys.MONGO_PASSWORD.name | string | `""` |  |
| database.mongo.dmsharness.secrets.secretManagement.externalSecretsOperator[0].remoteKeys.MONGO_PASSWORD.property | string | `""` |  |
| database.mongo.dmsharness.secrets.secretManagement.externalSecretsOperator[0].remoteKeys.MONGO_USER.name | string | `""` |  |
| database.mongo.dmsharness.secrets.secretManagement.externalSecretsOperator[0].remoteKeys.MONGO_USER.property | string | `""` |  |
| database.mongo.dmsharness.secrets.secretManagement.externalSecretsOperator[0].secretStore.kind | string | `""` |  |
| database.mongo.dmsharness.secrets.secretManagement.externalSecretsOperator[0].secretStore.name | string | `""` |  |
| database.mongo.events.enabled | bool | `false` |  |
| database.mongo.events.extraArgs | string | `""` |  |
| database.mongo.events.hosts | list | `[]` |  |
| database.mongo.events.protocol | string | `""` |  |
| database.mongo.events.secrets.kubernetesSecrets[0].keys.MONGO_PASSWORD | string | `""` |  |
| database.mongo.events.secrets.kubernetesSecrets[0].keys.MONGO_USER | string | `""` |  |
| database.mongo.events.secrets.kubernetesSecrets[0].secretName | string | `""` |  |
| database.mongo.events.secrets.secretManagement.externalSecretsOperator[0].remoteKeys.MONGO_PASSWORD.name | string | `""` |  |
| database.mongo.events.secrets.secretManagement.externalSecretsOperator[0].remoteKeys.MONGO_PASSWORD.property | string | `""` |  |
| database.mongo.events.secrets.secretManagement.externalSecretsOperator[0].remoteKeys.MONGO_USER.name | string | `""` |  |
| database.mongo.events.secrets.secretManagement.externalSecretsOperator[0].remoteKeys.MONGO_USER.property | string | `""` |  |
| database.mongo.events.secrets.secretManagement.externalSecretsOperator[0].secretStore.kind | string | `""` |  |
| database.mongo.events.secrets.secretManagement.externalSecretsOperator[0].secretStore.name | string | `""` |  |
| database.mongo.harness.enabled | bool | `false` |  |
| database.mongo.harness.extraArgs | string | `""` |  |
| database.mongo.harness.hosts | list | `[]` |  |
| database.mongo.harness.protocol | string | `""` |  |
| database.mongo.harness.secrets.kubernetesSecrets[0].keys.MONGO_PASSWORD | string | `""` |  |
| database.mongo.harness.secrets.kubernetesSecrets[0].keys.MONGO_USER | string | `""` |  |
| database.mongo.harness.secrets.kubernetesSecrets[0].secretName | string | `""` |  |
| database.mongo.harness.secrets.secretManagement.externalSecretsOperator[0].remoteKeys.MONGO_PASSWORD.name | string | `""` |  |
| database.mongo.harness.secrets.secretManagement.externalSecretsOperator[0].remoteKeys.MONGO_PASSWORD.property | string | `""` |  |
| database.mongo.harness.secrets.secretManagement.externalSecretsOperator[0].remoteKeys.MONGO_USER.name | string | `""` |  |
| database.mongo.harness.secrets.secretManagement.externalSecretsOperator[0].remoteKeys.MONGO_USER.property | string | `""` |  |
| database.mongo.harness.secrets.secretManagement.externalSecretsOperator[0].secretStore.kind | string | `""` |  |
| database.mongo.harness.secrets.secretManagement.externalSecretsOperator[0].secretStore.name | string | `""` |  |
| defaultInternalImageConnector | string | `"test"` |  |
| extraVolumeMounts | list | `[]` |  |
| extraVolumes | list | `[]` |  |
| fullnameOverride | string | `""` |  |
| global.autoscaling.enabled | bool | `false` |  |
| global.commonAnnotations | object | `{}` |  |
| global.commonLabels | object | `{}` |  |
| global.database.clickhouse.enabled | bool | `false` |  |
| global.database.mongo.extraArgs | string | `""` |  |
| global.database.mongo.hosts | list | `["dummy.net"]` | provide default values if mongo.installed is set to false |
| global.database.mongo.installed | bool | `true` |  |
| global.database.mongo.passwordKey | string | `""` |  |
| global.database.mongo.protocol | string | `"mongodb"` |  |
| global.database.mongo.secretName | string | `""` |  |
| global.database.mongo.secrets.kubernetesSecrets[0].keys.MONGO_PASSWORD | string | `""` |  |
| global.database.mongo.secrets.kubernetesSecrets[0].keys.MONGO_USER | string | `""` |  |
| global.database.mongo.secrets.kubernetesSecrets[0].secretName | string | `""` |  |
| global.database.mongo.secrets.secretManagement.externalSecretsOperator[0].remoteKeys.MONGO_PASSWORD.name | string | `""` |  |
| global.database.mongo.secrets.secretManagement.externalSecretsOperator[0].remoteKeys.MONGO_PASSWORD.property | string | `""` |  |
| global.database.mongo.secrets.secretManagement.externalSecretsOperator[0].remoteKeys.MONGO_USER.name | string | `""` |  |
| global.database.mongo.secrets.secretManagement.externalSecretsOperator[0].remoteKeys.MONGO_USER.property | string | `""` |  |
| global.database.mongo.secrets.secretManagement.externalSecretsOperator[0].secretStore.kind | string | `""` |  |
| global.database.mongo.secrets.secretManagement.externalSecretsOperator[0].secretStore.name | string | `""` |  |
| global.database.mongo.userKey | string | `""` |  |
| global.database.postgres.extraArgs | string | `""` |  |
| global.database.postgres.hosts[0] | string | `"postgres:5432"` |  |
| global.database.postgres.installed | bool | `true` |  |
| global.database.postgres.passwordKey | string | `""` |  |
| global.database.postgres.protocol | string | `"postgres"` |  |
| global.database.postgres.secretName | string | `""` |  |
| global.database.postgres.userKey | string | `""` |  |
| global.database.timescaledb.extraArgs | string | `""` |  |
| global.database.timescaledb.hosts | list | `["timescaledb-single-chart:5432"]` | provide default values if mongo.installed is set to false |
| global.database.timescaledb.installed | bool | `true` |  |
| global.database.timescaledb.passwordKey | string | `""` |  |
| global.database.timescaledb.protocol | string | `"jdbc:postgresql"` |  |
| global.database.timescaledb.secretName | string | `""` |  |
| global.database.timescaledb.userKey | string | `""` |  |
| global.fileLogging.enabled | bool | `false` |  |
| global.fileLogging.logFilename | string | `"/opt/harness/logs/pod.log"` |  |
| global.fileLogging.maxBackupFileCount | int | `10` |  |
| global.fileLogging.maxFileSize | string | `"50MB"` |  |
| global.fileLogging.totalFileSizeCap | string | `"1GB"` |  |
| global.imagePullSecrets | list | `[]` |  |
| global.ingress.className | string | `"harness"` |  |
| global.ingress.disableHostInIngress | bool | `false` |  |
| global.ingress.enabled | bool | `false` |  |
| global.ingress.hosts[0] | string | `"events-grpc-app.harness.io"` |  |
| global.ingress.objects.annotations | object | `{}` |  |
| global.ingress.pathPrefix | string | `""` |  |
| global.ingress.pathType | string | `""` |  |
| global.ingress.tls.enabled | bool | `true` |  |
| global.ingress.tls.secretName | string | `""` |  |
| global.istio.enabled | bool | `false` |  |
| global.istio.gateway.create | bool | `false` |  |
| global.istio.virtualService.gateways | string | `nil` |  |
| global.istio.virtualService.hosts | string | `nil` |  |
| global.loadbalancerURL | string | `"https://test"` |  |
| global.monitoring.enabled | bool | `false` |  |
| global.monitoring.managedPlatform | string | `""` |  |
| global.monitoring.path | string | `"/metrics"` |  |
| global.monitoring.port | int | `8889` |  |
| global.stackDriverLoggingEnabled | bool | `false` |  |
| global.waitForInitContainer.enabled | bool | `true` |  |
| global.waitForInitContainer.image.digest | string | `""` |  |
| global.waitForInitContainer.image.imagePullSecrets | list | `[]` |  |
| global.waitForInitContainer.image.pullPolicy | string | `"Always"` |  |
| global.waitForInitContainer.image.registry | string | `"docker.io"` |  |
| global.waitForInitContainer.image.repository | string | `"harness/helm-init-container"` |  |
| global.waitForInitContainer.image.tag | string | `"latest"` |  |
| image.digest | string | `""` |  |
| image.imagePullSecrets | list | `[]` |  |
| image.pullPolicy | string | `"Always"` |  |
| image.registry | string | `"docker.io"` |  |
| image.repository | string | `"harness/event-service-signed"` |  |
| image.tag | string | `"80908-000"` |  |
| ingress.annotations | object | `{}` |  |
| ingress.className | string | `"nginx"` |  |
| ingress.objects[0].annotations."nginx.ingress.kubernetes.io/rewrite-target" | string | `"/ccmevent$1$2"` |  |
| ingress.objects[0].annotations."nginx.ingress.kubernetes.io/use-regex" | string | `"true"` |  |
| ingress.objects[0].paths[0].path | string | `"{{ .Values.global.ingress.pathPrefix }}/ccmevent(/|$)(.*)"` |  |
| java.memory | int | `1024` |  |
| java17flags | string | `"--illegal-access=debug --add-opens java.base/java.lang=ALL-UNNAMED --add-opens java.base/java.util=ALL-UNNAMED --add-opens java.base/java.nio=ALL-UNNAMED --add-opens java.base/java.util.concurrent.atomic=ALL-UNNAMED --add-opens java.base/java.time=ALL-UNNAMED --add-opens java.base/java.io=ALL-UNNAMED --add-opens java.base/java.lang.invoke=ALL-UNNAMED --add-opens java.base/java.math=ALL-UNNAMED --add-opens java.base/java.nio.file=ALL-UNNAMED --add-opens java.base/java.util.concurrent=ALL-UNNAMED --add-opens java.xml/com.sun.org.apache.xpath.internal=ALL-UNNAMED --add-opens=java.base/java.lang.reflect=ALL-UNNAMED --add-opens java.base/java.text=ALL-UNNAMED --add-exports java.xml/com.sun.org.apache.xerces.internal.parsers=ALL-UNNAMED --add-exports java.base/sun.nio.ch=ALL-UNNAMED"` |  |
| lifecycleHooks | object | `{}` |  |
| maxSurge | string | `"100%"` |  |
| maxUnavailable | int | `0` |  |
| nameOverride | string | `""` |  |
| ngServiceAccount | string | `"test"` |  |
| nodeSelector | object | `{}` |  |
| podAnnotations | object | `{}` |  |
| podSecurityContext | object | `{}` |  |
| rbac.rules | list | `[]` |  |
| redislabsCATruststore | string | `"test"` |  |
| replicaCount | int | `1` |  |
| resources.limits.memory | string | `"1840Mi"` |  |
| resources.requests.cpu | string | `"512m"` |  |
| resources.requests.memory | string | `"1840Mi"` |  |
| securityContext | object | `{}` |  |
| service.annotations | object | `{}` |  |
| service.port | int | `7280` |  |
| service.port2 | int | `9889` |  |
| service.type | string | `"ClusterIP"` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.create | bool | `false` |  |
| serviceAccount.name | string | `"harness-default"` |  |
| timescaledb.enabled | bool | `false` |  |
| timescaledb.hosts | list | `[]` | TimescaleDB host names |
| timescaledb.secrets | object | `{"kubernetesSecrets":[{"keys":{"TIMESCALEDB_PASSWORD":"","TIMESCALEDB_SSL_ROOT_CERT":"","TIMESCALEDB_USERNAME":""},"secretName":""}],"secretManagement":{"externalSecretsOperator":[{"remoteKeys":{"TIMESCALEDB_PASSWORD":{"name":"","property":""},"TIMESCALEDB_SSL_ROOT_CERT":{"name":"","property":""},"TIMESCALEDB_USERNAME":{"name":"","property":""}},"secretStore":{"kind":"","name":""}}]}}` | TimescaleDB secrets |
| tolerations | list | `[]` |  |
| virtualService.annotations | object | `{}` |  |
| virtualService.objects[0].pathMatchType | string | `"prefix"` |  |
| virtualService.objects[0].pathRewrite | string | `"/ccmevent"` |  |
| virtualService.objects[0].paths[0].path | string | `"{{ .Values.global.istio.virtualService.pathPrefix }}/ccmevent"` |  |
| virtualService.objects[0].paths[1].path | string | `"{{ .Values.global.istio.virtualService.pathPrefix }}/ccmevent/"` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.11.3](https://github.com/norwoodj/helm-docs/releases/v1.11.3)
