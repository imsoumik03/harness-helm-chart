# chaos-k8s-ifs

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
| argoWorkflowControllerImage.image.digest | string | `""` |  |
| argoWorkflowControllerImage.image.registry | string | `"docker.io"` |  |
| argoWorkflowControllerImage.image.repository | string | `"harness/chaos-workflow-controller"` |  |
| argoWorkflowControllerImage.image.tag | string | `"v3.4.16"` |  |
| argoWorkflowExecutorImage.image.digest | string | `""` |  |
| argoWorkflowExecutorImage.image.registry | string | `"docker.io"` |  |
| argoWorkflowExecutorImage.image.repository | string | `"harness/chaos-argoexec"` |  |
| argoWorkflowExecutorImage.image.tag | string | `"v3.4.16"` |  |
| autoscaling.enabled | bool | `false` |  |
| autoscaling.targetCPU | string | `""` |  |
| autoscaling.targetMemory | string | `""` |  |
| chaosGoRunnerBaseImage.image.digest | string | `""` |  |
| chaosGoRunnerBaseImage.image.registry | string | `"docker.io"` |  |
| chaosGoRunnerBaseImage.image.repository | string | `"harness/chaos-go-runner-base"` |  |
| chaosGoRunnerBaseImage.image.tag | string | `"1.50.0"` |  |
| chaosGoRunnerImage.image.digest | string | `""` |  |
| chaosGoRunnerImage.image.registry | string | `"docker.io"` |  |
| chaosGoRunnerImage.image.repository | string | `"harness/chaos-go-runner"` |  |
| chaosGoRunnerImage.image.tag | string | `"1.50.0"` |  |
| chaosGoRunnerIoImage.image.digest | string | `""` |  |
| chaosGoRunnerIoImage.image.registry | string | `"docker.io"` |  |
| chaosGoRunnerIoImage.image.repository | string | `"harness/chaos-go-runner-io"` |  |
| chaosGoRunnerIoImage.image.tag | string | `"1.50.0"` |  |
| chaosGoRunnerTimeImage.image.digest | string | `""` |  |
| chaosGoRunnerTimeImage.image.registry | string | `"docker.io"` |  |
| chaosGoRunnerTimeImage.image.repository | string | `"harness/chaos-go-runner-time"` |  |
| chaosGoRunnerTimeImage.image.tag | string | `"1.50.0"` |  |
| config.ACCESS_CONTROL_ENDPOINT | string | `"http://access-control:9006/api"` |  |
| config.ARGO_WORKFLOW_CONTROLLER_IMAGE | string | `"{{ include \"chaos-k8s-ifs.argoWorkflowControllerImage\" . }}"` |  |
| config.ARGO_WORKFLOW_EXECUTOR_IMAGE | string | `"{{ include \"chaos-k8s-ifs.argoWorkflowExecutorImage\" . }}"` |  |
| config.CG_MANAGER_ENDPOINT | string | `"http://harness-manager:9090"` |  |
| config.CHAOS_GO_RUNNER_BASE_IMAGE | string | `"{{ include \"chaos-k8s-ifs.chaosGoRunnerBaseImage\" . }}"` |  |
| config.CHAOS_GO_RUNNER_IMAGE | string | `"{{ include \"chaos-k8s-ifs.chaosGoRunnerImage\" . }}"` |  |
| config.CHAOS_GO_RUNNER_IO_IMAGE | string | `"{{ include \"chaos-k8s-ifs.chaosGoRunnerIoImage\" . }}"` |  |
| config.CHAOS_GO_RUNNER_TIME_IMAGE | string | `"{{ include \"chaos-k8s-ifs.chaosGoRunnerTimeImage\" . }}"` |  |
| config.CHAOS_IMAGEREGISTRY_DEV | string | `"false"` |  |
| config.CHAOS_MANAGER_ENDPOINT | string | `"http://chaos-manager-service:8080"` |  |
| config.CHAOS_MANAGER_GRPC_ENDPOINT | string | `"chaos-manager-service:8081"` |  |
| config.CHAOS_V2_ONBOARDING | string | `"true"` |  |
| config.DDCR_IMAGE | string | `"{{ include \"chaos-k8s-ifs.ddcrImage\" . }}"` |  |
| config.DEFAULT_CHAOS_EXPERIMENT_LIMIT | string | `"2000"` |  |
| config.DEFAULT_CHAOS_EXPERIMENT_RUN_LIMIT | string | `"100000"` |  |
| config.DEFAULT_CHAOS_GAMEDAY_LIMIT | string | `"200"` |  |
| config.DEFAULT_CHAOS_HUB_LIMIT | string | `"30"` |  |
| config.DEFAULT_CHAOS_HUB_SIZE | string | `"200"` |  |
| config.DEFAULT_DDCR_FAULT_IMAGE | string | `"{{ include \"chaos-k8s-ifs.ddcrFaultsImage\" . }}"` |  |
| config.DEFAULT_DDCR_IMAGE | string | `"{{ include \"chaos-k8s-ifs.ddcrImage\" . }}"` |  |
| config.DEFAULT_DDCR_LIB_IMAGE | string | `"{{ include \"chaos-k8s-ifs.ddcrLibImage\" . }}"` |  |
| config.DEFAULT_EXPERIMENTS_PER_GAME_DAY_RUN_LIMIT | string | `"20"` |  |
| config.DEFAULT_GAME_DAY_RUNS_PER_GAME_DAY_LIMIT | string | `"1000"` |  |
| config.DEFAULT_PARALLEL_CHAOS_EXPERIMENT_RUNS | string | `"500"` |  |
| config.FF_CLIENT_CONFIG_URL | string | `""` |  |
| config.FF_CLIENT_EVENT_URL | string | `""` |  |
| config.INFRA_COMPATIBLE_VERSIONS | string | `"[\"0.13.0\",\"0.14.0\",\"1.15.0\",\"1.16.0\",\"1.17.0\",\"1.18.0\",\"1.19.0\",\"1.20.0\",\"1.21.0\",\"1.22.0\",\"1.23.0\",\"1.24.0\",\"1.25.0\",\"1.26.0\",\"1.27.0\",\"1.28.0\",\"1.29.0\",\"1.30.0\",\"1.31.0\",\"1.32.0\",\"1.33.0\",\"1.34.0\",\"1.35.0\",\"1.36.0\",\"1.37.0\",\"1.38.0\",\"1.39.0\",\"1.40.0\",\"1.41.0\", \"1.42.0\",\"1.43.0\",\"1.44.0\",\"1.45.0\",\"1.46.0\",\"1.47.0\",\"1.48.0\",\"1.49.0\",\"1.50.0\"]"` |  |
| config.INFRA_DEPLOYMENTS | string | `"[\"app=chaos-exporter\", \"name=chaos-operator\", \"app=workflow-controller\"]"` |  |
| config.INFRA_HEALTH_CHECK_TIMEOUT | string | `"900000"` |  |
| config.K8S_IFS_VERSION | string | `"1.50.0"` |  |
| config.K8S_INFRASTRUCTURE_UPGRADER_IMAGE | string | `"{{ include \"chaos-k8s-ifs.k8sInfraUpgraderImage\" . }}"` |  |
| config.K8S_INFRA_CONNECTION_TYPE | string | `"https"` |  |
| config.LITMUS_CHAOS_EXPORTER_IMAGE | string | `"{{ include \"chaos-k8s-ifs.litmusChaosExporterImage\" . }}"` |  |
| config.LITMUS_CHAOS_OPERATOR_IMAGE | string | `"{{ include \"chaos-k8s-ifs.litmusChaosOperatorImage\" . }}"` |  |
| config.LITMUS_CHAOS_RUNNER_IMAGE | string | `"{{ include \"chaos-k8s-ifs.litmusChaosRunnerImage\" . }}"` |  |
| config.LOG_SERVICE_ENDPOINT | string | `"http://log-service:8079"` |  |
| config.LOG_SERVICE_EXTERNAL_ENDPOINT | string | `"{{ .Values.global.loadbalancerURL }}/gateway/log-service"` |  |
| config.LOG_WATCHER_IMAGE | string | `"{{ include \"chaos-k8s-ifs.logWatcherImage\" . }}"` |  |
| config.METRIC_PORT | string | `"{{ .Values.metrics.metricsPort }}"` |  |
| config.NG_MANAGER_ENDPOINT | string | `"http://ng-manager:7090"` |  |
| config.PORTAL_ENDPOINT | string | `"{{ .Values.global.loadbalancerURL }}/chaos/kserver/api"` |  |
| config.REDIS_CACHE_CERT_PATH | string | `""` |  |
| config.REDIS_CACHE_DATABASE | string | `"0"` |  |
| config.REDIS_CACHE_ENDPOINT | string | `"{{ include \"harnesscommon.dbv3.redisConnection\" (dict \"ctx\" $ \"database\" \"cache\") }}"` |  |
| config.REDIS_CACHE_NAMESPACE | string | `""` |  |
| config.REDIS_CACHE_SSL_ENABLED | string | `""` |  |
| config.SKIP_SECURE_VERIFY | string | `"true"` |  |
| config.SUBSCRIBER_IMAGE | string | `"{{ include \"chaos-k8s-ifs.subscriberImage\" . }}"` |  |
| config.USE_LEGACY_FEATURE_FLAGS | string | `"true"` |  |
| configmap | object | `{}` |  |
| customTlsCert | string | `""` |  |
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
| extraVolumeMounts | list | `[]` |  |
| extraVolumes | list | `[]` |  |
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
| global.monitoring.path | string | `"/metrics"` |  |
| global.monitoring.port | int | `8889` |  |
| global.opa.enabled | bool | `false` |  |
| global.pdb.create | bool | `false` |  |
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
| image.repository | string | `"harness/smp-chaos-k8s-ifs-signed"` |  |
| image.tag | string | `"1.30.0"` |  |
| ingress.objects[0].annotations."nginx.ingress.kubernetes.io/proxy-read-timeout" | string | `"300"` |  |
| ingress.objects[0].annotations."nginx.ingress.kubernetes.io/rewrite-target" | string | `"/$2"` |  |
| ingress.objects[0].annotations."nginx.ingress.kubernetes.io/use-regex" | string | `"true"` |  |
| ingress.objects[0].paths[0].backend.service.name | string | `"chaos-k8s-ifs-service"` |  |
| ingress.objects[0].paths[0].path | string | `"{{ .Values.global.ingress.pathPrefix }}/chaos/kserver/api(/|$)(.*)"` |  |
| k8sInfraUpgraderImage.image.digest | string | `""` |  |
| k8sInfraUpgraderImage.image.registry | string | `"docker.io"` |  |
| k8sInfraUpgraderImage.image.repository | string | `"harness/k8s-chaos-infrastructure-upgrader"` |  |
| k8sInfraUpgraderImage.image.tag | string | `"1.50.0"` |  |
| lifecycleHooks | object | `{}` |  |
| litmusChaosExporterImage.image.digest | string | `""` |  |
| litmusChaosExporterImage.image.registry | string | `"docker.io"` |  |
| litmusChaosExporterImage.image.repository | string | `"harness/chaos-exporter"` |  |
| litmusChaosExporterImage.image.tag | string | `"1.50.0"` |  |
| litmusChaosOperatorImage.image.digest | string | `""` |  |
| litmusChaosOperatorImage.image.registry | string | `"docker.io"` |  |
| litmusChaosOperatorImage.image.repository | string | `"harness/chaos-operator"` |  |
| litmusChaosOperatorImage.image.tag | string | `"1.50.0"` |  |
| litmusChaosRunnerImage.image.digest | string | `""` |  |
| litmusChaosRunnerImage.image.registry | string | `"docker.io"` |  |
| litmusChaosRunnerImage.image.repository | string | `"harness/chaos-runner"` |  |
| litmusChaosRunnerImage.image.tag | string | `"1.50.0"` |  |
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
| resources.limits.memory | string | `"512Mi"` |  |
| resources.requests.cpu | string | `"401m"` |  |
| resources.requests.memory | string | `"512Mi"` |  |
| secrets.default.CHAOS_SERVICE_JWT_SECRET | string | `"IC04LYMBf1lDP5oeY4hupxd4HJhLmN6azUku3xEbeE3SUx5G3ZYzhbiwVtK4i7AmqyU9OZkwB4v8E9qM"` |  |
| secrets.default.FF_SDK_KEY | string | `"dummy"` |  |
| secrets.default.JWT_IDENTITY_SERVICE_SECRET | string | `"HVSKUYqD4e5Rxu12hFDdCJKGM64sxgEynvdDhaOHaTHhwwn0K4Ttr0uoOxSsEVYNrUU="` |  |
| secrets.default.JWT_SECRET | string | `"dOkdsVqdRPPRJG31XU0qY4MPqmBBMk0PTAGIKM6O7TGqhjyxScIdJe80mwh5Yb5zF3KxYBHw6B3Lfzlq"` |  |
| secrets.default.LOG_SERVICE_TOKEN | string | `"c76e567a-b341-404d-a8dd-d9738714eb82"` |  |
| secrets.default.NG_JWT_SECRET | string | `"IC04LYMBf1lDP5oeY4hupxd4HJhLmN6azUku3xEbeE3SUx5G3ZYzhbiwVtK4i7AmqyU9OZkwB4v8E9qM"` |  |
| secrets.default.SEGMENT_API_KEY | string | `"dummy"` |  |
| secrets.kubernetesSecrets[0].keys.CHAOS_SERVICE_JWT_SECRET | string | `""` |  |
| secrets.kubernetesSecrets[0].keys.FF_SDK_KEY | string | `""` |  |
| secrets.kubernetesSecrets[0].keys.JWT_IDENTITY_SERVICE_SECRET | string | `""` |  |
| secrets.kubernetesSecrets[0].keys.JWT_SECRET | string | `""` |  |
| secrets.kubernetesSecrets[0].keys.LOG_SERVICE_TOKEN | string | `""` |  |
| secrets.kubernetesSecrets[0].keys.NG_JWT_SECRET | string | `""` |  |
| secrets.kubernetesSecrets[0].keys.SEGMENT_API_KEY | string | `""` |  |
| secrets.kubernetesSecrets[0].secretName | string | `""` |  |
| secrets.secretManagement.externalSecretsOperator[0].remoteKeys.CHAOS_SERVICE_JWT_SECRET.name | string | `""` |  |
| secrets.secretManagement.externalSecretsOperator[0].remoteKeys.CHAOS_SERVICE_JWT_SECRET.property | string | `""` |  |
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
| secrets.secretManagement.externalSecretsOperator[0].remoteKeys.SEGMENT_API_KEY.name | string | `""` |  |
| secrets.secretManagement.externalSecretsOperator[0].remoteKeys.SEGMENT_API_KEY.property | string | `""` |  |
| secrets.secretManagement.externalSecretsOperator[0].secretStore.kind | string | `""` |  |
| secrets.secretManagement.externalSecretsOperator[0].secretStore.name | string | `""` |  |
| securityContext | object | `{}` |  |
| service.annotations | object | `{}` |  |
| service.port | int | `6000` |  |
| service.targetport | int | `6000` |  |
| service.type | string | `"ClusterIP"` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.create | bool | `false` |  |
| serviceAccount.name | string | `"harness-default"` |  |
| subscriberImage.image.digest | string | `""` |  |
| subscriberImage.image.registry | string | `"docker.io"` |  |
| subscriberImage.image.repository | string | `"harness/chaos-subscriber"` |  |
| subscriberImage.image.tag | string | `"1.50.0"` |  |
| tolerations | list | `[]` |  |
| virtualService.annotations | object | `{}` |  |
| virtualService.objects[0].name | string | `"chaos-k8s-ifs-vs"` |  |
| virtualService.objects[0].pathMatchType | string | `"prefix"` |  |
| virtualService.objects[0].pathRewrite | string | `"/"` |  |
| virtualService.objects[0].paths[0].backend.service.name | string | `"chaos-k8s-ifs-service"` |  |
| virtualService.objects[0].paths[0].path | string | `"{{ .Values.global.istio.virtualService.pathPrefix }}/chaos/kserver/api/"` |  |
| virtualService.objects[0].paths[1].backend.service.name | string | `"chaos-k8s-ifs-service"` |  |
| virtualService.objects[0].paths[1].path | string | `"{{ .Values.global.istio.virtualService.pathPrefix }}/chaos/kserver/api"` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.11.0](https://github.com/norwoodj/helm-docs/releases/v1.11.0)
