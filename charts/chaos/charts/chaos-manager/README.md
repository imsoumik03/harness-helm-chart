# chaos-manager

![Version: 0.15.0](https://img.shields.io/badge/Version-0.15.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.33.0](https://img.shields.io/badge/AppVersion-1.33.0-informational?style=flat-square)

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
| autoscaling.targetCPU | string | `""` |  |
| autoscaling.targetMemory | string | `""` |  |
| config.ACCESS_CONTROL_ENDPOINT | string | `"http://access-control:9006/api"` |  |
| config.APP_AI_ENDPOINT | string | `""` |  |
| config.CF_INFRA_COMPATIBLE_VERSIONS | string | `"[\"1.46.0\",\"1.47.0\",\"1.48.0\",\"1.49.0\",\"1.50.0\"]"` |  |
| config.CG_MANAGER_ENDPOINT | string | `"http://harness-manager:9090"` |  |
| config.CHAOS_IMAGEREGISTRY_DEV | string | `"false"` |  |
| config.CHAOS_V2_ONBOARDING | string | `"true"` |  |
| config.DEFAULT_CHAOS_EXPERIMENT_LIMIT | string | `"2000"` |  |
| config.DEFAULT_CHAOS_EXPERIMENT_RUN_LIMIT | string | `"100000"` |  |
| config.DEFAULT_CHAOS_GAMEDAY_LIMIT | string | `"200"` |  |
| config.DEFAULT_CHAOS_HUB_LIMIT | string | `"30"` |  |
| config.DEFAULT_CHAOS_HUB_SIZE | string | `"200"` |  |
| config.DEFAULT_DDCR_FAULT_IMAGE | string | `"{{ include \"chaos-manager.ddcrFaultsImage\" . }}"` |  |
| config.DEFAULT_DDCR_IMAGE | string | `"{{ include \"chaos-manager.ddcrImage\" . }}"` |  |
| config.DEFAULT_DDCR_LIB_IMAGE | string | `"{{ include \"chaos-manager.ddcrLibImage\" . }}"` |  |
| config.DEFAULT_EXPERIMENTS_PER_GAME_DAY_RUN_LIMIT | string | `"20"` |  |
| config.DEFAULT_GAME_DAY_RUNS_PER_GAME_DAY_LIMIT | string | `"1000"` |  |
| config.DEFAULT_PARALLEL_CHAOS_EXPERIMENT_RUNS | string | `"500"` |  |
| config.DEPLOY_MODE | string | `"KUBERNETES_ONPREM"` |  |
| config.DISCOVERY_CRUD_REDIS_STREAM | string | `"discovery_crud"` |  |
| config.ENTERPRISE_HUB_BRANCH_NAME | string | `"release/1.50.x"` |  |
| config.ENTITY_CRUD_REDIS_STREAM | string | `"entity_crud"` |  |
| config.EXPERIMENT_HELPER_IMAGE_VERSION | string | `"1.50.0"` |  |
| config.EXTERNAL_ENDPOINTS | string | `""` |  |
| config.FF_CLIENT_CONFIG_URL | string | `""` |  |
| config.FF_CLIENT_EVENT_URL | string | `""` |  |
| config.IMAGE_REGISTRY_SECRET | string | `""` |  |
| config.INFRA_COMPATIBLE_VERSIONS | string | `"[\"0.13.0\",\"0.14.0\",\"1.15.0\",\"1.16.0\",\"1.17.0\",\"1.18.0\",\"1.19.0\",\"1.20.0\",\"1.21.0\",\"1.22.0\",\"1.23.0\",\"1.24.0\",\"1.25.0\",\"1.26.0\",\"1.27.0\",\"1.28.0\",\"1.29.0\",\"1.30.0\",\"1.31.0\",\"1.32.0\",\"1.33.0\",\"1.34.0\",\"1.35.0\",\"1.36.0\",\"1.37.0\",\"1.38.0\",\"1.39.0\",\"1.40.0\",\"1.41.0\",\"1.43.0\",\"1.44.0\",\"1.45.0\",\"1.46.0\",\"1.47.0\",\"1.48.0\",\"1.49.0\",\"1.50.0\"]"` |  |
| config.K8S_INFRA_SERVER_ENDPOINT | string | `"http://chaos-k8s-ifs-service:6000"` |  |
| config.LINUX_INFRA_COMPATIBLE_VERSIONS | string | `"[\"1.28.0\",\"1.29.0\",\"1.30.0\",\"1.31.0\",\"1.32.0\",\"1.33.0\",\"1.34.0\",\"1.35.0\",\"1.36.0\",\"1.37.0\",\"1.38.0\",\"1.39.0\",\"1.40.0\",\"1.41.0\",\"1.42.0\",\"1.43.0\",\"1.44.0\",\"1.45.0\",\"1.46.0\",\"1.47.0\",\"1.48.0\",\"1.49.0\",\"1.50.0\"]"` |  |
| config.LINUX_INFRA_SERVER_ENDPOINT | string | `"{{ .Values.global.loadbalancerURL }}/gateway/chaos/lserver/api"` |  |
| config.LINUX_INFRA_SERVER_SVC_ENDPOINT | string | `"http://chaos-linux-ifs-service:4000"` |  |
| config.LOG_INDIRECT_UPLOAD | string | `"true"` |  |
| config.LOG_SERVICE_EXTERNAL_ENDPOINT | string | `"{{ .Values.global.loadbalancerURL }}/gateway/log-service"` |  |
| config.LOG_WATCHER_IMAGE | string | `"{{ include \"chaos-manager.logWatcherImage\" . }}"` |  |
| config.MACHINE_INFRA_SERVER_ENDPOINT | string | `"{{ .Values.global.loadbalancerURL }}/gateway/chaos/mserver/api"` |  |
| config.MACHINE_INFRA_SERVER_SVC_ENDPOINT | string | `"http://chaos-machine-ifs-service:4000"` |  |
| config.METRIC_PORT | string | `"{{ .Values.metrics.metricsPort }}"` |  |
| config.NG_MANAGER_ENDPOINT | string | `"http://ng-manager:7090"` |  |
| config.PG_DBNAME | string | `"harness"` |  |
| config.PG_HOST | string | `"{{ include \"harnesscommon.dbconnectionv2.timescaleHost\" (dict \"context\" $) }}"` |  |
| config.PG_MIGRATION_PATH | string | `"/hce/migrations"` |  |
| config.PG_PORT | string | `"{{ include \"harnesscommon.dbconnectionv2.timescalePort\" (dict \"context\" $) }}"` |  |
| config.PIPELINE_SERVICE_ENDPOINT | string | `"http://pipeline-service:12001/api"` |  |
| config.PLATFORM_SERVICE_ENDPOINT | string | `"http://platform-service:9005/api"` |  |
| config.REDIS_CACHE_DATABASE | string | `"0"` |  |
| config.REDIS_CACHE_ENDPOINT | string | `"{{ include \"harnesscommon.dbv3.redisConnection\" (dict \"ctx\" $ \"database\" \"cache\") }}"` |  |
| config.REDIS_CACHE_NAMESPACE | string | `""` |  |
| config.REDIS_DATABASE | string | `"0"` |  |
| config.REDIS_ENDPOINT | string | `"{{ include \"harnesscommon.dbv3.redisConnection\" (dict \"ctx\" $ \"database\" \"events\") }}"` |  |
| config.REDIS_EVENTS_FWK_NAMESPACE | string | `""` |  |
| config.REDIS_STREAM_ENV | string | `""` |  |
| config.RUN_POSTGRES_MIGRATION | string | `"true"` |  |
| config.SAAS_ENABLED | string | `"false"` |  |
| config.SERVER_VERSION | string | `"1.50.1"` |  |
| config.SKIP_SECURE_VERIFY | string | `"true"` |  |
| config.SRM_CHANGE_SOURCE_REDIS_STREAM | string | `"chaos_change_events"` |  |
| config.USE_LEGACY_FEATURE_FLAGS | string | `"true"` |  |
| config.V2_ONBOARDING_GO_ROUTINE_COUNT | string | `"3"` |  |
| config.WINDOWS_INFRA_COMPATIBLE_VERSIONS | string | `"[\"1.32.0\",\"1.32.1\",\"1.33.0\",\"1.34.0\",\"1.35.0\",\"1.36.0\",\"1.37.0\",\"1.38.0\",\"1.39.0\",\"1.40.0\",\"1.41.0\",\"1.42.0\",\"1.43.0\",\"1.44.0\",\"1.45.0\",\"1.46.0\",\"1.47.0\",\"1.48.0\",\"1.49.0\",\"1.50.0\"]"` |  |
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
| database.redis.cache.ssl.caFileKey | string | `""` |  |
| database.redis.cache.ssl.enabled | bool | `false` |  |
| database.redis.cache.ssl.secret | string | `""` |  |
| database.redis.cache.ssl.trustStoreKey | string | `""` |  |
| database.redis.cache.ssl.trustStorePasswordKey | string | `""` |  |
| database.redis.cache.userKey | string | `""` |  |
| database.redis.events.enabled | bool | `false` |  |
| database.redis.events.extraArgs | string | `""` |  |
| database.redis.events.hosts | list | `[]` |  |
| database.redis.events.passwordKey | string | `""` |  |
| database.redis.events.protocol | string | `""` |  |
| database.redis.events.secretName | string | `""` |  |
| database.redis.events.secrets.secretManagement.externalSecretsOperator[0].remoteKeys.REDIS_CA.name | string | `""` |  |
| database.redis.events.secrets.secretManagement.externalSecretsOperator[0].remoteKeys.REDIS_CA.property | string | `""` |  |
| database.redis.events.secrets.secretManagement.externalSecretsOperator[0].remoteKeys.REDIS_PASSWORD.name | string | `""` |  |
| database.redis.events.secrets.secretManagement.externalSecretsOperator[0].remoteKeys.REDIS_PASSWORD.property | string | `""` |  |
| database.redis.events.secrets.secretManagement.externalSecretsOperator[0].remoteKeys.REDIS_SSL_CA_TRUST_STORE_PASSWORD.name | string | `""` |  |
| database.redis.events.secrets.secretManagement.externalSecretsOperator[0].remoteKeys.REDIS_SSL_CA_TRUST_STORE_PASSWORD.property | string | `""` |  |
| database.redis.events.secrets.secretManagement.externalSecretsOperator[0].remoteKeys.REDIS_USERNAME.name | string | `""` |  |
| database.redis.events.secrets.secretManagement.externalSecretsOperator[0].remoteKeys.REDIS_USERNAME.property | string | `""` |  |
| database.redis.events.secrets.secretManagement.externalSecretsOperator[0].secretStore.kind | string | `""` |  |
| database.redis.events.secrets.secretManagement.externalSecretsOperator[0].secretStore.name | string | `""` |  |
| database.redis.events.ssl.caFileKey | string | `""` |  |
| database.redis.events.ssl.enabled | bool | `false` |  |
| database.redis.events.ssl.secret | string | `""` |  |
| database.redis.events.ssl.trustStoreKey | string | `""` |  |
| database.redis.events.ssl.trustStorePasswordKey | string | `""` |  |
| database.redis.events.userKey | string | `""` |  |
| ddcrFaultsImage.image.digest | string | `""` |  |
| ddcrFaultsImage.image.registry | string | `"docker.io"` |  |
| ddcrFaultsImage.image.repository | string | `"harness/chaos-ddcr-faults"` |  |
| ddcrFaultsImage.image.tag | string | `"1.50.0"` |  |
| ddcrImage.image.digest | string | `""` |  |
| ddcrImage.image.registry | string | `"docker.io"` |  |
| ddcrImage.image.repository | string | `"harness/chaos-ddcr"` |  |
| ddcrImage.image.tag | string | `"1.50.0"` |  |
| ddcrLibImage.image.digest | string | `""` |  |
| ddcrLibImage.image.registry | string | `"docker.io"` |  |
| ddcrLibImage.image.repository | string | `"harness/chaos-ddcr-faults"` |  |
| ddcrLibImage.image.tag | string | `"1.50.0"` |  |
| deployAsSts | bool | `false` |  |
| extraVolumeMounts[0].mountPath | string | `"/tmp/dashboard.yaml"` |  |
| extraVolumeMounts[0].name | string | `"chaos-dashboard-config"` |  |
| extraVolumeMounts[0].subPath | string | `"dashboard.yaml"` |  |
| extraVolumes[0].configMap.name | string | `"chaos-dashboard-config"` |  |
| extraVolumes[0].name | string | `"chaos-dashboard-config"` |  |
| fullnameOverride | string | `""` |  |
| global.airgap | bool | `false` |  |
| global.autoscaling.enabled | bool | `false` |  |
| global.cd.enabled | bool | `true` | Enable to install CD |
| global.commonAnnotations | object | `{}` |  |
| global.commonLabels | object | `{}` |  |
| global.database.mongo.extraArgs | string | `""` | set additional arguments to mongo uri |
| global.database.mongo.hosts | list | `[""]` | set the mongo hosts if mongo.installed is set to false |
| global.database.mongo.installed | bool | `true` | set false to configure external mongo and generate mongo uri protocol://hosts?extraArgs |
| global.database.mongo.passwordKey | string | `"mongo-test-pass"` | provide the passwordKey to reference mongo password |
| global.database.mongo.protocol | string | `"mongodb"` | set the protocol for mongo uri |
| global.database.mongo.secretName | string | `"test"` | provide the secretname to reference mongo username and password |
| global.database.mongo.secrets.kubernetesSecrets[0].keys.MONGO_PASSWORD | string | `""` |  |
| global.database.mongo.secrets.kubernetesSecrets[0].keys.MONGO_USER | string | `""` |  |
| global.database.mongo.secrets.kubernetesSecrets[0].secretName | string | `""` |  |
| global.database.mongo.secrets.secretManagement.externalSecretsOperator[0].remoteKeys.MONGO_PASSWORD.name | string | `""` |  |
| global.database.mongo.secrets.secretManagement.externalSecretsOperator[0].remoteKeys.MONGO_PASSWORD.property | string | `""` |  |
| global.database.mongo.secrets.secretManagement.externalSecretsOperator[0].remoteKeys.MONGO_USER.name | string | `""` |  |
| global.database.mongo.secrets.secretManagement.externalSecretsOperator[0].remoteKeys.MONGO_USER.property | string | `""` |  |
| global.database.mongo.secrets.secretManagement.externalSecretsOperator[0].secretStore.kind | string | `""` |  |
| global.database.mongo.secrets.secretManagement.externalSecretsOperator[0].secretStore.name | string | `""` |  |
| global.database.mongo.userKey | string | `"pass"` | provide the userKey to reference mongo username |
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
| global.database.redis.ssl.caFileKey | string | `""` |  |
| global.database.redis.ssl.enabled | bool | `false` |  |
| global.database.redis.ssl.secret | string | `""` |  |
| global.database.redis.ssl.trustStoreKey | string | `""` |  |
| global.database.redis.ssl.trustStorePasswordKey | string | `""` |  |
| global.database.redis.userKey | string | `"username"` |  |
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
| global.ha | bool | `false` |  |
| global.ingress.className | string | `"harness"` |  |
| global.ingress.defaultbackend.create | bool | `true` | Create will deploy a default backend into your cluster |
| global.ingress.disableHostInIngress | bool | `false` |  |
| global.ingress.enabled | bool | `false` |  |
| global.ingress.hosts[0] | string | `""` |  |
| global.ingress.loadBalancerEnabled | bool | `true` |  |
| global.ingress.loadBalancerIP | string | `"0.0.0.0"` |  |
| global.ingress.nginx.create | bool | `true` | Create Nginx Controller.  True will deploy a controller into your cluster |
| global.ingress.objects.annotations | object | `{}` |  |
| global.ingress.pathPrefix | string | `""` |  |
| global.ingress.pathType | string | `""` |  |
| global.ingress.tls.enabled | bool | `false` |  |
| global.ingress.tls.secretName | string | `"harness-ssl"` |  |
| global.istio.enabled | bool | `false` |  |
| global.istio.gateway.create | bool | `true` |  |
| global.istio.gateway.port | int | `443` |  |
| global.istio.gateway.protocol | string | `"HTTPS"` |  |
| global.istio.hosts[0] | string | `"*"` |  |
| global.istio.strict | bool | `true` |  |
| global.istio.tls.credentialName | string | `""` |  |
| global.istio.virtualService.gateways | list | `[]` |  |
| global.istio.virtualService.hosts[0] | string | `""` |  |
| global.loadbalancerURL | string | `"test@harness.io"` |  |
| global.monitoring.enabled | bool | `false` |  |
| global.monitoring.managedPlatform | string | `""` |  |
| global.opa.enabled | bool | `false` |  |
| global.pdb.create | bool | `false` |  |
| global.waitForInitContainer.enabled | bool | `true` |  |
| global.waitForInitContainer.image.digest | string | `""` |  |
| global.waitForInitContainer.image.imagePullSecrets | list | `[]` |  |
| global.waitForInitContainer.image.pullPolicy | string | `"IfNotPresent"` |  |
| global.waitForInitContainer.image.registry | string | `"docker.io"` |  |
| global.waitForInitContainer.image.repository | string | `"harness/helm-init-container"` |  |
| global.waitForInitContainer.image.tag | string | `"latest"` |  |
| image.digest | string | `""` |  |
| image.pullPolicy | string | `"Always"` |  |
| image.registry | string | `"docker.io"` |  |
| image.repository | string | `"harness/smp-chaos-manager-signed"` |  |
| image.tag | string | `"1.30.3"` |  |
| ingress.objects[0].annotations."nginx.ingress.kubernetes.io/proxy-read-timeout" | string | `"300"` |  |
| ingress.objects[0].annotations."nginx.ingress.kubernetes.io/rewrite-target" | string | `"/$2"` |  |
| ingress.objects[0].annotations."nginx.ingress.kubernetes.io/use-regex" | string | `"true"` |  |
| ingress.objects[0].paths[0].backend.service.name | string | `"chaos-manager-service"` |  |
| ingress.objects[0].paths[0].path | string | `"{{ .Values.global.ingress.pathPrefix }}/chaos/manager/api(/|$)(.*)"` |  |
| jobs.bg_processor.cronJobs.one.activeDeadlineSeconds | string | `"240"` |  |
| jobs.bg_processor.cronJobs.one.backoffLimit | string | `"5"` |  |
| jobs.bg_processor.cronJobs.one.configMapName | string | `"chaos-bg-processor-config-every-2h"` |  |
| jobs.bg_processor.cronJobs.one.failedJobsHistoryLimit | string | `"3"` |  |
| jobs.bg_processor.cronJobs.one.restartPolicy | string | `"OnFailure"` |  |
| jobs.bg_processor.cronJobs.one.schedule | string | `"0 */2 * * *"` |  |
| jobs.bg_processor.cronJobs.one.startingDeadlineSeconds | string | `"300"` |  |
| jobs.bg_processor.cronJobs.one.successfulJobsHistoryLimit | string | `"1"` |  |
| jobs.bg_processor.cronJobs.two.activeDeadlineSeconds | string | `"240"` |  |
| jobs.bg_processor.cronJobs.two.backoffLimit | string | `"5"` |  |
| jobs.bg_processor.cronJobs.two.configMapName | string | `"chaos-bg-processor-config-every-24h"` |  |
| jobs.bg_processor.cronJobs.two.failedJobsHistoryLimit | string | `"3"` |  |
| jobs.bg_processor.cronJobs.two.restartPolicy | string | `"OnFailure"` |  |
| jobs.bg_processor.cronJobs.two.schedule | string | `"0 */24 * * *"` |  |
| jobs.bg_processor.cronJobs.two.startingDeadlineSeconds | string | `"300"` |  |
| jobs.bg_processor.cronJobs.two.successfulJobsHistoryLimit | string | `"1"` |  |
| jobs.bg_processor.image.digest | string | `""` |  |
| jobs.bg_processor.image.imagePullSecrets | list | `[]` |  |
| jobs.bg_processor.image.pullPolicy | string | `"Always"` |  |
| jobs.bg_processor.image.registry | string | `"docker.io"` |  |
| jobs.bg_processor.image.repository | string | `"harness/smp-chaos-bg-processor"` |  |
| jobs.bg_processor.image.tag | string | `"1.32.4"` |  |
| lifecycleHooks | object | `{}` |  |
| logWatcherImage.image.digest | string | `""` |  |
| logWatcherImage.image.registry | string | `"docker.io"` |  |
| logWatcherImage.image.repository | string | `"harness/chaos-log-watcher"` |  |
| logWatcherImage.image.tag | string | `"1.50.0"` |  |
| maxSurge | int | `1` |  |
| maxUnavailable | int | `0` |  |
| metrics.metricsPort | string | `"8889"` |  |
| mongoSecrets.password.key | string | `"mongodb-root-password"` |  |
| mongoSecrets.password.name | string | `"mongodb-replicaset-chart"` |  |
| mongoSecrets.userName.key | string | `"mongodbUsername"` |  |
| mongoSecrets.userName.name | string | `"harness-secrets"` |  |
| monitoring.path | string | `"/metrics"` |  |
| monitoring.port | int | `8889` |  |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| pdb.create | bool | `false` |  |
| platform.harness-manager.featureFlags.ADDITIONAL | string | `"CHAOS_ENABLED"` |  |
| platform.harness-manager.featureFlags.OPA | string | `"OPA_PIPELINE_GOVERNANCE"` |  |
| podAnnotations | object | `{}` |  |
| podLabels | object | `{}` |  |
| podSecurityContext | object | `{}` |  |
| rbac.rules | list | `[]` |  |
| replicaCount | int | `1` |  |
| replicaCountSts | int | `0` |  |
| resources.limits.memory | string | `"512Mi"` |  |
| resources.requests.cpu | string | `"600m"` |  |
| resources.requests.memory | string | `"512Mi"` |  |
| secrets.default.APP_AI_SECRET | string | `"dummy"` |  |
| secrets.default.BASIC_AUTH_PASSWORD | string | `"chaos-admin"` |  |
| secrets.default.BASIC_AUTH_USERNAME | string | `"chaos-admin"` |  |
| secrets.default.CHAOS_SERVICE_JWT_SECRET | string | `"IC04LYMBf1lDP5oeY4hupxd4HJhLmN6azUku3xEbeE3SUx5G3ZYzhbiwVtK4i7AmqyU9OZkwB4v8E9qM"` |  |
| secrets.default.ENTERPRISE_HUB_SECRET | string | `"dummy"` |  |
| secrets.default.ENTERPRISE_HUB_TOKEN | string | `"dummy"` |  |
| secrets.default.FF_SDK_KEY | string | `""` |  |
| secrets.default.JWT_IDENTITY_SERVICE_SECRET | string | `"HVSKUYqD4e5Rxu12hFDdCJKGM64sxgEynvdDhaOHaTHhwwn0K4Ttr0uoOxSsEVYNrUU="` |  |
| secrets.default.JWT_SECRET | string | `"dOkdsVqdRPPRJG31XU0qY4MPqmBBMk0PTAGIKM6O7TGqhjyxScIdJe80mwh5Yb5zF3KxYBHw6B3Lfzlq"` |  |
| secrets.default.LOG_SERVICE_TOKEN | string | `"c76e567a-b341-404d-a8dd-d9738714eb82"` |  |
| secrets.default.NG_JWT_SECRET | string | `"IC04LYMBf1lDP5oeY4hupxd4HJhLmN6azUku3xEbeE3SUx5G3ZYzhbiwVtK4i7AmqyU9OZkwB4v8E9qM"` |  |
| secrets.default.PIPELINE_JWT_SECRET | string | `"IC04LYMBf1lDP5oeY4hupxd4HJhLmN6azUku3xEbeE3SUx5G3ZYzhbiwVtK4i7AmqyU9OZkwB4v8E9qM"` |  |
| secrets.default.SEGMENT_API_KEY | string | `"dummy"` |  |
| secrets.default.SERVICE_DISCOVERY_TOKEN | string | `"IC04LYMBf1lDP5oeY4hupxd4HJhLmN6azUku3xEbeE3SUx5G3ZYzhbiwVtK4i7AmqyU9OZkwB4v8E9qM"` |  |
| secrets.default.SLACK_URL | string | `""` |  |
| secrets.kubernetesSecrets[0].keys.APP_AI_SECRET | string | `""` |  |
| secrets.kubernetesSecrets[0].keys.BASIC_AUTH_PASSWORD | string | `""` |  |
| secrets.kubernetesSecrets[0].keys.BASIC_AUTH_USERNAME | string | `""` |  |
| secrets.kubernetesSecrets[0].keys.CHAOS_SERVICE_JWT_SECRET | string | `""` |  |
| secrets.kubernetesSecrets[0].keys.ENTERPRISE_HUB_SECRET | string | `""` |  |
| secrets.kubernetesSecrets[0].keys.ENTERPRISE_HUB_TOKEN | string | `""` |  |
| secrets.kubernetesSecrets[0].keys.FF_SDK_KEY | string | `""` |  |
| secrets.kubernetesSecrets[0].keys.JWT_IDENTITY_SERVICE_SECRET | string | `""` |  |
| secrets.kubernetesSecrets[0].keys.JWT_SECRET | string | `""` |  |
| secrets.kubernetesSecrets[0].keys.LOG_SERVICE_TOKEN | string | `""` |  |
| secrets.kubernetesSecrets[0].keys.NG_JWT_SECRET | string | `""` |  |
| secrets.kubernetesSecrets[0].keys.PIPELINE_JWT_SECRET | string | `""` |  |
| secrets.kubernetesSecrets[0].keys.SEGMENT_API_KEY | string | `""` |  |
| secrets.kubernetesSecrets[0].keys.SERVICE_DISCOVERY_TOKEN | string | `""` |  |
| secrets.kubernetesSecrets[0].keys.SLACK_URL | string | `""` |  |
| secrets.kubernetesSecrets[0].secretName | string | `""` |  |
| secrets.secretManagement.externalSecretsOperator[0].remoteKeys.APP_AI_SECRET.name | string | `""` |  |
| secrets.secretManagement.externalSecretsOperator[0].remoteKeys.APP_AI_SECRET.property | string | `""` |  |
| secrets.secretManagement.externalSecretsOperator[0].remoteKeys.BASIC_AUTH_PASSWORD.name | string | `""` |  |
| secrets.secretManagement.externalSecretsOperator[0].remoteKeys.BASIC_AUTH_PASSWORD.property | string | `""` |  |
| secrets.secretManagement.externalSecretsOperator[0].remoteKeys.BASIC_AUTH_USERNAME.name | string | `""` |  |
| secrets.secretManagement.externalSecretsOperator[0].remoteKeys.BASIC_AUTH_USERNAME.property | string | `""` |  |
| secrets.secretManagement.externalSecretsOperator[0].remoteKeys.CHAOS_SERVICE_JWT_SECRET.name | string | `""` |  |
| secrets.secretManagement.externalSecretsOperator[0].remoteKeys.CHAOS_SERVICE_JWT_SECRET.property | string | `""` |  |
| secrets.secretManagement.externalSecretsOperator[0].remoteKeys.ENTERPRISE_HUB_SECRET.name | string | `""` |  |
| secrets.secretManagement.externalSecretsOperator[0].remoteKeys.ENTERPRISE_HUB_SECRET.property | string | `""` |  |
| secrets.secretManagement.externalSecretsOperator[0].remoteKeys.ENTERPRISE_HUB_TOKEN.name | string | `""` |  |
| secrets.secretManagement.externalSecretsOperator[0].remoteKeys.ENTERPRISE_HUB_TOKEN.property | string | `""` |  |
| secrets.secretManagement.externalSecretsOperator[0].remoteKeys.FF_SDK_KEY.name | string | `""` |  |
| secrets.secretManagement.externalSecretsOperator[0].remoteKeys.FF_SDK_KEY.property | string | `""` |  |
| secrets.secretManagement.externalSecretsOperator[0].remoteKeys.JWT_IDENTITY_SERVICE_SECRET.name | string | `""` |  |
| secrets.secretManagement.externalSecretsOperator[0].remoteKeys.JWT_IDENTITY_SERVICE_SECRET.property | string | `""` |  |
| secrets.secretManagement.externalSecretsOperator[0].remoteKeys.JWT_SECRET.name | string | `""` |  |
| secrets.secretManagement.externalSecretsOperator[0].remoteKeys.JWT_SECRET.property | string | `""` |  |
| secrets.secretManagement.externalSecretsOperator[0].remoteKeys.LOG_SERVICE_TOKEN.name | string | `""` |  |
| secrets.secretManagement.externalSecretsOperator[0].remoteKeys.LOG_SERVICE_TOKEN.property | string | `""` |  |
| secrets.secretManagement.externalSecretsOperator[0].remoteKeys.NG_JWT_SECRET.name | string | `""` |  |
| secrets.secretManagement.externalSecretsOperator[0].remoteKeys.NG_JWT_SECRET.property | string | `""` |  |
| secrets.secretManagement.externalSecretsOperator[0].remoteKeys.PIPELINE_JWT_SECRET.name | string | `""` |  |
| secrets.secretManagement.externalSecretsOperator[0].remoteKeys.PIPELINE_JWT_SECRET.property | string | `""` |  |
| secrets.secretManagement.externalSecretsOperator[0].remoteKeys.SEGMENT_API_KEY.name | string | `""` |  |
| secrets.secretManagement.externalSecretsOperator[0].remoteKeys.SEGMENT_API_KEY.property | string | `""` |  |
| secrets.secretManagement.externalSecretsOperator[0].remoteKeys.SERVICE_DISCOVERY_TOKEN.name | string | `""` |  |
| secrets.secretManagement.externalSecretsOperator[0].remoteKeys.SERVICE_DISCOVERY_TOKEN.property | string | `""` |  |
| secrets.secretManagement.externalSecretsOperator[0].remoteKeys.SLACK_URL.name | string | `""` |  |
| secrets.secretManagement.externalSecretsOperator[0].remoteKeys.SLACK_URL.property | string | `""` |  |
| secrets.secretManagement.externalSecretsOperator[0].secretStore.kind | string | `""` |  |
| secrets.secretManagement.externalSecretsOperator[0].secretStore.name | string | `""` |  |
| securityContext | object | `{}` |  |
| service.annotations | object | `{}` |  |
| service.grpcport | int | `8081` |  |
| service.port | int | `8080` |  |
| service.targetgrpcport | int | `8081` |  |
| service.targetport | int | `8080` |  |
| service.type | string | `"ClusterIP"` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.create | bool | `false` |  |
| serviceAccount.name | string | `"harness-default"` |  |
| timescaledb.hosts | list | `[]` | TimescaleDB host names |
| timescaledb.secrets | object | `{"kubernetesSecrets":[{"keys":{"TIMESCALEDB_PASSWORD":"","TIMESCALEDB_SSL_ROOT_CERT":"","TIMESCALEDB_USERNAME":""},"secretName":""}],"secretManagement":{"externalSecretsOperator":[{"remoteKeys":{"TIMESCALEDB_PASSWORD":{"name":"","property":""},"TIMESCALEDB_SSL_ROOT_CERT":{"name":"","property":""},"TIMESCALEDB_USERNAME":{"name":"","property":""}},"secretStore":{"kind":"","name":""}}]}}` | TimescaleDB secrets |
| tolerations | list | `[]` |  |
| virtualService.annotations | object | `{}` |  |
| virtualService.objects[0].name | string | `"chaos-manager-service"` |  |
| virtualService.objects[0].pathMatchType | string | `"prefix"` |  |
| virtualService.objects[0].pathRewrite | string | `"/"` |  |
| virtualService.objects[0].paths[0].backend.service.name | string | `"chaos-manager-service"` |  |
| virtualService.objects[0].paths[0].path | string | `"{{ .Values.global.istio.virtualService.pathPrefix }}/chaos/manager/api/"` |  |
| virtualService.objects[0].paths[1].backend.service.name | string | `"chaos-manager-service"` |  |
| virtualService.objects[0].paths[1].path | string | `"{{ .Values.global.istio.virtualService.pathPrefix }}/chaos/manager/api"` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.11.0](https://github.com/norwoodj/helm-docs/releases/v1.11.0)
