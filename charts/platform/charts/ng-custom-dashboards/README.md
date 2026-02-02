# ng-custom-dashboards

![Version: 1.54.38](https://img.shields.io/badge/Version-1.54.38-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: v1.54.28](https://img.shields.io/badge/AppVersion-v1.54.28-informational?style=flat-square)

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
| autoscaling.minReplicas | int | `1` |  |
| autoscaling.targetCPU | string | `""` |  |
| autoscaling.targetMemory | string | `""` |  |
| config.apiGroupId | string | `"3"` | group ID for API users |
| config.cacheReloadFrequency | string | `"600"` | time in seconds between cache reloads |
| config.customerFolderId | string | `"6"` | folder ID of the 'CUSTOMER' folder in looker |
| config.embeddedGroupId | string | `"4"` | group ID for embedded users |
| config.env | string | `"SMP"` | the identifier for the environment |
| config.gunicornCmdArgs | string | `"--worker-tmp-dir /dev/shm --statsd-host=localhost:9125 --statsd-prefix=dashboards"` | extra startup arguments for the gunicorn server |
| config.lookerApiVersion | string | `"4.0"` | looker sdk param |
| config.lookerHost | string | `"hrns-looker-api"` | hostname of your looker install |
| config.lookerPort | string | `"19999"` | port of your looker install |
| config.lookerProjectName | string | `"spoke-smp"` | The name of the Looker Project used for the environment |
| config.lookerProjectPrefix | string | `"spoke-"` | Prefix of the Looker Project |
| config.lookerPubDomain | string | `""` | Required: domain name of your looker instance, this must be accessible by users in your organisation |
| config.lookerPubScheme | string | `"https"` | Required: HTTP scheme used, either http or https |
| config.lookerScheme | string | `"http"` | scheme used for your looker install, http or https |
| config.lookerTimeout | string | `"120"` | looker sdk param |
| config.lookerVerifySsl | string | `"false"` | looker sdk param |
| config.modelPrefix | string | `"SMP_"` | if you have configured Looker models with a prefix enter it here |
| config.ootbFolderId | string | `"7"` | folder ID of the 'OOTB' folder in looker |
| config.redisHost | string | `"harness-redis-master"` | hostname of your redis install |
| config.redisLockTimeout | string | `"570"` | time in seconds before cache reload locks are automatically released |
| config.redisPort | string | `"6379"` | port of your redis install |
| config.redisSentinel | string | `"true"` | used to enable Redis Sentinel support |
| config.redisSentinelMasterName | string | `"harness-redis"` | name of the Redis Sentinel master |
| config.redisSentinelUrls | string | `""` | list of sentinel URLs, example host:port,host:port |
| database.redis.cache.enabled | bool | `false` |  |
| database.redis.cache.extraArgs | string | `""` |  |
| database.redis.cache.hosts | list | `[]` |  |
| database.redis.cache.passwordKey | string | `""` |  |
| database.redis.cache.protocol | string | `""` |  |
| database.redis.cache.secretName | string | `""` |  |
| database.redis.cache.secrets.secretManagement.externalSecretsOperator[0].remoteKeys.REDIS_CA.name | string | `""` |  |
| database.redis.cache.secrets.secretManagement.externalSecretsOperator[0].remoteKeys.REDIS_CA.property | string | `""` |  |
| database.redis.cache.secrets.secretManagement.externalSecretsOperator[0].remoteKeys.REDIS_PASSWORD.name | string | `""` |  |
| database.redis.cache.secrets.secretManagement.externalSecretsOperator[0].remoteKeys.REDIS_PASSWORD.property | string | `""` |  |
| database.redis.cache.secrets.secretManagement.externalSecretsOperator[0].remoteKeys.REDIS_SSL_CA_TRUST_STORE_PASSWORD.name | string | `""` |  |
| database.redis.cache.secrets.secretManagement.externalSecretsOperator[0].remoteKeys.REDIS_SSL_CA_TRUST_STORE_PASSWORD.property | string | `""` |  |
| database.redis.cache.secrets.secretManagement.externalSecretsOperator[0].remoteKeys.REDIS_USERNAME.name | string | `""` |  |
| database.redis.cache.secrets.secretManagement.externalSecretsOperator[0].remoteKeys.REDIS_USERNAME.property | string | `""` |  |
| database.redis.cache.secrets.secretManagement.externalSecretsOperator[0].secretStore.kind | string | `""` |  |
| database.redis.cache.secrets.secretManagement.externalSecretsOperator[0].secretStore.name | string | `""` |  |
| database.redis.cache.ssl.caFileKey | string | `""` |  |
| database.redis.cache.ssl.enabled | bool | `false` |  |
| database.redis.cache.ssl.secret | string | `""` |  |
| database.redis.cache.ssl.trustStoreKey | string | `""` |  |
| database.redis.cache.ssl.trustStorePasswordKey | string | `""` |  |
| database.redis.cache.userKey | string | `""` |  |
| extraVolumeMounts | list | `[]` |  |
| extraVolumes | list | `[]` |  |
| fullnameOverride | string | `""` |  |
| global.airgap | string | `"false"` |  |
| global.commonAnnotations | object | `{}` |  |
| global.commonLabels | object | `{}` |  |
| global.database.redis.extraArgs | string | `""` |  |
| global.database.redis.hosts | list | `["redis:6379"]` | provide default values if redis.installed is set to false |
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
| global.database.redis.userKey | string | `""` |  |
| global.imagePullSecrets | list | `[]` |  |
| global.ingress.className | string | `nil` |  |
| global.ingress.disableHostInIngress | bool | `false` |  |
| global.ingress.enabled | bool | `false` |  |
| global.ingress.hosts | list | `[]` |  |
| global.ingress.objects.annotations | object | `{}` |  |
| global.ingress.pathPrefix | string | `""` |  |
| global.ingress.pathType | string | `""` |  |
| global.ingress.tls.enabled | bool | `false` |  |
| global.ingress.tls.secretName | string | `""` |  |
| global.istio.enabled | bool | `false` |  |
| global.istio.gateway.create | bool | `false` |  |
| global.istio.virtualService.gateways | string | `nil` |  |
| global.istio.virtualService.hosts | string | `nil` |  |
| global.monitoring.enabled | bool | `false` |  |
| global.monitoring.managedPlatform | string | `""` |  |
| global.pdb.create | bool | `false` |  |
| image.digest | string | `""` |  |
| image.imagePullSecrets | list | `[]` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.registry | string | `"us.gcr.io/platform-205701"` |  |
| image.repository | string | `"ng-custom-dashboards"` |  |
| image.tag | string | `"1.54.38"` |  |
| ingress.annotations | object | `{}` |  |
| ingress.objects[0].paths[0].path | string | `"{{ .Values.global.ingress.pathPrefix }}/dashboard"` |  |
| ingress.objects[0].paths[0].pathType | string | `"Prefix"` |  |
| lifecycleHooks | object | `{}` |  |
| maxSurge | int | `1` |  |
| maxUnavailable | int | `0` |  |
| monitoring.port | int | `9102` |  |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| pdb.create | bool | `false` |  |
| podAnnotations | object | `{}` |  |
| podLabels | object | `{}` |  |
| podSecurityContext | object | `{}` |  |
| rbac.rules | list | `[]` |  |
| replicaCount | int | `1` |  |
| resources.limits.memory | string | `"1536Mi"` |  |
| resources.requests.cpu | int | `1` |  |
| resources.requests.memory | string | `"768Mi"` |  |
| secrets.default.AUTH_ACCESS_CONTROL_SECRET | string | `"IC04LYMBf1lDP5oeY4hupxd4HJhLmN6azUku3xEbeE3SUx5G3ZYzhbiwVtK4i7AmqyU9OZkwB4v8E9qM"` |  |
| secrets.default.AUTH_CCM_SECRET | string | `"IC04LYMBf1lDP5oeY4hupxd4HJhLmN6azUku3xEbeE3SUx5G3ZYzhbiwVtK4i7AmqyU9OZkwB4v8E9qM"` |  |
| secrets.default.AUTH_CG_MANAGER_SECRET | string | `"IC04LYMBf1lDP5oeY4hupxd4HJhLmN6azUku3xEbeE3SUx5G3ZYzhbiwVtK4i7AmqyU9OZkwB4v8E9qM"` |  |
| secrets.default.AUTH_IDENTITY_SERVICE_SECRET | string | `"HVSKUYqD4e5Rxu12hFDdCJKGM64sxgEynvdDhaOHaTHhwwn0K4Ttr0uoOxSsEVYNrUU="` |  |
| secrets.default.AUTH_NG_MANAGER_SECRET | string | `"IC04LYMBf1lDP5oeY4hupxd4HJhLmN6azUku3xEbeE3SUx5G3ZYzhbiwVtK4i7AmqyU9OZkwB4v8E9qM"` |  |
| secrets.kubernetesSecrets[0].keys.AUTH_ACCESS_CONTROL_SECRET | string | `""` |  |
| secrets.kubernetesSecrets[0].keys.AUTH_CCM_SECRET | string | `""` |  |
| secrets.kubernetesSecrets[0].keys.AUTH_CG_MANAGER_SECRET | string | `""` |  |
| secrets.kubernetesSecrets[0].keys.AUTH_IDENTITY_SERVICE_SECRET | string | `""` |  |
| secrets.kubernetesSecrets[0].keys.AUTH_NG_MANAGER_SECRET | string | `""` |  |
| secrets.kubernetesSecrets[0].secretName | string | `""` |  |
| secrets.kubernetesSecrets[1].keys.LOOKERSDK_CLIENT_ID | string | `"lookerClientId"` |  |
| secrets.kubernetesSecrets[1].keys.LOOKERSDK_CLIENT_SECRET | string | `"lookerClientSecret"` |  |
| secrets.kubernetesSecrets[1].keys.SECRET | string | `"lookerEmbedSecret"` |  |
| secrets.kubernetesSecrets[1].secretName | string | `"harness-looker-secrets"` |  |
| secrets.secretManagement.externalSecretsOperator[0].remoteKeys.AUTH_ACCESS_CONTROL_SECRET.name | string | `""` |  |
| secrets.secretManagement.externalSecretsOperator[0].remoteKeys.AUTH_ACCESS_CONTROL_SECRET.property | string | `""` |  |
| secrets.secretManagement.externalSecretsOperator[0].remoteKeys.AUTH_CCM_SECRET.name | string | `""` |  |
| secrets.secretManagement.externalSecretsOperator[0].remoteKeys.AUTH_CCM_SECRET.property | string | `""` |  |
| secrets.secretManagement.externalSecretsOperator[0].remoteKeys.AUTH_CG_MANAGER_SECRET.name | string | `""` |  |
| secrets.secretManagement.externalSecretsOperator[0].remoteKeys.AUTH_CG_MANAGER_SECRET.property | string | `""` |  |
| secrets.secretManagement.externalSecretsOperator[0].remoteKeys.AUTH_IDENTITY_SERVICE_SECRET.name | string | `""` |  |
| secrets.secretManagement.externalSecretsOperator[0].remoteKeys.AUTH_IDENTITY_SERVICE_SECRET.property | string | `""` |  |
| secrets.secretManagement.externalSecretsOperator[0].remoteKeys.AUTH_NG_MANAGER_SECRET.name | string | `""` |  |
| secrets.secretManagement.externalSecretsOperator[0].remoteKeys.AUTH_NG_MANAGER_SECRET.property | string | `""` |  |
| secrets.secretManagement.externalSecretsOperator[0].secretStore.kind | string | `""` |  |
| secrets.secretManagement.externalSecretsOperator[0].secretStore.name | string | `""` |  |
| securityContext.runAsNonRoot | bool | `true` |  |
| securityContext.runAsUser | int | `65534` |  |
| service.annotations | object | `{}` |  |
| service.port | int | `5000` |  |
| service.type | string | `"ClusterIP"` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.create | bool | `false` |  |
| serviceAccount.name | string | `"harness-default"` |  |
| statsd.image.digest | string | `""` |  |
| statsd.image.pullPolicy | string | `"IfNotPresent"` |  |
| statsd.image.registry | string | `"docker.io"` |  |
| statsd.image.repository | string | `"prom/statsd-exporter"` |  |
| statsd.image.tag | string | `"latest"` |  |
| tolerations | list | `[]` |  |
| virtualService.annotations | object | `{}` |  |
| virtualService.objects[0].name | string | `"ng-custom-dashboards"` |  |
| virtualService.objects[0].pathMatchType | string | `"prefix"` |  |
| virtualService.objects[0].paths[0].path | string | `"/dashboard"` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)
