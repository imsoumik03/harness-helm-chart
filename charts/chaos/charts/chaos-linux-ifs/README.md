# chaos-linux-ifs

![Version: 0.14.0](https://img.shields.io/badge/Version-0.14.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.30.0](https://img.shields.io/badge/AppVersion-1.30.0-informational?style=flat-square)

A Helm chart for Kubernetes

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://harness.github.io/helm-common | harness-common | 1.x.x |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| autoscaling.enabled | bool | `false` |  |
| autoscaling.maxReplicas | int | `10` |  |
| autoscaling.minReplicas | int | `1` |  |
| autoscaling.targetCPU | string | `""` |  |
| autoscaling.targetMemory | string | `""` |  |
| config.LOG_SERVICE_ENABLED | string | `"true"` |  |
| config.LOG_SERVICE_ENDPOINT | string | `"http://log-service:8079"` |  |
| config.LOG_TOKEN_RENEWAL_INTERVAL_IN_HOUR | string | `"1"` |  |
| config.METRIC_PORT | string | `"{{ .Values.metrics.metricsPort }}"` |  |
| config.PROBE_SERVICE_ACCOUNT_NAME | string | `"{{ include \"chaos-linux-ifs.serviceAccountName\" . }}"` |  |
| config.PROBE_SOURCE_IMAGE | string | `"{{ include \"chaos-linux-ifs.probeSourceImage\" . }}"` |  |
| config.REDIS_CACHE_CERT_PATH | string | `""` |  |
| config.REDIS_CACHE_DATABASE | string | `"0"` |  |
| config.REDIS_CACHE_ENDPOINT | string | `"{{ include \"harnesscommon.dbv3.redisConnection\" (dict \"ctx\" $ \"database\" \"cache\") }}"` |  |
| config.REDIS_CACHE_NAMESPACE | string | `""` |  |
| config.REDIS_CACHE_SSL_ENABLED | string | `"false"` |  |
| configmap | object | `{}` |  |
| database.mongo.harnesschaos.enabled | bool | `false` |  |
| database.mongo.harnesschaos.extraArgs | string | `""` |  |
| database.mongo.harnesschaos.hosts | list | `[]` |  |
| database.mongo.harnesschaos.protocol | string | `""` |  |
| database.mongo.harnesschaos.secrets.kubernetesSecrets[0].keys.MONGO_PASSWORD | string | `""` |  |
| database.mongo.harnesschaos.secrets.kubernetesSecrets[0].keys.MONGO_USER | string | `""` |  |
| database.mongo.harnesschaos.secrets.kubernetesSecrets[0].secretName | string | `""` |  |
| database.mongo.harnesschaos.secrets.secretManagement.externalSecretsOperator[0].remoteKeys.MONGO_PASSWORD.name | string | `""` |  |
| database.mongo.harnesschaos.secrets.secretManagement.externalSecretsOperator[0].remoteKeys.MONGO_PASSWORD.property | string | `""` |  |
| database.mongo.harnesschaos.secrets.secretManagement.externalSecretsOperator[0].remoteKeys.MONGO_USER.name | string | `""` |  |
| database.mongo.harnesschaos.secrets.secretManagement.externalSecretsOperator[0].remoteKeys.MONGO_USER.property | string | `""` |  |
| database.mongo.harnesschaos.secrets.secretManagement.externalSecretsOperator[0].secretStore.kind | string | `""` |  |
| database.mongo.harnesschaos.secrets.secretManagement.externalSecretsOperator[0].secretStore.name | string | `""` |  |
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
| database.redis.cache.userKey | string | `""` |  |
| extraVolumeMounts | list | `[]` |  |
| extraVolumes | list | `[]` |  |
| fullnameOverride | string | `""` |  |
| global.airgap | bool | `false` |  |
| global.cd.enabled | bool | `true` | Enable to install CD |
| global.commonAnnotations | object | `{}` |  |
| global.commonLabels | object | `{}` |  |
| global.database.mongo.extraArgs | string | `""` |  |
| global.database.mongo.hosts | list | `["dummy.net"]` | provide default values if mongo.installed is set to false |
| global.database.mongo.installed | bool | `true` |  |
| global.database.mongo.passwordKey | string | `""` |  |
| global.database.mongo.protocol | string | `""` |  |
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
| global.database.redis.hosts | list | `["redis-url"]` | provide host name for redis |
| global.database.redis.installed | bool | `true` |  |
| global.database.redis.passwordKey | string | `"password"` |  |
| global.database.redis.secretName | string | `"redis-user-pass"` |  |
| global.database.redis.secrets.kubernetesSecrets[0].keys.REDIS_PASSWORD | string | `""` |  |
| global.database.redis.secrets.kubernetesSecrets[0].keys.REDIS_USERNAME | string | `""` |  |
| global.database.redis.secrets.kubernetesSecrets[0].secretName | string | `""` |  |
| global.database.redis.secrets.secretManagement.externalSecretsOperator[0].remoteKeys.REDIS_PASSWORD.name | string | `""` |  |
| global.database.redis.secrets.secretManagement.externalSecretsOperator[0].remoteKeys.REDIS_PASSWORD.property | string | `""` |  |
| global.database.redis.secrets.secretManagement.externalSecretsOperator[0].remoteKeys.REDIS_USERNAME.name | string | `""` |  |
| global.database.redis.secrets.secretManagement.externalSecretsOperator[0].remoteKeys.REDIS_USERNAME.property | string | `""` |  |
| global.database.redis.secrets.secretManagement.externalSecretsOperator[0].secretStore.kind | string | `""` |  |
| global.database.redis.secrets.secretManagement.externalSecretsOperator[0].secretStore.name | string | `""` |  |
| global.database.redis.userKey | string | `"username"` |  |
| global.ha | bool | `false` |  |
| global.ingress.className | string | `"harness"` |  |
| global.ingress.defaultbackend.create | bool | `true` | Create will deploy a default backend into your cluster |
| global.ingress.enabled | bool | `false` |  |
| global.ingress.hosts[0] | string | `""` |  |
| global.ingress.loadBalancerEnabled | bool | `true` |  |
| global.ingress.loadBalancerIP | string | `"0.0.0.0"` |  |
| global.ingress.nginx.create | bool | `true` | Create Nginx Controller.  True will deploy a controller into your cluster |
| global.ingress.objects.annotations | object | `{}` |  |
| global.ingress.tls.enabled | bool | `false` |  |
| global.ingress.tls.secretName | string | `"harness-ssl"` |  |
| global.istio.enabled | bool | `false` | create virtualServices objects |
| global.istio.gateway | object | `{"create":false}` | create gateway and use in virtualservice |
| global.istio.virtualService | object | `{"gateways":[],"hosts":null}` | if gateway not created, use specified gateway and host |
| global.loadbalancerURL | string | `"test@harness.io"` |  |
| global.monitoring.enabled | bool | `false` |  |
| global.monitoring.managedPlatform | string | `""` |  |
| global.monitoring.path | string | `"/metrics"` |  |
| global.monitoring.port | int | `8889` |  |
| global.opa.enabled | bool | `false` |  |
| global.waitForInitContainer.enabled | bool | `true` |  |
| global.waitForInitContainer.image.digest | string | `""` |  |
| global.waitForInitContainer.image.imagePullSecrets | list | `[]` |  |
| global.waitForInitContainer.image.pullPolicy | string | `"Always"` |  |
| global.waitForInitContainer.image.registry | string | `"docker.io"` |  |
| global.waitForInitContainer.image.repository | string | `"harness/helm-init-container"` |  |
| global.waitForInitContainer.image.tag | string | `"latest"` |  |
| image.digest | string | `""` |  |
| image.pullPolicy | string | `"Always"` |  |
| image.registry | string | `"docker.io"` |  |
| image.repository | string | `"harness/smp-chaos-linux-infra-server-signed"` |  |
| image.tag | string | `"1.30.0"` |  |
| ingress.objects[0].annotations."nginx.ingress.kubernetes.io/proxy-read-timeout" | string | `"300"` |  |
| ingress.objects[0].annotations."nginx.ingress.kubernetes.io/rewrite-target" | string | `"/$2"` |  |
| ingress.objects[0].annotations."nginx.ingress.kubernetes.io/use-regex" | string | `"true"` |  |
| ingress.objects[0].name | string | `"chaos-linux-ifs"` |  |
| ingress.objects[0].paths[0].backend.service.name | string | `"chaos-linux-ifs-service"` |  |
| ingress.objects[0].paths[0].path | string | `"{{ .Values.global.ingress.pathPrefix }}/chaos/lserver/api(/|$)(.*)"` |  |
| lifecycleHooks | object | `{}` |  |
| maxSurge | int | `1` |  |
| maxUnavailable | int | `0` |  |
| metrics.metricsPort | string | `"8889"` |  |
| mongoSecrets.password.key | string | `"mongodb-root-password"` |  |
| mongoSecrets.password.name | string | `"mongodb-replicaset-chart"` |  |
| mongoSecrets.userName.key | string | `"mongodbUsername"` |  |
| mongoSecrets.userName.name | string | `"harness-secrets"` |  |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| platform.harness-manager.featureFlags.ADDITIONAL | string | `"CHAOS_ENABLED"` |  |
| platform.harness-manager.featureFlags.OPA | string | `"OPA_PIPELINE_GOVERNANCE"` |  |
| podAnnotations | object | `{}` |  |
| podLabels | object | `{}` |  |
| podSecurityContext | object | `{}` |  |
| probeSourceImage.image.registry | string | `"docker.io"` |  |
| probeSourceImage.image.repository | string | `"harness/source-probe"` |  |
| probeSourceImage.image.tag | string | `"main-latest"` |  |
| replicaCount | int | `2` |  |
| resources.limits.memory | string | `"512Mi"` |  |
| resources.requests.cpu | string | `"500m"` |  |
| resources.requests.memory | string | `"512Mi"` |  |
| secrets.default.CHAOS_SERVICE_JWT_SECRET | string | `"IC04LYMBf1lDP5oeY4hupxd4HJhLmN6azUku3xEbeE3SUx5G3ZYzhbiwVtK4i7AmqyU9OZkwB4v8E9qM"` |  |
| secrets.default.JWT_IDENTITY_SERVICE_SECRET | string | `"HVSKUYqD4e5Rxu12hFDdCJKGM64sxgEynvdDhaOHaTHhwwn0K4Ttr0uoOxSsEVYNrUU="` |  |
| secrets.default.JWT_SECRET | string | `"dOkdsVqdRPPRJG31XU0qY4MPqmBBMk0PTAGIKM6O7TGqhjyxScIdJe80mwh5Yb5zF3KxYBHw6B3Lfzlq"` |  |
| secrets.default.LOG_SERVICE_TOKEN | string | `"c76e567a-b341-404d-a8dd-d9738714eb82"` |  |
| secrets.default.NG_JWT_SECRET | string | `"IC04LYMBf1lDP5oeY4hupxd4HJhLmN6azUku3xEbeE3SUx5G3ZYzhbiwVtK4i7AmqyU9OZkwB4v8E9qM"` |  |
| secrets.kubernetesSecrets[0].keys.CHAOS_SERVICE_JWT_SECRET | string | `""` |  |
| secrets.kubernetesSecrets[0].keys.JWT_IDENTITY_SERVICE_SECRET | string | `""` |  |
| secrets.kubernetesSecrets[0].keys.JWT_SECRET | string | `""` |  |
| secrets.kubernetesSecrets[0].keys.LOG_SERVICE_TOKEN | string | `""` |  |
| secrets.kubernetesSecrets[0].keys.NG_JWT_SECRET | string | `""` |  |
| secrets.kubernetesSecrets[0].keys.SEGMENT_API_KEY | string | `""` |  |
| secrets.kubernetesSecrets[0].keys.SLACK_URL | string | `""` |  |
| secrets.kubernetesSecrets[0].secretName | string | `""` |  |
| secrets.secretManagement.externalSecretsOperator[0].remoteKeys.CHAOS_SERVICE_JWT_SECRET.name | string | `""` |  |
| secrets.secretManagement.externalSecretsOperator[0].remoteKeys.CHAOS_SERVICE_JWT_SECRET.property | string | `""` |  |
| secrets.secretManagement.externalSecretsOperator[0].remoteKeys.JWT_IDENTITY_SERVICE_SECRET.name | string | `""` |  |
| secrets.secretManagement.externalSecretsOperator[0].remoteKeys.JWT_IDENTITY_SERVICE_SECRET.property | string | `""` |  |
| secrets.secretManagement.externalSecretsOperator[0].remoteKeys.JWT_SECRET.name | string | `""` |  |
| secrets.secretManagement.externalSecretsOperator[0].remoteKeys.JWT_SECRET.property | string | `""` |  |
| secrets.secretManagement.externalSecretsOperator[0].remoteKeys.LOG_SERVICE_TOKEN.name | string | `""` |  |
| secrets.secretManagement.externalSecretsOperator[0].remoteKeys.LOG_SERVICE_TOKEN.property | string | `""` |  |
| secrets.secretManagement.externalSecretsOperator[0].remoteKeys.NG_JWT_SECRET.name | string | `""` |  |
| secrets.secretManagement.externalSecretsOperator[0].remoteKeys.NG_JWT_SECRET.property | string | `""` |  |
| secrets.secretManagement.externalSecretsOperator[0].remoteKeys.SEGMENT_API_KEY.name | string | `""` |  |
| secrets.secretManagement.externalSecretsOperator[0].remoteKeys.SEGMENT_API_KEY.property | string | `""` |  |
| secrets.secretManagement.externalSecretsOperator[0].remoteKeys.SLACK_URL.name | string | `""` |  |
| secrets.secretManagement.externalSecretsOperator[0].remoteKeys.SLACK_URL.property | string | `""` |  |
| secrets.secretManagement.externalSecretsOperator[0].secretStore.kind | string | `""` |  |
| secrets.secretManagement.externalSecretsOperator[0].secretStore.name | string | `""` |  |
| securityContext | object | `{}` |  |
| service.annotations | object | `{}` |  |
| service.grpcport | int | `5000` |  |
| service.grpctargetport | int | `5000` |  |
| service.port | int | `4000` |  |
| service.targetport | int | `4000` |  |
| service.type | string | `"ClusterIP"` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.name | string | `"chaos-linux-ifs-sa"` |  |
| tolerations | list | `[]` |  |
| virtualService.annotations | object | `{}` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.11.0](https://github.com/norwoodj/helm-docs/releases/v1.11.0)
