# code-githa

![Version: 0.3.0](https://img.shields.io/badge/Version-0.3.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.773.0](https://img.shields.io/badge/AppVersion-1.773.0-informational?style=flat-square)

A Helm chart for Kubernetes

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://harness.github.io/helm-common | harness-common | 1.x.x |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| NODES | list | `[]` |  |
| NODES_COUNT | int | `3` |  |
| additionalConfig.GITHA_JWT_IDENTITY | string | `"githa"` |  |
| affinity | object | `{}` |  |
| autoscaling.maxReplicas | int | `4` |  |
| autoscaling.minReplicas | int | `2` |  |
| busybox.image.digest | string | `""` |  |
| busybox.image.imagePullSecrets | list | `[]` |  |
| busybox.image.pullPolicy | string | `"IfNotPresent"` |  |
| busybox.image.registry | string | `"docker.io"` |  |
| busybox.image.repository | string | `"busybox"` |  |
| busybox.image.tag | string | `"1.37.0"` |  |
| config.CODE_DEBUG | bool | `false` |  |
| config.CODE_GITHA_DATABASE_DRIVER | string | `"postgres"` |  |
| config.CODE_GITHA_GRPC_SERVER_MAX_CONN_AGE | string | `"630720000s"` |  |
| config.CODE_GITHA_GRPC_SERVER_MAX_CONN_AGE_GRACE | string | `"630720000s"` |  |
| config.CODE_GITHA_GRPC_SERVER_PORT | int | `3001` |  |
| config.CODE_GITHA_HTTP_SERVER_PORT | int | `4001` |  |
| config.CODE_GITHA_LOCK_PROVIDER | string | `"redis"` |  |
| config.CODE_GITHA_NODES_CONFIG_PATH | string | `"/app/config/nodes.yaml"` |  |
| config.CODE_GITHA_PROFILER_SERVICE_NAME | string | `""` |  |
| config.CODE_GITHA_PUBSUB_APP_NAMESPACE | string | `"code-githa"` |  |
| config.CODE_GITHA_PUBSUB_PROVIDER | string | `"redis"` |  |
| config.CODE_GITHA_TIMEOUT_OPERATION_WRITE | string | `"3m"` |  |
| config.CODE_PROFILER_TYPE | string | `"GCP"` |  |
| config.CODE_SERVER_GRACEFUL_SHUTDOWN_TIME | int | `300` |  |
| config.CODE_TRACE | bool | `false` |  |
| database.redis.code-githa.extraArgs | string | `""` |  |
| database.redis.code-githa.hosts | list | `[]` |  |
| database.redis.code-githa.protocol | string | `""` |  |
| database.redis.code-githa.secrets.kubernetesSecrets[0].keys.REDIS_PASSWORD | string | `""` |  |
| database.redis.code-githa.secrets.kubernetesSecrets[0].keys.REDIS_USERNAME | string | `""` |  |
| database.redis.code-githa.secrets.kubernetesSecrets[0].secretName | string | `""` |  |
| database.redis.code-githa.secrets.secretManagement.externalSecretsOperator[0].remoteKeys.REDIS_PASSWORD.name | string | `""` |  |
| database.redis.code-githa.secrets.secretManagement.externalSecretsOperator[0].remoteKeys.REDIS_PASSWORD.property | string | `""` |  |
| database.redis.code-githa.secrets.secretManagement.externalSecretsOperator[0].remoteKeys.REDIS_USERNAME.name | string | `""` |  |
| database.redis.code-githa.secrets.secretManagement.externalSecretsOperator[0].remoteKeys.REDIS_USERNAME.property | string | `""` |  |
| database.redis.code-githa.secrets.secretManagement.externalSecretsOperator[0].secretStore.kind | string | `""` |  |
| database.redis.code-githa.secrets.secretManagement.externalSecretsOperator[0].secretStore.name | string | `""` |  |
| database.redis.code-githa.ssl.caFileKey | string | `""` |  |
| database.redis.code-githa.ssl.enabled | bool | `false` |  |
| database.redis.code-githa.ssl.secret | string | `""` |  |
| database.redis.code-githa.ssl.trustStoreKey | string | `""` |  |
| database.redis.code-githa.ssl.trustStorePasswordKey | string | `""` |  |
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
| distribution.CODE_GITHA_DISTRIBUTION_DEFAULT_REPLICATION_FACTOR | int | `3` |  |
| distribution.CODE_GITHA_DISTRIBUTION_NODE_SELECTION_STRATEGY | string | `"least_replica_count_first"` |  |
| fullnameOverride | string | `""` |  |
| global.autoscaling.enabled | bool | `false` |  |
| global.database.postgres.extraArgs | string | `""` |  |
| global.database.postgres.hosts[0] | string | `"postgres:5432"` |  |
| global.database.postgres.installed | bool | `true` |  |
| global.database.postgres.passwordKey | string | `""` |  |
| global.database.postgres.protocol | string | `"postgres"` |  |
| global.database.postgres.secretName | string | `""` |  |
| global.database.postgres.secrets.kubernetesSecrets[0].keys.POSTGRES_PASSWORD | string | `""` |  |
| global.database.postgres.secrets.kubernetesSecrets[0].keys.POSTGRES_USER | string | `""` |  |
| global.database.postgres.secrets.kubernetesSecrets[0].secretName | string | `""` |  |
| global.database.postgres.secrets.secretManagement.externalSecretsOperator[0].remoteKeys.POSTGRES_PASSWORD.name | string | `""` |  |
| global.database.postgres.secrets.secretManagement.externalSecretsOperator[0].remoteKeys.POSTGRES_PASSWORD.property | string | `""` |  |
| global.database.postgres.secrets.secretManagement.externalSecretsOperator[0].remoteKeys.POSTGRES_USER.name | string | `""` |  |
| global.database.postgres.secrets.secretManagement.externalSecretsOperator[0].remoteKeys.POSTGRES_USER.property | string | `""` |  |
| global.database.postgres.secrets.secretManagement.externalSecretsOperator[0].secretStore.kind | string | `""` |  |
| global.database.postgres.secrets.secretManagement.externalSecretsOperator[0].secretStore.name | string | `""` |  |
| global.database.postgres.userKey | string | `""` |  |
| global.database.redis.enabled | bool | `false` |  |
| global.database.redis.extraArgs | string | `""` |  |
| global.database.redis.hosts | list | `[]` |  |
| global.database.redis.installed | bool | `true` |  |
| global.database.redis.passwordKey | string | `""` |  |
| global.database.redis.protocol | string | `""` |  |
| global.database.redis.secretName | string | `""` |  |
| global.database.redis.secrets.secretManagement.externalSecretsOperator[0].remoteKeys.REDIS_CA.name | string | `""` |  |
| global.database.redis.secrets.secretManagement.externalSecretsOperator[0].remoteKeys.REDIS_CA.property | string | `""` |  |
| global.database.redis.secrets.secretManagement.externalSecretsOperator[0].remoteKeys.REDIS_PASSWORD.name | string | `""` |  |
| global.database.redis.secrets.secretManagement.externalSecretsOperator[0].remoteKeys.REDIS_PASSWORD.property | string | `""` |  |
| global.database.redis.secrets.secretManagement.externalSecretsOperator[0].remoteKeys.REDIS_SSL_CA_TRUST_STORE_PASSWORD.name | string | `""` |  |
| global.database.redis.secrets.secretManagement.externalSecretsOperator[0].remoteKeys.REDIS_SSL_CA_TRUST_STORE_PASSWORD.property | string | `""` |  |
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
| global.ingress.bodySize | string | `"1024m"` | create ingress objects |
| global.ingress.className | string | `"harness"` | set ingress object classname |
| global.ingress.enabled | bool | `false` |  |
| global.ingress.hosts | list | `["my-host.example.org"]` | set host of ingressObjects |
| global.ingress.objects | object | `{"annotations":{}}` | add annotations to ingress objects |
| global.ingress.readTimeout | int | `300` |  |
| global.ingress.tls | object | `{"enabled":true,"secretName":""}` | set tls for ingress objects |
| global.loadbalancerURL | string | `"https://test"` |  |
| global.waitForInitContainer.enabled | bool | `true` |  |
| global.waitForInitContainer.image.digest | string | `""` |  |
| global.waitForInitContainer.image.pullPolicy | string | `"Always"` |  |
| global.waitForInitContainer.image.registry | string | `"docker.io"` |  |
| global.waitForInitContainer.image.repository | string | `"harness/helm-init-container"` |  |
| global.waitForInitContainer.image.tag | string | `"latest"` |  |
| image.digest | string | `""` |  |
| image.imagePullSecrets | list | `[]` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.registry | string | `"us.gcr.io/platform-205701"` |  |
| image.repository | string | `"code-githa"` |  |
| image.tag | string | `"0.25.0-code-805.0ee5bb"` |  |
| initializeDatabase.enabled | bool | `true` |  |
| instances | int | `1` |  |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| postgres.extraArgs | string | `""` |  |
| postgres.hosts | list | `[]` |  |
| postgres.image.digest | string | `""` |  |
| postgres.image.imagePullSecrets | list | `[]` |  |
| postgres.image.pullPolicy | string | `"IfNotPresent"` |  |
| postgres.image.registry | string | `"docker.io"` |  |
| postgres.image.repository | string | `"harness/postgresql"` |  |
| postgres.image.tag | string | `"14.18.0-debian-12-r0"` |  |
| postgres.protocol | string | `""` |  |
| postgres.secrets.kubernetesSecrets[0].keys.POSTGRES_PASSWORD | string | `""` |  |
| postgres.secrets.kubernetesSecrets[0].keys.POSTGRES_USER | string | `""` |  |
| postgres.secrets.kubernetesSecrets[0].secretName | string | `""` |  |
| postgres.secrets.secretManagement.externalSecretsOperator[0].remoteKeys.POSTGRES_PASSWORD.name | string | `""` |  |
| postgres.secrets.secretManagement.externalSecretsOperator[0].remoteKeys.POSTGRES_PASSWORD.property | string | `""` |  |
| postgres.secrets.secretManagement.externalSecretsOperator[0].remoteKeys.POSTGRES_USER.name | string | `""` |  |
| postgres.secrets.secretManagement.externalSecretsOperator[0].remoteKeys.POSTGRES_USER.property | string | `""` |  |
| postgres.secrets.secretManagement.externalSecretsOperator[0].secretStore.kind | string | `""` |  |
| postgres.secrets.secretManagement.externalSecretsOperator[0].secretStore.name | string | `""` |  |
| postgresPassword.key | string | `"postgres-password"` |  |
| postgresPassword.name | string | `"postgres"` |  |
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
| resources.limits.memory | string | `"512Mi"` |  |
| resources.requests.cpu | string | `"256m"` |  |
| resources.requests.memory | string | `"256Mi"` |  |
| secrets.default.GITHA_JWT_SECRET | string | `"IC04LYMBf1lDP5oeY4hupxd4HJhLmN6azUku3xEbeE3SUx5G3ZYzhbiwVtK4i7AmqyU9OZkwB4v8E9qM"` |  |
| secrets.kubernetesSecrets[0].keys.GITHA_JWT_SECRET | string | `""` |  |
| secrets.kubernetesSecrets[0].secretName | string | `""` |  |
| secrets.secretManagement.externalSecretsOperator[0].remoteKeys.GITHA_JWT_SECRET.name | string | `""` |  |
| secrets.secretManagement.externalSecretsOperator[0].remoteKeys.GITHA_JWT_SECRET.property | string | `""` |  |
| secrets.secretManagement.externalSecretsOperator[0].remoteKeys.HARNESS_GENAI_KEY.name | string | `""` |  |
| secrets.secretManagement.externalSecretsOperator[0].remoteKeys.HARNESS_GENAI_KEY.property | string | `""` |  |
| secrets.secretManagement.externalSecretsOperator[0].secretStore.kind | string | `""` |  |
| secrets.secretManagement.externalSecretsOperator[0].secretStore.name | string | `""` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.name | string | `"code-githa"` |  |
| tolerations | list | `[]` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)
