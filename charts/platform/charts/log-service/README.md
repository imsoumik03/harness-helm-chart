# log-service

![Version: 2.12.0](https://img.shields.io/badge/Version-2.12.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.0.release-128-ubi](https://img.shields.io/badge/AppVersion-0.0.release--128--ubi-informational?style=flat-square)

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
| config.LOG_SERVICE_DISABLE_AUTH | string | `"true"` |  |
| config.LOG_SERVICE_ENDPOINT | string | `"{{ .Values.endpoint | default (printf \"%s/log-service/\" .Values.global.loadbalancerURL) }}"` |  |
| config.LOG_SERVICE_GCS_BUCKET | string | `"{{ .Values.gcs.bucketName }}"` |  |
| config.LOG_SERVICE_GCS_ENDPOINT | string | `"{{ .Values.gcs.endpoint }}"` |  |
| config.LOG_SERVICE_GCS_PATH_STYLE | string | `"true"` |  |
| config.LOG_SERVICE_GCS_REGION | string | `"{{ .Values.gcs.region }}"` |  |
| config.LOG_SERVICE_MINIO_ENABLED | string | `"{{ .Values.s3.enableMinioSupport }}"` |  |
| config.LOG_SERVICE_REDIS_DISABLE_EXPIRY_WATCHER | string | `"false"` |  |
| config.LOG_SERVICE_REDIS_ENDPOINT | string | `"{{ $redisConnection := include \"harnesscommon.dbv3.redisConnection\" (dict \"ctx\" $ \"database\" \"logservice\" \"unsetProtocol\" true) }}{{ ternary $redisConnection \"\" .Values.database.redis.logservice.enabledByDefault }}"` | if .Values.database.redis.logservice.enabledByDefault then use Redis as the stream, otherwise it will use memory mode, which is not compatible with more than 1 replica |
| config.LOG_SERVICE_REDIS_MASTER_NAME | string | `"{{ ternary \"harness-redis\" \"\" .Values.global.database.redis.installed }}"` |  |
| config.LOG_SERVICE_REDIS_SENTINEL_ADDRS | string | `"{{ $redisConnection := include \"harnesscommon.dbv3.redisConnection\" (dict \"ctx\" $ \"database\" \"logservice\" \"unsetProtocol\" true) }}{{ ternary $redisConnection \"\" .Values.global.database.redis.installed }}"` |  |
| config.LOG_SERVICE_REDIS_USE_SENTINEL | string | `"{{ .Values.global.database.redis.installed }}"` |  |
| config.LOG_SERVICE_S3_BUCKET | string | `"{{ .Values.s3.bucketName }}"` |  |
| config.LOG_SERVICE_S3_ENDPOINT | string | `"{{ ternary (printf \"http://minio.%s.svc.cluster.local:9000\" .Release.Namespace) .Values.s3.endpoint (and .Values.s3.enableMinioSupport (not .Values.s3.endpoint)) }}"` | if .Values.s3.endpoint is not defined, minio's dns will be chosen by default. |
| config.LOG_SERVICE_S3_PATH_STYLE | string | `"true"` |  |
| config.LOG_SERVICE_S3_REGION | string | `"{{ .Values.s3.region }}"` |  |
| config.LOG_SERVICE_STREAM_USE_PROTOBUF | string | `"{{ .Values.stream.enableProtobuf }}"` |  |
| database.redis.logservice.enabled | bool | `false` |  |
| database.redis.logservice.enabledByDefault | bool | `true` | enabledByDefault was included due to an issue with "enabled" flag. |
| database.redis.logservice.extraArgs | string | `""` |  |
| database.redis.logservice.hosts | list | `[]` | provide default values if redis.installed is set to false |
| database.redis.logservice.passwordKey | string | `""` |  |
| database.redis.logservice.protocol | string | `""` |  |
| database.redis.logservice.secretName | string | `""` |  |
| database.redis.logservice.secrets.kubernetesSecrets[0].keys.REDIS_PASSWORD | string | `""` |  |
| database.redis.logservice.secrets.kubernetesSecrets[0].keys.REDIS_USERNAME | string | `""` |  |
| database.redis.logservice.secrets.kubernetesSecrets[0].secretName | string | `""` |  |
| database.redis.logservice.secrets.secretManagement.externalSecretsOperator[0].remoteKeys.REDIS_PASSWORD.name | string | `""` |  |
| database.redis.logservice.secrets.secretManagement.externalSecretsOperator[0].remoteKeys.REDIS_PASSWORD.property | string | `""` |  |
| database.redis.logservice.secrets.secretManagement.externalSecretsOperator[0].remoteKeys.REDIS_USERNAME.name | string | `""` |  |
| database.redis.logservice.secrets.secretManagement.externalSecretsOperator[0].remoteKeys.REDIS_USERNAME.property | string | `""` |  |
| database.redis.logservice.secrets.secretManagement.externalSecretsOperator[0].secretStore.kind | string | `""` |  |
| database.redis.logservice.secrets.secretManagement.externalSecretsOperator[0].secretStore.name | string | `""` |  |
| database.redis.logservice.ssl.caFileKey | string | `""` |  |
| database.redis.logservice.ssl.enabled | bool | `false` |  |
| database.redis.logservice.ssl.secret | string | `""` |  |
| database.redis.logservice.ssl.trustStoreKey | string | `""` |  |
| database.redis.logservice.ssl.trustStorePasswordKey | string | `""` |  |
| database.redis.logservice.userKey | string | `""` |  |
| endpoint | string | `""` |  |
| extraVolumeMounts | list | `[]` |  |
| extraVolumes | list | `[]` |  |
| fullnameOverride | string | `""` |  |
| gcs.bucketName | string | `""` |  |
| gcs.endpoint | string | `""` | gcs.endpoint determines whether to use gcs or s3 store backend. If defined, it will take priority over s3. |
| gcs.region | string | `""` |  |
| global.commonAnnotations | object | `{}` |  |
| global.commonLabels | object | `{}` |  |
| global.database.minio.installed | bool | `true` |  |
| global.database.minio.secrets.kubernetesSecrets[0].keys.S3_PASSWORD | string | `""` |  |
| global.database.minio.secrets.kubernetesSecrets[0].keys.S3_USER | string | `""` |  |
| global.database.minio.secrets.kubernetesSecrets[0].secretName | string | `""` |  |
| global.database.minio.secrets.secretManagement.externalSecretsOperator[0].remoteKeys.S3_PASSWORD.name | string | `""` |  |
| global.database.minio.secrets.secretManagement.externalSecretsOperator[0].remoteKeys.S3_PASSWORD.property | string | `""` |  |
| global.database.minio.secrets.secretManagement.externalSecretsOperator[0].remoteKeys.S3_USER.name | string | `""` |  |
| global.database.minio.secrets.secretManagement.externalSecretsOperator[0].remoteKeys.S3_USER.property | string | `""` |  |
| global.database.minio.secrets.secretManagement.externalSecretsOperator[0].secretStore.kind | string | `""` |  |
| global.database.minio.secrets.secretManagement.externalSecretsOperator[0].secretStore.name | string | `""` |  |
| global.database.redis.extraArgs | string | `""` |  |
| global.database.redis.hosts | list | `[]` | provide default values if redis.installed is set to false |
| global.database.redis.installed | bool | `true` |  |
| global.database.redis.passwordKey | string | `""` |  |
| global.database.redis.protocol | string | `"redis"` |  |
| global.database.redis.secretName | string | `""` |  |
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
| global.database.redis.userKey | string | `""` |  |
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
| global.istio.virtualService.gateways | list | `[]` |  |
| global.istio.virtualService.hosts | list | `[]` |  |
| global.kubeVersion | string | `""` |  |
| global.loadbalancerURL | string | `""` |  |
| global.monitoring.enabled | bool | `false` |  |
| global.monitoring.managedPlatform | string | `""` |  |
| global.monitoring.path | string | `"/metrics"` |  |
| global.monitoring.port | int | `8889` |  |
| global.pdb.create | bool | `false` |  |
| image.digest | string | `""` |  |
| image.imagePullSecrets | list | `[]` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.registry | string | `"docker.io"` |  |
| image.repository | string | `"harness/log-service-signed"` |  |
| image.tag | string | `"release-151-ubi"` |  |
| imagePullSecrets | object | `{}` |  |
| ingress.annotations | object | `{}` |  |
| ingress.objects[0].annotations."nginx.ingress.kubernetes.io/rewrite-target" | string | `"/$2"` |  |
| ingress.objects[0].paths[0].path | string | `"{{ .Values.global.ingress.pathPrefix }}/log-service(/|$)(.*)"` |  |
| logServiceS3AccessKeyID.key | string | `"root-user"` |  |
| logServiceS3AccessKeyID.name | string | `"minio"` |  |
| logServiceS3SecretAccessKey.key | string | `"root-password"` |  |
| logServiceS3SecretAccessKey.name | string | `"minio"` |  |
| maxSurge | int | `1` |  |
| maxUnavailable | int | `0` |  |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| podAnnotations | object | `{}` |  |
| podSecurityContext | object | `{}` |  |
| rbac.rules | list | `[]` |  |
| replicaCount | int | `1` |  |
| resources.limits.memory | string | `"256Mi"` |  |
| resources.requests.cpu | string | `"100m"` |  |
| resources.requests.memory | string | `"256Mi"` |  |
| s3.bucketName | string | `"logs"` |  |
| s3.enableMinioSupport | bool | `true` | This will replace S3 endpoint and also set LOG_SERVICE_MINIO_ENABLED=true. Note: Minio isn't recommended for production environments. |
| s3.endpoint | string | `""` | when defining s3.endpoint, ensure that gcs.endpoint is not defined or is an empty string. |
| s3.region | string | `"us-east-1"` |  |
| secrets.default | object | `{}` |  |
| secrets.kubernetesSecrets[0].keys.LOG_SERVICE_GLOBAL_TOKEN | string | `""` |  |
| secrets.kubernetesSecrets[0].keys.LOG_SERVICE_SECRET | string | `""` |  |
| secrets.kubernetesSecrets[0].secretName | string | `""` |  |
| secrets.kubernetesSecrets[1].keys.LOG_SERVICE_S3_ACCESS_KEY_ID | string | `"root-user"` |  |
| secrets.kubernetesSecrets[1].keys.LOG_SERVICE_S3_SECRET_ACCESS_KEY | string | `"root-password"` |  |
| secrets.kubernetesSecrets[1].secretName | string | `"minio"` |  |
| secrets.secretManagement.externalSecretsOperator[0].remoteKeys.LOG_SERVICE_GLOBAL_TOKEN.name | string | `""` |  |
| secrets.secretManagement.externalSecretsOperator[0].remoteKeys.LOG_SERVICE_GLOBAL_TOKEN.property | string | `""` |  |
| secrets.secretManagement.externalSecretsOperator[0].remoteKeys.LOG_SERVICE_SECRET.name | string | `""` |  |
| secrets.secretManagement.externalSecretsOperator[0].remoteKeys.LOG_SERVICE_SECRET.property | string | `""` |  |
| secrets.secretManagement.externalSecretsOperator[0].secretStore.kind | string | `""` |  |
| secrets.secretManagement.externalSecretsOperator[0].secretStore.name | string | `""` |  |
| securityContext.runAsNonRoot | bool | `true` |  |
| securityContext.runAsUser | int | `65534` |  |
| service.annotations | object | `{}` |  |
| service.port | int | `8079` |  |
| service.type | string | `"ClusterIP"` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.create | bool | `false` |  |
| serviceAccount.name | string | `"harness-default"` |  |
| stream.enableProtobuf | bool | `false` | protobuf reduces the memory usage in redis and the amount of XADD operations |
| tolerations | list | `[]` |  |
| virtualService.annotations | object | `{}` |  |
| virtualService.objects[0].name | string | `"log-service"` |  |
| virtualService.objects[0].pathMatchType | string | `"prefix"` |  |
| virtualService.objects[0].pathRewrite | string | `"/"` |  |
| virtualService.objects[0].paths[0].path | string | `"{{ .Values.global.istio.virtualService.pathPrefix }}/log-service/"` |  |
| virtualService.objects[0].paths[1].path | string | `"{{ .Values.global.istio.virtualService.pathPrefix }}/log-service"` |  |
