# chaos-machine-ifs

![Version: 1.32.0](https://img.shields.io/badge/Version-1.32.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.32.0](https://img.shields.io/badge/AppVersion-1.32.0-informational?style=flat-square)

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
| autoscaling.minReplicas | int | `2` |  |
| autoscaling.targetCPU | string | `""` |  |
| autoscaling.targetMemory | string | `""` |  |
| config.LOG_SERVICE_ENABLED | string | `"true"` |  |
| config.LOG_SERVICE_ENDPOINT | string | `"http://log-service:8079"` |  |
| config.LOG_TOKEN_RENEWAL_INTERVAL_IN_HOUR | string | `"1"` |  |
| config.REDIS_CACHE_CERT_PATH | string | `""` |  |
| config.REDIS_CACHE_DATABASE | string | `"0"` |  |
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
| extraVolumeMounts | list | `[]` |  |
| extraVolumes | list | `[]` |  |
| fullnameOverride | string | `""` |  |
| global.airgap | bool | `false` |  |
| global.cd.enabled | bool | `true` | Enable to install CD |
| global.commonAnnotations | object | `{}` |  |
| global.commonLabels | object | `{}` |  |
| global.database.mongo.extraArgs | string | `""` |  |
| global.database.mongo.hosts | list | `[]` | provide default values if mongo.installed is set to false |
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
| image.repository | string | `"harness/chaos-machine-ifs-signed"` |  |
| image.tag | string | `"main-latest"` |  |
| ingress.annotations | object | `{}` |  |
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
| redis.extraArgs | string | `""` |  |
| redis.hosts | list | `[]` |  |
| redis.protocol | string | `""` |  |
| redis.secrets.kubernetesSecrets[0].keys.REDIS_PASSWORD | string | `""` |  |
| redis.secrets.kubernetesSecrets[0].keys.REDIS_USERNAME | string | `""` |  |
| redis.secrets.kubernetesSecrets[0].secretName | string | `""` |  |
| redis.secrets.secretManagement.externalSecretsOperator[0].remoteKeys.REDIS_PASSWORD.name | string | `""` |  |
| redis.secrets.secretManagement.externalSecretsOperator[0].remoteKeys.REDIS_PASSWORD.property | string | `""` |  |
| redis.secrets.secretManagement.externalSecretsOperator[0].remoteKeys.REDIS_USERNAME.name | string | `""` |  |
| redis.secrets.secretManagement.externalSecretsOperator[0].remoteKeys.REDIS_USERNAME.property | string | `""` |  |
| redis.secrets.secretManagement.externalSecretsOperator[0].secretStore.kind | string | `""` |  |
| redis.secrets.secretManagement.externalSecretsOperator[0].secretStore.name | string | `""` |  |
| replicaCount | int | `1` |  |
| resources.limits.memory | string | `"512Mi"` |  |
| resources.requests.cpu | string | `"500m"` |  |
| resources.requests.memory | string | `"512Mi"` |  |
| secrets.default.CHAOS_SERVICE_JWT_SECRET | string | `"SUMwNExZTUJmMWxEUDVvZVk0aHVweGQ0SEpoTG1ONmF6VWt1M3hFYmVFM1NVeDVHM1pZemhiaXdWdEs0aTdBbXF5VTlPWmt3QjR2OEU5cU0="` |  |
| secrets.default.JWT_IDENTITY_SERVICE_SECRET | string | `"SFZTS1VZcUQ0ZTVSeHUxMmhGRGRDSktHTTY0c3hnRXludmREaGFPSGFUSGh3d24wSzRUdHIwdW9PeFNzRVZZTnJVVT0="` |  |
| secrets.default.JWT_SECRET | string | `"ZE9rZHNWcWRSUFBSSkczMVhVMHFZNE1QcW1CQk1rMFBUQUdJS002TzdUR3Foanl4U2NJZEplODBtd2g1WWI1ekYzS3hZQkh3NkIzTGZ6bHE="` |  |
| secrets.default.LOG_SERVICE_TOKEN | string | `"Yzc2ZTU2N2EtYjM0MS00MDRkLWE4ZGQtZDk3Mzg3MTRlYjgy"` |  |
| secrets.default.NG_JWT_SECRET | string | `"SUMwNExZTUJmMWxEUDVvZVk0aHVweGQ0SEpoTG1ONmF6VWt1M3hFYmVFM1NVeDVHM1pZemhiaXdWdEs0aTdBbXF5VTlPWmt3QjR2OEU5cU0="` |  |
| secrets.default.SEGMENT_API_KEY | string | `""` |  |
| secrets.default.SLACK_URL | string | `""` |  |
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
| service.port | int | `4000` |  |
| service.targetport | int | `4000` |  |
| service.type | string | `"ClusterIP"` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.name | string | `"chaos-machine-ifs-sa"` |  |
| tolerations | list | `[]` |  |
| virtualService.annotations | object | `{}` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.11.0](https://github.com/norwoodj/helm-docs/releases/v1.11.0)
