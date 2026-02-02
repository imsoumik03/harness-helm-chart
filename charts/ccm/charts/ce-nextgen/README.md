# ce-nextgen

![Version: 2.13.3](https://img.shields.io/badge/Version-2.13.3-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.0.81904](https://img.shields.io/badge/AppVersion-0.0.81904-informational?style=flat-square)

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
| autoscaling.maxReplicas | int | `100` |  |
| autoscaling.minReplicas | int | `2` |  |
| autoscaling.targetCPU | string | `""` |  |
| autoscaling.targetMemory | string | `""` |  |
| ceng-gcp-credentials | string | `""` |  |
| clickhouse.password.key | string | `"admin-password"` |  |
| clickhouse.password.name | string | `"clickhouse"` |  |
| clickhouse.username | string | `"default"` |  |
| cloudProviderConfig.AWS_GOV_CLOUD_ACCOUNT_ID | string | `"147449478367"` |  |
| cloudProviderConfig.AWS_GOV_CLOUD_REGION_NAME | string | `"us-gov-west-1"` |  |
| cloudProviderConfig.AWS_GOV_CLOUD_TEMPLATE_LINK | string | `"https://continuous-efficiency.s3.us-east-2.amazonaws.com/setup/v1/ng/HarnessAWSTemplate.yaml"` |  |
| cloudProviderConfig.AWS_TEMPLATE_LINK | string | `"https://continuous-efficiency.s3.us-east-2.amazonaws.com/setup/v1/ng/HarnessAWSTemplate.yaml"` |  |
| cloudProviderConfig.AZURE_APP_CLIENT_ID | string | `"0211763d-24fb-4d63-865d-92f86f77e908"` |  |
| cloudProviderConfig.GCP_SERVICE_ACCOUNT_EMAIL | string | `"placeHolder"` |  |
| config.ACCESS_CONTROL_BASE_URL | string | `"http://access-control.{{ .Release.Namespace }}.svc.cluster.local:9006/api/"` |  |
| config.ACCESS_CONTROL_ENABLED | string | `"true"` |  |
| config.AUDIT_CLIENT_BASEURL | string | `"http://platform-service.{{ .Release.Namespace }}.svc.cluster.local:9005/api/"` |  |
| config.AUDIT_ENABLED | string | `"true"` |  |
| config.AWS_DESTINATION_BUCKET | string | `"customer-billing-data-dev"` |  |
| config.AWS_DESTINATION_BUCKET_COUNT | string | `"3"` |  |
| config.AWS_GOV_CLOUD_ACCOUNT_ID | string | `"{{ .Values.cloudProviderConfig.AWS_GOV_CLOUD_ACCOUNT_ID }}"` |  |
| config.AWS_GOV_CLOUD_REGION_NAME | string | `"{{ .Values.cloudProviderConfig.AWS_GOV_CLOUD_REGION_NAME }}"` |  |
| config.AWS_GOV_CLOUD_TEMPLATE_LINK | string | `"{{ .Values.cloudProviderConfig.AWS_GOV_CLOUD_TEMPLATE_LINK }}"` |  |
| config.AWS_TEMPLATE_LINK | string | `"{{ .Values.cloudProviderConfig.AWS_TEMPLATE_LINK }}"` |  |
| config.AZURE_APP_CLIENT_ID | string | `"{{ .Values.cloudProviderConfig.AZURE_APP_CLIENT_ID }}"` |  |
| config.AZURE_ENABLE_FILE_CHECK_AT_SOURCE | string | `"true"` |  |
| config.CE_AWS_TEMPLATE_URL | string | `""` |  |
| config.CE_NEXTGEN_PORT | string | `"{{ .Values.service.port }}"` |  |
| config.CLICKHOUSE_ENABLED | string | `"{{ .Values.global.database.clickhouse.enabled }}"` |  |
| config.DEPLOY_MODE | string | `"KUBERNETES_ONPREM"` |  |
| config.DISTRIBUTED_LOCK_IMPLEMENTATION | string | `"{{ .Values.distributedLockImplementation }}"` |  |
| config.DKRON_CLIENT_BASEURL | string | `"http://dkron:8080"` |  |
| config.ENABLE_APPDYNAMICS | string | `"false"` |  |
| config.ENABLE_LIGHTWING_AUTOCUD_DC | string | `"false"` |  |
| config.EVENTS_FRAMEWORK_AVAILABLE_IN_ONPREM | string | `"true"` |  |
| config.EVENTS_FRAMEWORK_ENV_NAMESPACE | string | `""` |  |
| config.EVENTS_FRAMEWORK_REDIS_SENTINELS | string | `"{{ include \"harnesscommon.dbv3.redisConnection\" (dict \"ctx\" $ \"database\" \"events\") }}"` |  |
| config.EVENTS_FRAMEWORK_REDIS_URL | string | `"{{ include \"harnesscommon.dbv3.redisConnection\" (dict \"ctx\" $ \"database\" \"events\") }}"` |  |
| config.EVENTS_FRAMEWORK_SENTINEL_MASTER_NAME | string | `"harness-redis"` |  |
| config.EVENTS_FRAMEWORK_USE_SENTINEL | string | `"{{ .Values.global.database.redis.installed }}"` |  |
| config.EVENTS_MONGO_INDEX_MANAGER_MODE | string | `"AUTO"` |  |
| config.FEATURE_FLAG_SYSTEM | string | `"LOCAL"` |  |
| config.GCP_PROJECT_ID | string | `"{{ .Values.global.ccm.gcpProjectId }}"` |  |
| config.GCP_SERVICE_ACCOUNT_EMAIL | string | `"{{ .Values.cloudProviderConfig.GCP_SERVICE_ACCOUNT_EMAIL }}"` |  |
| config.GOVERNANCE_CALLBACK_API_ENDPOINT | string | `"http://nextgen-ce.{{ .Release.Namespace }}.svc.cluster.local:6340/ccm/api/governance/enqueue"` |  |
| config.GOVERNANCE_OOTB_ACCOUNT | string | `"{{ .Values.governance.ootbAccount }}"` |  |
| config.INTERNAL_MANAGER_AUTHORITY | string | `"harness-manager:9879"` |  |
| config.INTERNAL_MANAGER_TARGET | string | `"harness-manager:9879"` |  |
| config.LIGHTWING_AUTOCUD_CLIENT_CONFIG_BASEURL | string | `"http://lwd.{{ .Release.Namespace }}.svc.cluster.local:9090"` |  |
| config.LOCK_CONFIG_REDIS_SENTINELS | string | `"{{ include \"harnesscommon.dbv3.redisConnection\" (dict \"ctx\" $ \"database\" \"lock\") }}"` |  |
| config.LOCK_CONFIG_REDIS_URL | string | `"{{ include \"harnesscommon.dbv3.redisConnection\" (dict \"ctx\" $ \"database\" \"lock\") }}"` |  |
| config.LOCK_CONFIG_SENTINEL_MASTER_NAME | string | `"harness-redis"` |  |
| config.LOCK_CONFIG_USE_SENTINEL | string | `"{{ .Values.global.database.redis.installed }}"` |  |
| config.LOGGING_LEVEL | string | `"INFO"` |  |
| config.MANAGER_AUTHORITY | string | `"harness-manager:9879"` |  |
| config.MANAGER_CLIENT_BASEURL | string | `"http://harness-manager.{{ .Release.Namespace }}.svc.cluster.local:9090/api/"` |  |
| config.MANAGER_TARGET | string | `"harness-manager:9879"` |  |
| config.MANAGER_URL | string | `"http://harness-manager.{{ .Release.Namespace }}.svc.cluster.local:9090/api/"` |  |
| config.MEMORY | string | `"{{ .Values.java.memory }}"` |  |
| config.MOCK_ACCESS_CONTROL_SERVICE | string | `"false"` |  |
| config.NG_MANAGER_CLIENT_BASEURL | string | `"http://ng-manager.{{ .Release.Namespace }}.svc.cluster.local:7090/"` |  |
| config.NOTIFICATION_BASE_URL | string | `"http://platform-service.{{ .Release.Namespace }}.svc.cluster.local:9005/api/"` |  |
| config.SEGMENT_ENABLED | string | `"false"` |  |
| config.STACK_DRIVER_LOGGING_ENABLED | string | `"{{ .Values.global.stackDriverLoggingEnabled }}"` |  |
| config.USE_WORKLOAD_IDENTITY | string | `"{{ .Values.workloadIdentity.enabled }}"` |  |
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
| database.mongo.notifications.enabled | bool | `false` |  |
| database.mongo.notifications.extraArgs | string | `""` |  |
| database.mongo.notifications.hosts | list | `[]` |  |
| database.mongo.notifications.protocol | string | `""` |  |
| database.mongo.notifications.secrets.kubernetesSecrets[0].keys.MONGO_PASSWORD | string | `""` |  |
| database.mongo.notifications.secrets.kubernetesSecrets[0].keys.MONGO_USER | string | `""` |  |
| database.mongo.notifications.secrets.kubernetesSecrets[0].secretName | string | `""` |  |
| database.mongo.notifications.secrets.secretManagement.externalSecretsOperator[0].remoteKeys.MONGO_PASSWORD.name | string | `""` |  |
| database.mongo.notifications.secrets.secretManagement.externalSecretsOperator[0].remoteKeys.MONGO_PASSWORD.property | string | `""` |  |
| database.mongo.notifications.secrets.secretManagement.externalSecretsOperator[0].remoteKeys.MONGO_USER.name | string | `""` |  |
| database.mongo.notifications.secrets.secretManagement.externalSecretsOperator[0].remoteKeys.MONGO_USER.property | string | `""` |  |
| database.mongo.notifications.secrets.secretManagement.externalSecretsOperator[0].secretStore.kind | string | `""` |  |
| database.mongo.notifications.secrets.secretManagement.externalSecretsOperator[0].secretStore.name | string | `""` |  |
| database.redis.events.extraArgs | string | `""` |  |
| database.redis.events.hosts | list | `[]` |  |
| database.redis.events.protocol | string | `""` |  |
| database.redis.events.secrets.kubernetesSecrets[0].keys.REDIS_PASSWORD | string | `""` |  |
| database.redis.events.secrets.kubernetesSecrets[0].keys.REDIS_USERNAME | string | `""` |  |
| database.redis.events.secrets.kubernetesSecrets[0].secretName | string | `""` |  |
| database.redis.events.secrets.secretManagement.externalSecretsOperator[0].remoteKeys.REDIS_PASSWORD.name | string | `""` |  |
| database.redis.events.secrets.secretManagement.externalSecretsOperator[0].remoteKeys.REDIS_PASSWORD.property | string | `""` |  |
| database.redis.events.secrets.secretManagement.externalSecretsOperator[0].remoteKeys.REDIS_USERNAME.name | string | `""` |  |
| database.redis.events.secrets.secretManagement.externalSecretsOperator[0].remoteKeys.REDIS_USERNAME.property | string | `""` |  |
| database.redis.events.secrets.secretManagement.externalSecretsOperator[0].secretStore.kind | string | `""` |  |
| database.redis.events.secrets.secretManagement.externalSecretsOperator[0].secretStore.name | string | `""` |  |
| database.redis.events.ssl.caFileKey | string | `""` |  |
| database.redis.events.ssl.enabled | bool | `false` |  |
| database.redis.events.ssl.secret | string | `""` |  |
| database.redis.events.ssl.trustStoreKey | string | `""` |  |
| database.redis.events.ssl.trustStorePasswordKey | string | `""` |  |
| database.redis.lock.extraArgs | string | `""` |  |
| database.redis.lock.hosts | list | `[]` |  |
| database.redis.lock.protocol | string | `""` |  |
| database.redis.lock.secrets.kubernetesSecrets[0].keys.REDIS_PASSWORD | string | `""` |  |
| database.redis.lock.secrets.kubernetesSecrets[0].keys.REDIS_USERNAME | string | `""` |  |
| database.redis.lock.secrets.kubernetesSecrets[0].secretName | string | `""` |  |
| database.redis.lock.secrets.secretManagement.externalSecretsOperator[0].remoteKeys.REDIS_PASSWORD.name | string | `""` |  |
| database.redis.lock.secrets.secretManagement.externalSecretsOperator[0].remoteKeys.REDIS_PASSWORD.property | string | `""` |  |
| database.redis.lock.secrets.secretManagement.externalSecretsOperator[0].remoteKeys.REDIS_USERNAME.name | string | `""` |  |
| database.redis.lock.secrets.secretManagement.externalSecretsOperator[0].remoteKeys.REDIS_USERNAME.property | string | `""` |  |
| database.redis.lock.secrets.secretManagement.externalSecretsOperator[0].secretStore.kind | string | `""` |  |
| database.redis.lock.secrets.secretManagement.externalSecretsOperator[0].secretStore.name | string | `""` |  |
| database.redis.lock.ssl.caFileKey | string | `""` |  |
| database.redis.lock.ssl.enabled | bool | `false` |  |
| database.redis.lock.ssl.secret | string | `""` |  |
| database.redis.lock.ssl.trustStoreKey | string | `""` |  |
| database.redis.lock.ssl.trustStorePasswordKey | string | `""` |  |
| distributedLockImplementation | string | `"REDIS"` |  |
| extraVolumeMounts | list | `[]` |  |
| extraVolumes | list | `[]` |  |
| fullnameOverride | string | `""` |  |
| global.awsServiceEndpointUrls.cloudwatchEndPointUrl | string | `"https://monitoring.us-east-2.amazonaws.com"` |  |
| global.awsServiceEndpointUrls.ecsEndPointUrl | string | `"https://ecs.us-east-2.amazonaws.com"` |  |
| global.awsServiceEndpointUrls.enabled | bool | `false` |  |
| global.awsServiceEndpointUrls.endPointRegion | string | `"us-east-2"` |  |
| global.awsServiceEndpointUrls.stsEndPointUrl | string | `"https://sts.us-east-2.amazonaws.com"` |  |
| global.ccm.gcpProjectId | string | `"placeHolder"` |  |
| global.ccm.governance.enabled | bool | `false` |  |
| global.commonAnnotations | object | `{}` |  |
| global.commonLabels | object | `{}` |  |
| global.database.clickhouse.enabled | bool | `false` |  |
| global.database.clickhouse.secrets.kubernetesSecrets[0].keys.CLICKHOUSE_PASSWORD | string | `""` |  |
| global.database.clickhouse.secrets.kubernetesSecrets[0].keys.CLICKHOUSE_USERNAME | string | `""` |  |
| global.database.clickhouse.secrets.kubernetesSecrets[0].secretName | string | `""` |  |
| global.database.clickhouse.secrets.secretManagement.externalSecretsOperator[0].remoteKeys.CLICKHOUSE_PASSWORD.name | string | `""` |  |
| global.database.clickhouse.secrets.secretManagement.externalSecretsOperator[0].remoteKeys.CLICKHOUSE_PASSWORD.property | string | `""` |  |
| global.database.clickhouse.secrets.secretManagement.externalSecretsOperator[0].remoteKeys.CLICKHOUSE_USERNAME.name | string | `""` |  |
| global.database.clickhouse.secrets.secretManagement.externalSecretsOperator[0].remoteKeys.CLICKHOUSE_USERNAME.property | string | `""` |  |
| global.database.clickhouse.secrets.secretManagement.externalSecretsOperator[0].secretStore.kind | string | `""` |  |
| global.database.clickhouse.secrets.secretManagement.externalSecretsOperator[0].secretStore.name | string | `""` |  |
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
| global.database.redis.extraArgs | string | `""` |  |
| global.database.redis.hosts | list | `["redis:6379"]` | provide default values if redis.installed is set to false |
| global.database.redis.installed | bool | `true` |  |
| global.database.redis.passwordKey | string | `"redis-password"` |  |
| global.database.redis.protocol | string | `"redis"` |  |
| global.database.redis.secretName | string | `"redis-secret"` |  |
| global.database.redis.secrets.kubernetesSecrets[0].keys.REDIS_PASSWORD | string | `""` |  |
| global.database.redis.secrets.kubernetesSecrets[0].keys.REDIS_USERNAME | string | `""` |  |
| global.database.redis.secrets.kubernetesSecrets[0].secretName | string | `""` |  |
| global.database.redis.secrets.secretManagement.externalSecretsOperator[0].remoteKeys.REDIS_PASSWORD.name | string | `""` |  |
| global.database.redis.secrets.secretManagement.externalSecretsOperator[0].remoteKeys.REDIS_PASSWORD.property | string | `""` |  |
| global.database.redis.secrets.secretManagement.externalSecretsOperator[0].remoteKeys.REDIS_USERNAME.name | string | `""` |  |
| global.database.redis.secrets.secretManagement.externalSecretsOperator[0].remoteKeys.REDIS_USERNAME.property | string | `""` |  |
| global.database.redis.secrets.secretManagement.externalSecretsOperator[0].secretStore.kind | string | `""` |  |
| global.database.redis.secrets.secretManagement.externalSecretsOperator[0].secretStore.name | string | `""` |  |
| global.database.redis.ssl.caFileKey | string | `""` |  |
| global.database.redis.ssl.enabled | bool | `false` |  |
| global.database.redis.ssl.secret | string | `""` |  |
| global.database.redis.ssl.trustStoreKey | string | `""` |  |
| global.database.redis.ssl.trustStorePasswordKey | string | `""` |  |
| global.database.redis.userKey | string | `"redis-user"` |  |
| global.database.timescaledb.certKey | string | `""` |  |
| global.database.timescaledb.certName | string | `""` |  |
| global.database.timescaledb.extraArgs | string | `""` |  |
| global.database.timescaledb.hosts | list | `["timescaledb-single-chart:5432"]` | provide default values if mongo.installed is set to false |
| global.database.timescaledb.installed | bool | `true` |  |
| global.database.timescaledb.passwordKey | string | `""` |  |
| global.database.timescaledb.protocol | string | `"jdbc:postgresql"` |  |
| global.database.timescaledb.secretName | string | `""` |  |
| global.database.timescaledb.secrets | object | `{"kubernetesSecrets":[{"keys":{"TIMESCALEDB_PASSWORD":"","TIMESCALEDB_SSL_ROOT_CERT":"","TIMESCALEDB_USERNAME":""},"secretName":""}],"secretManagement":{"externalSecretsOperator":[{"remoteKeys":{"TIMESCALEDB_PASSWORD":{"name":"","property":""},"TIMESCALEDB_SSL_ROOT_CERT":{"name":"","property":""},"TIMESCALEDB_USERNAME":{"name":"","property":""}},"secretStore":{"kind":"","name":""}}]}}` | TimescaleDB secrets |
| global.database.timescaledb.sslEnabled | bool | `false` | Enable TimescaleDB SSL |
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
| global.ingress.hosts[0] | string | `"my-host.example.org"` |  |
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
| global.pdb.create | bool | `false` |  |
| global.proxy.enabled | bool | `false` |  |
| global.proxy.host | string | `"localhost"` |  |
| global.proxy.password | string | `""` |  |
| global.proxy.port | int | `80` |  |
| global.proxy.protocol | string | `"http"` |  |
| global.proxy.username | string | `""` |  |
| global.stackDriverLoggingEnabled | bool | `false` |  |
| global.waitForInitContainer.enabled | bool | `true` |  |
| global.waitForInitContainer.image.digest | string | `""` |  |
| global.waitForInitContainer.image.imagePullSecrets | list | `[]` |  |
| global.waitForInitContainer.image.pullPolicy | string | `"Always"` |  |
| global.waitForInitContainer.image.registry | string | `"docker.io"` |  |
| global.waitForInitContainer.image.repository | string | `"harness/helm-init-container"` |  |
| global.waitForInitContainer.image.tag | string | `"latest"` |  |
| governance.ootbAccount | string | `"kmpySmUISimoRrJL6NL73w"` |  |
| image.digest | string | `""` |  |
| image.imagePullSecrets | list | `[]` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.registry | string | `"docker.io"` |  |
| image.repository | string | `"harness/ce-nextgen-signed"` |  |
| image.tag | string | `"81904-000"` |  |
| ingress.annotations | object | `{}` |  |
| ingress.className | string | `"nginx"` |  |
| ingress.objects[0].annotations."nginx.ingress.kubernetes.io/rewrite-target" | string | `"/ccm/api$1$2"` |  |
| ingress.objects[0].annotations."nginx.ingress.kubernetes.io/use-regex" | string | `"true"` |  |
| ingress.objects[0].paths[0].backend.service.name | string | `"nextgen-ce"` |  |
| ingress.objects[0].paths[0].path | string | `"{{ .Values.global.ingress.pathPrefix }}/ccm/api(/|$)(.*)"` |  |
| java.memory | string | `"4096m"` |  |
| java.memoryLimit | string | `"4096m"` |  |
| java17flags | string | `"--illegal-access=debug --add-opens java.base/java.lang=ALL-UNNAMED --add-opens java.base/java.util=ALL-UNNAMED --add-opens java.base/java.nio=ALL-UNNAMED --add-opens java.base/java.util.concurrent.atomic=ALL-UNNAMED --add-opens java.base/java.time=ALL-UNNAMED --add-opens java.base/java.io=ALL-UNNAMED --add-opens java.base/java.lang.invoke=ALL-UNNAMED --add-opens java.base/java.math=ALL-UNNAMED --add-opens java.base/java.nio.file=ALL-UNNAMED --add-opens java.base/java.util.concurrent=ALL-UNNAMED --add-opens java.xml/com.sun.org.apache.xpath.internal=ALL-UNNAMED --add-opens=java.base/java.lang.reflect=ALL-UNNAMED --add-opens java.base/java.text=ALL-UNNAMED --add-exports java.xml/com.sun.org.apache.xerces.internal.parsers=ALL-UNNAMED --add-exports java.base/sun.nio.ch=ALL-UNNAMED"` |  |
| lifecycleHooks | object | `{}` |  |
| maxSurge | string | `"100%"` |  |
| maxUnavailable | int | `0` |  |
| nameOverride | string | `"nextgen-ce"` |  |
| nodeSelector | object | `{}` |  |
| pdb.create | bool | `false` |  |
| podAnnotations | object | `{}` |  |
| podSecurityContext | object | `{}` |  |
| probes.livenessProbe.failureThreshold | int | `10` |  |
| probes.livenessProbe.httpGet.path | string | `"/ccm/api/health"` |  |
| probes.livenessProbe.httpGet.port | int | `6340` |  |
| probes.livenessProbe.initialDelaySeconds | int | `30` |  |
| probes.livenessProbe.periodSeconds | int | `15` |  |
| probes.readinessProbe.failureThreshold | int | `10` |  |
| probes.readinessProbe.httpGet.path | string | `"/ccm/api/health"` |  |
| probes.readinessProbe.httpGet.port | int | `6340` |  |
| probes.readinessProbe.initialDelaySeconds | int | `30` |  |
| probes.readinessProbe.periodSeconds | int | `15` |  |
| rbac.rules | list | `[]` |  |
| replicaCount | int | `1` |  |
| resources.limits.memory | string | `"4Gi"` |  |
| resources.requests.cpu | int | `1` |  |
| resources.requests.memory | string | `"4Gi"` |  |
| secondaryTimescaledb.hosts | list | `[]` | TimescaleDB host names |
| secondaryTimescaledb.protocol | string | `"jdbc:postgresql2312321"` |  |
| secondaryTimescaledb.secrets | object | `{"kubernetesSecrets":[{"keys":{"TIMESCALEDB_PASSWORD":"","TIMESCALEDB_SSL_ROOT_CERT":"","TIMESCALEDB_USERNAME":""},"secretName":""}],"secretManagement":{"externalSecretsOperator":[{"remoteKeys":{"TIMESCALEDB_PASSWORD":{"name":"","property":""},"TIMESCALEDB_SSL_ROOT_CERT":{"name":"","property":""},"TIMESCALEDB_USERNAME":{"name":"","property":""}},"secretStore":{"kind":"","name":""}}]}}` | TimescaleDB secrets |
| secrets.conditions.CENG_GCP_CREDENTIALS | string | `"secretsFromHelper.disabled"` |  |
| secrets.conditions.FAKTORY_PASSWORD | string | `"global.ccm.governance.enabled"` |  |
| secrets.default.ACCESS_CONTROL_SECRET | string | `"IC04LYMBf1lDP5oeY4hupxd4HJhLmN6azUku3xEbeE3SUx5G3ZYzhbiwVtK4i7AmqyU9OZkwB4v8E9qM"` |  |
| secrets.default.AWS_ACCESS_KEY | string | `"placeholder"` |  |
| secrets.default.AWS_ACCOUNT_ID | string | `"placeholder"` |  |
| secrets.default.AWS_SECRET_KEY | string | `"placeholder"` |  |
| secrets.default.AZURE_APP_CLIENT_SECRET | string | `"placeholder"` |  |
| secrets.default.CENG_GCP_CREDENTIALS | string | `""` |  |
| secrets.default.CE_NEXT_GEN_SERVICE_SECRET | string | `"IC04LYMBf1lDP5oeY4hupxd4HJhLmN6azUku3xEbeE3SUx5G3ZYzhbiwVtK4i7AmqyU9OZkwB4v8E9qM"` |  |
| secrets.default.FAKTORY_PASSWORD | string | `""` |  |
| secrets.default.JWT_AUTH_SECRET | string | `"IC04LYMBf1lDP5oeY4hupxd4HJhLmN6azUku3xEbeE3SUx5G3ZYzhbiwVtK4i7AmqyU9OZkwB4v8E9qM"` |  |
| secrets.default.JWT_IDENTITY_SERVICE_SECRET | string | `"HVSKUYqD4e5Rxu12hFDdCJKGM64sxgEynvdDhaOHaTHhwwn0K4Ttr0uoOxSsEVYNrUU="` |  |
| secrets.default.NEXT_GEN_MANAGER_SECRET | string | `"IC04LYMBf1lDP5oeY4hupxd4HJhLmN6azUku3xEbeE3SUx5G3ZYzhbiwVtK4i7AmqyU9OZkwB4v8E9qM"` |  |
| secrets.default.NOTIFICATION_CLIENT_SECRET | string | `"IC04LYMBf1lDP5oeY4hupxd4HJhLmN6azUku3xEbeE3SUx5G3ZYzhbiwVtK4i7AmqyU9OZkwB4v8E9qM"` |  |
| secrets.defaultSecretName | string | `"nextgen-ce"` |  |
| secrets.fileSecret[0].keys[0].key | string | `"CENG_GCP_CREDENTIALS"` |  |
| secrets.fileSecret[0].keys[0].path | string | `"ceng_gcp_credentials.json"` |  |
| secrets.fileSecret[0].volumeMountPath | string | `"/opt/harness/svc"` |  |
| secrets.kubernetesSecrets[0].keys.ACCESS_CONTROL_SECRET | string | `""` |  |
| secrets.kubernetesSecrets[0].keys.AWS_ACCESS_KEY | string | `""` |  |
| secrets.kubernetesSecrets[0].keys.AWS_ACCOUNT_ID | string | `""` |  |
| secrets.kubernetesSecrets[0].keys.AWS_SECRET_KEY | string | `""` |  |
| secrets.kubernetesSecrets[0].keys.AZURE_APP_CLIENT_SECRET | string | `""` |  |
| secrets.kubernetesSecrets[0].keys.CENG_GCP_CREDENTIALS | string | `""` |  |
| secrets.kubernetesSecrets[0].keys.CE_NEXT_GEN_SERVICE_SECRET | string | `""` |  |
| secrets.kubernetesSecrets[0].keys.JWT_AUTH_SECRET | string | `""` |  |
| secrets.kubernetesSecrets[0].keys.JWT_IDENTITY_SERVICE_SECRET | string | `""` |  |
| secrets.kubernetesSecrets[0].keys.NEXT_GEN_MANAGER_SECRET | string | `""` |  |
| secrets.kubernetesSecrets[0].keys.NOTIFICATION_CLIENT_SECRET | string | `""` |  |
| secrets.kubernetesSecrets[0].secretName | string | `""` |  |
| secrets.kubernetesSecrets[1].keys.FAKTORY_PASSWORD | string | `""` |  |
| secrets.kubernetesSecrets[1].secretName | string | `""` |  |
| secrets.secretManagement.externalSecretsOperator[0].remoteKeys.ACCESS_CONTROL_SECRET.name | string | `""` |  |
| secrets.secretManagement.externalSecretsOperator[0].remoteKeys.ACCESS_CONTROL_SECRET.property | string | `""` |  |
| secrets.secretManagement.externalSecretsOperator[0].remoteKeys.AWS_ACCESS_KEY.name | string | `""` |  |
| secrets.secretManagement.externalSecretsOperator[0].remoteKeys.AWS_ACCESS_KEY.property | string | `""` |  |
| secrets.secretManagement.externalSecretsOperator[0].remoteKeys.AWS_ACCOUNT_ID.name | string | `""` |  |
| secrets.secretManagement.externalSecretsOperator[0].remoteKeys.AWS_ACCOUNT_ID.property | string | `""` |  |
| secrets.secretManagement.externalSecretsOperator[0].remoteKeys.AWS_SECRET_KEY.name | string | `""` |  |
| secrets.secretManagement.externalSecretsOperator[0].remoteKeys.AWS_SECRET_KEY.property | string | `""` |  |
| secrets.secretManagement.externalSecretsOperator[0].remoteKeys.AZURE_APP_CLIENT_SECRET.name | string | `""` |  |
| secrets.secretManagement.externalSecretsOperator[0].remoteKeys.AZURE_APP_CLIENT_SECRET.property | string | `""` |  |
| secrets.secretManagement.externalSecretsOperator[0].remoteKeys.CENG_GCP_CREDENTIALS.name | string | `""` |  |
| secrets.secretManagement.externalSecretsOperator[0].remoteKeys.CENG_GCP_CREDENTIALS.property | string | `""` |  |
| secrets.secretManagement.externalSecretsOperator[0].remoteKeys.CE_NEXT_GEN_SERVICE_SECRET.name | string | `""` |  |
| secrets.secretManagement.externalSecretsOperator[0].remoteKeys.CE_NEXT_GEN_SERVICE_SECRET.property | string | `""` |  |
| secrets.secretManagement.externalSecretsOperator[0].remoteKeys.FAKTORY_PASSWORD.name | string | `""` |  |
| secrets.secretManagement.externalSecretsOperator[0].remoteKeys.FAKTORY_PASSWORD.property | string | `""` |  |
| secrets.secretManagement.externalSecretsOperator[0].remoteKeys.JWT_AUTH_SECRET.name | string | `""` |  |
| secrets.secretManagement.externalSecretsOperator[0].remoteKeys.JWT_AUTH_SECRET.property | string | `""` |  |
| secrets.secretManagement.externalSecretsOperator[0].remoteKeys.JWT_IDENTITY_SERVICE_SECRET.name | string | `""` |  |
| secrets.secretManagement.externalSecretsOperator[0].remoteKeys.JWT_IDENTITY_SERVICE_SECRET.property | string | `""` |  |
| secrets.secretManagement.externalSecretsOperator[0].remoteKeys.NEXT_GEN_MANAGER_SECRET.name | string | `""` |  |
| secrets.secretManagement.externalSecretsOperator[0].remoteKeys.NEXT_GEN_MANAGER_SECRET.property | string | `""` |  |
| secrets.secretManagement.externalSecretsOperator[0].remoteKeys.NOTIFICATION_CLIENT_SECRET.name | string | `""` |  |
| secrets.secretManagement.externalSecretsOperator[0].remoteKeys.NOTIFICATION_CLIENT_SECRET.property | string | `""` |  |
| secrets.secretManagement.externalSecretsOperator[0].secretStore.kind | string | `""` |  |
| secrets.secretManagement.externalSecretsOperator[0].secretStore.name | string | `""` |  |
| secretsFromHelper.disabled | bool | `false` |  |
| securityContext | object | `{}` |  |
| service.annotations | object | `{}` |  |
| service.port | int | `6340` |  |
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
| virtualService.objects[0].pathRewrite | string | `"/ccm/api"` |  |
| virtualService.objects[0].paths[0].backend.service.name | string | `"nextgen-ce"` |  |
| virtualService.objects[0].paths[0].path | string | `"{{ .Values.global.istio.virtualService.pathPrefix }}/ccm/api"` |  |
| virtualService.objects[0].paths[1].backend.service.name | string | `"nextgen-ce"` |  |
| virtualService.objects[0].paths[1].path | string | `"{{ .Values.global.istio.virtualService.pathPrefix }}/ccm/api/"` |  |
| workloadIdentity.enabled | bool | `false` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.11.0](https://github.com/norwoodj/helm-docs/releases/v1.11.0)
