# looker

![Version: 0.11.0](https://img.shields.io/badge/Version-0.11.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 23.20.39](https://img.shields.io/badge/AppVersion-23.20.39-informational?style=flat-square)

A Helm chart for Kubernetes

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://harness.github.io/helm-common | harness-common | 1.x.x |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| clickhouseSecrets.password.key | string | `"admin-password"` | name of key within secret containing the clickhouse password |
| clickhouseSecrets.password.name | string | `"clickhouse"` | name of secret containing the clickhouse password |
| config.clickhouseConnectionName | string | `"smp-clickhouse"` | clickhouse connection name for CCM, must match model connection name |
| config.clickhouseDatabase | string | `"ccm"` | clickhouse database name |
| config.clickhouseHost | string | `"clickhouse"` | clickhouse hostname |
| config.clickhousePort | string | `"8123"` | clickhouse port |
| config.clickhouseSsl | string | `"false"` | enabled SSL connection for clickhouse |
| config.clickhouseUser | string | `"default"` | clickhouse user |
| config.clickhouseVerifySsl | string | `"false"` | use verified SSL connection for clickhouse |
| config.email | string | `"harnessSupport@harness.io"` | email address of the support user, required for initial signup and support |
| config.ffConnectionName | string | `"smp-timescale-cf"` | timescale connection name for feature flags, must match model connection name |
| config.ffDatabase | string | `"harness_ff"` | timescale database name for feature flags |
| config.firstName | string | `"Harness"` | name of the user who performs setup and support tasks |
| config.lastName | string | `"Support"` | last name of the user who performs setup and support tasks |
| config.projectName | string | `"Harness"` | name of the looker project which will be created |
| config.stoConnectionName | string | `"smp-postgres"` | postgres connection name for STO, must match model connection name |
| config.timescaleConnectionName | string | `"smp-timescale"` | timescale connection name, must match model connection name |
| config.timescaleDatabase | string | `"harness"` | timescale database name |
| database.persistence.accessModes | list | `["ReadWriteOnce"]` | PVC Access Modes for database data volume |
| database.persistence.annotations | object | `{}` | Annotations for the database PVC |
| database.persistence.claimName | string | `"looker-db"` | Name of created PVC |
| database.persistence.existingClaim | string | `""` | Name of an existing PVC to use for database |
| database.persistence.mountPath | string | `"/home/looker/looker/.db"` | Directory where Looker database volume will be mounted |
| database.persistence.size | string | `"20Gi"` | Size of volume where for storing the Looker database |
| database.persistence.storageClass | string | `""` | PVC Storage Class for database data volume |
| database.postgres.database | string | `""` | override for postgres database, only to be used as workaround when automatic config from global is broken |
| database.postgres.host | string | `""` | override for postgres host, only to be used as workaround when automatic config from global is broken |
| database.postgres.port | string | `""` | override for postgres port, only to be used as workaround when automatic config from global is broken |
| database.postgres.ssl | string | `""` | override for postgres ssl, only to be used as workaround when automatic config from global is broken |
| database.postgres.verifySsl | string | `""` | override for postgres ssl verification, only to be used as workaround when automatic config from global is broken |
| extraVolumeMounts | list | `[]` |  |
| extraVolumes | list | `[]` |  |
| fullnameOverride | string | `""` |  |
| global.airgap | string | `"false"` |  |
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
| global.database.postgres.extraArgs | string | `""` | extra arguments set to connection string |
| global.database.postgres.hosts | list | `["pg-two:5432","pg-one:5432"]` | host array for external |
| global.database.postgres.installed | bool | `true` | installed = true if installed within cluster |
| global.database.postgres.passwordKey | string | `""` | key within secret containing password for external |
| global.database.postgres.protocol | string | `"postgres"` | protocol to use for connection |
| global.database.postgres.secretName | string | `""` | secret name containing values for external |
| global.database.postgres.secrets.kubernetesSecrets[0].keys.POSTGRES_PASSWORD | string | `""` |  |
| global.database.postgres.secrets.kubernetesSecrets[0].keys.POSTGRES_USER | string | `""` |  |
| global.database.postgres.secrets.kubernetesSecrets[0].secretName | string | `""` |  |
| global.database.postgres.secrets.secretManagement.externalSecretsOperator[0].remoteKeys.POSTGRES_PASSWORD.name | string | `""` |  |
| global.database.postgres.secrets.secretManagement.externalSecretsOperator[0].remoteKeys.POSTGRES_PASSWORD.property | string | `""` |  |
| global.database.postgres.secrets.secretManagement.externalSecretsOperator[0].remoteKeys.POSTGRES_USER.name | string | `""` |  |
| global.database.postgres.secrets.secretManagement.externalSecretsOperator[0].remoteKeys.POSTGRES_USER.property | string | `""` |  |
| global.database.postgres.secrets.secretManagement.externalSecretsOperator[0].secretStore.kind | string | `""` |  |
| global.database.postgres.secrets.secretManagement.externalSecretsOperator[0].secretStore.name | string | `""` |  |
| global.database.postgres.userKey | string | `""` | key within secret containing username for external |
| global.database.timescaledb.certKey | string | `""` |  |
| global.database.timescaledb.certName | string | `""` |  |
| global.database.timescaledb.extraArgs | string | `""` |  |
| global.database.timescaledb.hosts | list | `["timescaledb-single-chart:5432"]` | provide default values if mongo.installed is set to false |
| global.database.timescaledb.installed | bool | `true` |  |
| global.database.timescaledb.passwordKey | string | `""` |  |
| global.database.timescaledb.protocol | string | `"jdbc:postgresql"` |  |
| global.database.timescaledb.secretName | string | `""` |  |
| global.database.timescaledb.secrets.kubernetesSecrets[0].keys.TIMESCALEDB_PASSWORD | string | `""` |  |
| global.database.timescaledb.secrets.kubernetesSecrets[0].keys.TIMESCALEDB_SSL_ROOT_CERT | string | `""` |  |
| global.database.timescaledb.secrets.kubernetesSecrets[0].keys.TIMESCALEDB_USERNAME | string | `""` |  |
| global.database.timescaledb.secrets.kubernetesSecrets[0].secretName | string | `""` |  |
| global.database.timescaledb.secrets.secretManagement.externalSecretsOperator[0].remoteKeys.TIMESCALEDB_PASSWORD.name | string | `""` |  |
| global.database.timescaledb.secrets.secretManagement.externalSecretsOperator[0].remoteKeys.TIMESCALEDB_PASSWORD.property | string | `""` |  |
| global.database.timescaledb.secrets.secretManagement.externalSecretsOperator[0].remoteKeys.TIMESCALEDB_SSL_ROOT_CERT.name | string | `""` |  |
| global.database.timescaledb.secrets.secretManagement.externalSecretsOperator[0].remoteKeys.TIMESCALEDB_SSL_ROOT_CERT.property | string | `""` |  |
| global.database.timescaledb.secrets.secretManagement.externalSecretsOperator[0].remoteKeys.TIMESCALEDB_USERNAME.name | string | `""` |  |
| global.database.timescaledb.secrets.secretManagement.externalSecretsOperator[0].remoteKeys.TIMESCALEDB_USERNAME.property | string | `""` |  |
| global.database.timescaledb.secrets.secretManagement.externalSecretsOperator[0].secretStore.kind | string | `""` |  |
| global.database.timescaledb.secrets.secretManagement.externalSecretsOperator[0].secretStore.name | string | `""` |  |
| global.database.timescaledb.sslEnabled | bool | `false` | Enable TimescaleDB SSL |
| global.database.timescaledb.userKey | string | `""` |  |
| global.ha | bool | `false` |  |
| global.imagePullSecrets | list | `[]` |  |
| global.ingress.className | string | `""` |  |
| global.ingress.enabled | bool | `false` |  |
| global.ingress.objects.annotations | object | `{}` |  |
| global.ingress.tls.enabled | bool | `false` |  |
| global.istio.enabled | bool | `false` |  |
| global.istio.gateway.create | bool | `false` |  |
| global.istio.hosts[0] | string | `"*"` |  |
| global.istio.virtualService.gateways[0] | string | `"someGateway"` |  |
| global.istio.virtualService.hosts[0] | string | `"myhostname.example.com"` |  |
| global.loadbalancerURL | string | `""` |  |
| global.storageClassName | string | `nil` |  |
| image.digest | string | `""` |  |
| image.imagePullSecrets | list | `[]` |  |
| image.mysql.imagePullSecrets | list | `[]` |  |
| image.mysql.registry | string | `"docker.io"` |  |
| image.mysql.repository | string | `"harness/mysql"` |  |
| image.mysql.tag | string | `"enterprise-server-8.0.32"` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.registry | string | `"docker.io"` |  |
| image.repository | string | `"harness/looker-signed"` |  |
| image.tag | string | `"23.20.39"` |  |
| ingress.annotations | object | `{}` |  |
| ingress.hosts | list | `[]` | Required if ingress is enabled, Looker requires a separate DNS domain name to function |
| ingress.tls.secretName | string | `""` |  |
| istio.gateway.create | bool | `false` |  |
| istio.gateway.port | int | `443` |  |
| istio.gateway.protocol | string | `"HTTPS"` |  |
| istio.hosts[0] | string | `"*"` |  |
| istio.tls.credentialName | string | `"harness-cert"` |  |
| istio.tls.minProtocolVersion | string | `"TLSV1_2"` |  |
| istio.tls.mode | string | `"SIMPLE"` |  |
| istio.virtualService.enabled | bool | `false` |  |
| istio.virtualService.hosts | list | `["myhostname.example.com"]` | Required if istio is enabled, Looker requires a separate DNS domain name to function |
| lifecycleHooks | object | `{}` |  |
| lookerSecrets.clientId.key | string | `"lookerClientId"` | name of key within secret containing the id used for API authentication, generate a 20-byte key, e.g. openssl rand -hex 10 |
| lookerSecrets.clientId.name | string | `"harness-looker-secrets"` | name of secret containing the Looker connection secrets |
| lookerSecrets.clientSecret.key | string | `"lookerClientSecret"` | name of key within secret containing the client secret used for API authentication, generate a 24-byte key, e.g. openssl rand -hex 12 |
| lookerSecrets.clientSecret.name | string | `"harness-looker-secrets"` | name of secret containing the Looker connection secrets |
| lookerSecrets.licenseFile.key | string | `"lookerLicenseFile"` | name of key within secret containing the offline looker license key which will be provided by Harness |
| lookerSecrets.licenseFile.name | string | `"looker-secrets"` | name of secret containing the Looker secrets |
| lookerSecrets.licenseKey.key | string | `"lookerLicenseKey"` | name of key within secret containing the looker license key which will be provided by Harness |
| lookerSecrets.licenseKey.name | string | `"looker-secrets"` | name of secret containing the Looker secrets |
| lookerSecrets.masterKey.key | string | `"lookerMasterKey"` | name of key within secret containing the key used for at rest encryption by looker, generate a Base64, 32-byte key, e.g. openssl rand -base64 32 |
| lookerSecrets.masterKey.name | string | `"looker-secrets"` | name of secret containing the Looker secrets |
| maxSurge | int | `1` |  |
| maxUnavailable | int | `0` |  |
| models.persistence.accessModes | list | `["ReadWriteOnce"]` | PVC Access Modes for models data volume |
| models.persistence.annotations | object | `{}` | Annotations for the models PVC |
| models.persistence.claimName | string | `"lookerfiles"` | Name of created PVC |
| models.persistence.existingClaim | string | `""` | Name of an existing PVC to use for models |
| models.persistence.mountPath | string | `"/mnt/lookerfiles"` | Directory where Looker models volume will be mounted |
| models.persistence.size | string | `"2Gi"` | Size of volume where Looker stores model files |
| models.persistence.storageClass | string | `""` | PVC Storage Class for models data volume If defined, storageClassName: <storageClass> If set to "-", storageClassName: "", which disables dynamic provisioning If undefined (the default) or set to null, no storageClassName spec is   set, choosing the default provisioner.  (gp2 on AWS, standard on   GKE, AWS & OpenStack) |
| mysql.database | string | `"looker"` |  |
| mysql.enabled | bool | `false` |  |
| mysql.host | string | `"looker-mysql"` |  |
| mysql.port | string | `"3306"` |  |
| mysql.user | string | `"looker"` |  |
| mysqlSecrets.password.root.key | string | `"lookerMySqlRootPassword"` | name of secret containing the mysql root password |
| mysqlSecrets.password.root.name | string | `"looker-mysql-secrets"` |  |
| mysqlSecrets.password.user.key | string | `"lookerMySqlUserPassword"` | name of secret containing the mysql looker user password |
| mysqlSecrets.password.user.name | string | `"looker-mysql-secrets"` |  |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| podAnnotations | object | `{}` |  |
| podLabels | object | `{}` |  |
| podSecurityContext | object | `{}` |  |
| postgres.extraArgs | string | `""` |  |
| postgres.hosts | list | `[]` |  |
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
| postgresPassword.key | string | `"postgres-password"` | name of key within secret containing the postgres password |
| postgresPassword.name | string | `"postgres"` | name of secret containing the postgres password |
| resources.limits.memory | string | `"12Gi"` | minimum of 6GiB recommended |
| resources.requests.cpu | int | `2` |  |
| resources.requests.memory | string | `"12Gi"` |  |
| secrets.default | string | `nil` |  |
| secrets.kubernetesSecrets[0].keys.CLIENT_ID | string | `""` |  |
| secrets.kubernetesSecrets[0].keys.CLIENT_SECRET | string | `""` |  |
| secrets.kubernetesSecrets[0].keys.LICENSE_FILE | string | `""` |  |
| secrets.kubernetesSecrets[0].keys.LICENSE_KEY | string | `""` |  |
| secrets.kubernetesSecrets[0].keys.LKR_MASTER_KEY_ENV | string | `""` |  |
| secrets.kubernetesSecrets[0].secretName | string | `""` |  |
| secrets.lookerClientId | string | `""` |  |
| secrets.lookerClientSecret | string | `""` |  |
| secrets.lookerEmbedSecret | string | `""` |  |
| secrets.lookerLicenseKey | string | `"ZW52U3BlY2lmaWM="` | Required: Looker license key |
| secrets.lookerMasterKey | string | `""` |  |
| secrets.lookerMySqlRootPassword | string | `""` |  |
| secrets.lookerMySqlUserPassword | string | `""` |  |
| secrets.lookerSignupUrl | string | `""` |  |
| secrets.secretManagement.externalSecretsOperator[0].remoteKeys.CLIENT_ID.name | string | `""` |  |
| secrets.secretManagement.externalSecretsOperator[0].remoteKeys.CLIENT_ID.property | string | `""` |  |
| secrets.secretManagement.externalSecretsOperator[0].remoteKeys.CLIENT_SECRET.name | string | `""` |  |
| secrets.secretManagement.externalSecretsOperator[0].remoteKeys.CLIENT_SECRET.property | string | `""` |  |
| secrets.secretManagement.externalSecretsOperator[0].remoteKeys.LICENSE_FILE.name | string | `""` |  |
| secrets.secretManagement.externalSecretsOperator[0].remoteKeys.LICENSE_FILE.property | string | `""` |  |
| secrets.secretManagement.externalSecretsOperator[0].remoteKeys.LICENSE_KEY.name | string | `""` |  |
| secrets.secretManagement.externalSecretsOperator[0].remoteKeys.LICENSE_KEY.property | string | `""` |  |
| secrets.secretManagement.externalSecretsOperator[0].remoteKeys.LKR_MASTER_KEY_ENV.name | string | `""` |  |
| secrets.secretManagement.externalSecretsOperator[0].remoteKeys.LKR_MASTER_KEY_ENV.property | string | `""` |  |
| secrets.secretManagement.externalSecretsOperator[0].secretStore.kind | string | `""` |  |
| secrets.secretManagement.externalSecretsOperator[0].secretStore.name | string | `""` |  |
| securityContext.runAsNonRoot | bool | `true` |  |
| securityContext.runAsUser | int | `1001` |  |
| service.annotations | object | `{}` |  |
| service.port.api | int | `19999` |  |
| service.port.web | int | `9999` |  |
| service.type | string | `"ClusterIP"` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.name | string | `"harness-looker"` |  |
| timescaleSecrets.password.key | string | `"timescaledbPostgresPassword"` | name of key within secret containing the timescale password |
| timescaleSecrets.password.name | string | `"harness-secrets"` | name of secret containing the timescale password |
| timescaledb.hosts | list | `[]` | TimescaleDB host names |
| timescaledb.secrets | object | `{"kubernetesSecrets":[{"keys":{"TIMESCALEDB_PASSWORD":"","TIMESCALEDB_SSL_ROOT_CERT":"","TIMESCALEDB_USERNAME":""},"secretName":""}],"secretManagement":{"externalSecretsOperator":[{"remoteKeys":{"TIMESCALEDB_PASSWORD":{"name":"","property":""},"TIMESCALEDB_SSL_ROOT_CERT":{"name":"","property":""},"TIMESCALEDB_USERNAME":{"name":"","property":""}},"secretStore":{"kind":"","name":""}}]}}` | TimescaleDB secrets |
| tolerations | list | `[]` |  |
| virtualService.annotations | object | `{}` |  |
| waitForInitContainer.image.digest | string | `""` |  |
| waitForInitContainer.image.imagePullSecrets | list | `[]` |  |
| waitForInitContainer.image.pullPolicy | string | `"IfNotPresent"` |  |
| waitForInitContainer.image.registry | string | `"docker.io"` |  |
| waitForInitContainer.image.repository | string | `"ubuntu"` |  |
| waitForInitContainer.image.tag | string | `"20.04"` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.12.0](https://github.com/norwoodj/helm-docs/releases/v1.12.0)
