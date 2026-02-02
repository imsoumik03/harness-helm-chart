# code-gitrpc

![Version: 0.3.0](https://img.shields.io/badge/Version-0.3.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.773.0](https://img.shields.io/badge/AppVersion-1.773.0-informational?style=flat-square)

A Helm chart for Kubernetes

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://harness.github.io/helm-common | harness-common | 1.x.x |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| additionalConfig.GITRPC_REDIS_SENTINEL_MASTER | string | `"harness-redis"` |  |
| additionalConfigs | object | `{}` |  |
| affinity | object | `{}` |  |
| busybox.image.digest | string | `""` |  |
| busybox.image.imagePullSecrets | list | `[]` |  |
| busybox.image.pullPolicy | string | `"IfNotPresent"` |  |
| busybox.image.registry | string | `"docker.io"` |  |
| busybox.image.repository | string | `"busybox"` |  |
| busybox.image.tag | string | `"1.35.0"` |  |
| config.CODE_DEBUG | bool | `false` |  |
| config.CODE_GITRPC_PV_STORAGE | string | `"10Gi"` |  |
| config.CODE_GITRPC_SERVER_GIT_TRACE | bool | `true` |  |
| config.CODE_GITRPC_SERVER_HTTP_PORT | int | `4001` |  |
| config.CODE_GITRPC_SERVER_MAX_CONN_AGE | string | `"630720000s"` |  |
| config.CODE_GITRPC_SERVER_MAX_CONN_AGE_GRACE | string | `"630720000s"` |  |
| config.CODE_GITRPC_SERVER_PORT | int | `3001` |  |
| config.CODE_GIT_ROOT | string | `"/app/data"` |  |
| config.CODE_PROFILER_SERVICE_NAME | string | `"code-gitrpc"` |  |
| config.CODE_PROFILER_TYPE | string | `"GCP"` |  |
| config.CODE_SERVER_GRACEFUL_SHUTDOWN_TIME | int | `300` |  |
| config.CODE_TRACE | bool | `false` |  |
| config.mountPath | string | `"/app/data"` |  |
| database.redis.code-gitrpc.extraArgs | string | `""` |  |
| database.redis.code-gitrpc.hosts | list | `[]` |  |
| database.redis.code-gitrpc.protocol | string | `""` |  |
| database.redis.code-gitrpc.secrets.kubernetesSecrets[0].keys.REDIS_PASSWORD | string | `""` |  |
| database.redis.code-gitrpc.secrets.kubernetesSecrets[0].keys.REDIS_USERNAME | string | `""` |  |
| database.redis.code-gitrpc.secrets.kubernetesSecrets[0].secretName | string | `""` |  |
| database.redis.code-gitrpc.secrets.secretManagement.externalSecretsOperator[0].remoteKeys.REDIS_PASSWORD.name | string | `""` |  |
| database.redis.code-gitrpc.secrets.secretManagement.externalSecretsOperator[0].remoteKeys.REDIS_PASSWORD.property | string | `""` |  |
| database.redis.code-gitrpc.secrets.secretManagement.externalSecretsOperator[0].remoteKeys.REDIS_USERNAME.name | string | `""` |  |
| database.redis.code-gitrpc.secrets.secretManagement.externalSecretsOperator[0].remoteKeys.REDIS_USERNAME.property | string | `""` |  |
| database.redis.code-gitrpc.secrets.secretManagement.externalSecretsOperator[0].secretStore.kind | string | `""` |  |
| database.redis.code-gitrpc.secrets.secretManagement.externalSecretsOperator[0].secretStore.name | string | `""` |  |
| database.redis.code-gitrpc.ssl.caFileKey | string | `""` |  |
| database.redis.code-gitrpc.ssl.enabled | bool | `false` |  |
| database.redis.code-gitrpc.ssl.secret | string | `""` |  |
| database.redis.code-gitrpc.ssl.trustStoreKey | string | `""` |  |
| database.redis.code-gitrpc.ssl.trustStorePasswordKey | string | `""` |  |
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
| fullnameOverride | string | `""` |  |
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
| global.database.redis.ssl.caFileKey | string | `""` |  |
| global.database.redis.ssl.enabled | bool | `false` |  |
| global.database.redis.ssl.secret | string | `""` |  |
| global.database.redis.ssl.trustStoreKey | string | `""` |  |
| global.database.redis.ssl.trustStorePasswordKey | string | `""` |  |
| global.database.redis.userKey | string | `""` |  |
| global.imagePullSecrets | list | `[]` |  |
| global.ingress.bodySize | string | `"1024m"` |  |
| global.ingress.className | string | `"harness"` |  |
| global.ingress.readTimeout | int | `300` |  |
| global.loadbalancerURL | string | `"https://test"` |  |
| global.waitForInitContainer.enabled | bool | `true` |  |
| global.waitForInitContainer.image.digest | string | `""` |  |
| global.waitForInitContainer.image.pullPolicy | string | `"Always"` |  |
| global.waitForInitContainer.image.registry | string | `"docker.io"` |  |
| global.waitForInitContainer.image.repository | string | `"harness/helm-init-container"` |  |
| global.waitForInitContainer.image.tag | string | `"latest"` |  |
| harnessDisks.disks | list | `[]` |  |
| image.digest | string | `""` |  |
| image.imagePullSecrets | list | `[]` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.registry | string | `"us.gcr.io/platform-205701"` |  |
| image.repository | string | `"code-gitrpc"` |  |
| image.tag | string | `"1.0.0-code1218-6d1d95"` |  |
| instances | int | `3` |  |
| nameOverride | string | `""` |  |
| nodeLabel.key | string | `""` |  |
| nodeLabel.value | string | `""` |  |
| nodeSelector | object | `{}` |  |
| podAnnotations | object | `{}` |  |
| podSecurityContext | object | `{}` |  |
| postgres.image.digest | string | `""` |  |
| postgres.image.imagePullSecrets | list | `[]` |  |
| postgres.image.pullPolicy | string | `"IfNotPresent"` |  |
| postgres.image.registry | string | `"docker.io"` |  |
| postgres.image.repository | string | `"harness/postgresql"` |  |
| postgres.image.tag | string | `"14.18.0-debian-12-r0"` |  |
| pvname | string | `"code-gitrpc"` |  |
| redis.extraArgs | string | `""` |  |
| redis.hosts | list | `[]` |  |
| redis.passwordKey | string | `""` |  |
| redis.protocol | string | `""` |  |
| redis.secretName | string | `""` |  |
| redis.secrets.kubernetesSecrets[0].keys.REDIS_PASSWORD | string | `""` |  |
| redis.secrets.kubernetesSecrets[0].keys.REDIS_USERNAME | string | `""` |  |
| redis.secrets.kubernetesSecrets[0].secretName | string | `""` |  |
| redis.secrets.secretManagement.externalSecretsOperator[0].remoteKeys.REDIS_PASSWORD.name | string | `""` |  |
| redis.secrets.secretManagement.externalSecretsOperator[0].remoteKeys.REDIS_PASSWORD.property | string | `""` |  |
| redis.secrets.secretManagement.externalSecretsOperator[0].remoteKeys.REDIS_USERNAME.name | string | `""` |  |
| redis.secrets.secretManagement.externalSecretsOperator[0].remoteKeys.REDIS_USERNAME.property | string | `""` |  |
| redis.secrets.secretManagement.externalSecretsOperator[0].secretStore.kind | string | `""` |  |
| redis.secrets.secretManagement.externalSecretsOperator[0].secretStore.name | string | `""` |  |
| redis.userKey | string | `""` |  |
| resources.limits.memory | string | `"1Gi"` |  |
| resources.requests.cpu | string | `"1024m"` |  |
| resources.requests.memory | string | `"1Gi"` |  |
| secret | string | `nil` |  |
| securityContext | object | `{}` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.create | bool | `false` |  |
| serviceAccount.name | string | `"harness-default"` |  |
| tolerations | list | `[]` |  |
| waitForInitContainer.containerSecurityContext.runAsNonRoot | bool | `true` |  |
| waitForInitContainer.containerSecurityContext.runAsUser | int | `65534` |  |
| waitForInitContainer.image | object | `{"digest":"","imagePullSecrets":[],"pullPolicy":"IfNotPresent","registry":"docker.io","repository":"harness/helm-init-container","tag":"latest"}` | image.imagePullSecrets Specify docker-registry secret names as an array |
| waitForInitContainer.resources.limits.memory | string | `"1Gi"` |  |
| waitForInitContainer.resources.requests.cpu | string | `"500m"` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.11.0](https://github.com/norwoodj/helm-docs/releases/v1.11.0)
