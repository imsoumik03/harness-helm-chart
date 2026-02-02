# harness-manager

![Version: 2.12.3](https://img.shields.io/badge/Version-2.12.3-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.0.81725](https://img.shields.io/badge/AppVersion-0.0.81725-informational?style=flat-square)

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
| allowedOrigins | string | `""` |  |
| appLogLevel | string | `"INFO"` |  |
| autoscaling.enabled | bool | `false` |  |
| autoscaling.maxReplicas | int | `100` |  |
| autoscaling.minReplicas | int | `2` |  |
| autoscaling.targetCPU | string | `""` |  |
| autoscaling.targetMemory | string | `""` |  |
| config.ALLOWED_ORIGINS | string | `"{{ .Values.allowedOrigins | default .Values.global.loadbalancerURL }}"` |  |
| config.API_URL | string | `"{{  .Values.global.loadbalancerURL }}"` |  |
| config.ATMOSPHERE_ASYNC_WRITE_THREADPOOL_MAXSIZE | string | `"40"` |  |
| config.ATMOSPHERE_BACKEND | string | `"REDIS"` |  |
| config.ATMOSPHERE_MESSAGE_PROCESSING_THREADPOOL_MAXSIZE | string | `"40"` |  |
| config.BACKGROUND_SCHEDULER_CLUSTERED | string | `"true"` |  |
| config.CACHE_BACKEND | string | `"REDIS"` |  |
| config.CAPSULE_JAR | string | `"rest-capsule.jar"` |  |
| config.DELEGATE_METADATA_URL | string | `"{{  .Values.global.loadbalancerURL }}/storage/wingsdelegates/delegateprod.txt"` |  |
| config.DELEGATE_SERVICE_AUTHORITY | string | `"harness-manager:9879"` |  |
| config.DELEGATE_SERVICE_TARGET | string | `"harness-manager:9879"` |  |
| config.DELEGATE_TASK_REBROADCAST_ITERATOR_THREAD_COUNT | string | `"2"` |  |
| config.DEPLOY_MODE | string | `"KUBERNETES_ONPREM"` |  |
| config.DISABLE_INSTANCE_SYNC_ITERATOR | string | `"true"` |  |
| config.DISABLE_NEW_RELIC | string | `"true"` |  |
| config.DISTRIBUTED_LOCK_IMPLEMENTATION | string | `"REDIS"` |  |
| config.ENABLE_CRONS | string | `"true"` |  |
| config.ENABLE_G1GC | string | `"true"` |  |
| config.ENABLE_ITERATORS | string | `"true"` |  |
| config.EVENTS_FRAMEWORK_AVAILABLE_IN_ONPREM | string | `"true"` |  |
| config.EVENTS_FRAMEWORK_REDIS_SENTINELS | string | `"{{ include \"harnesscommon.dbv3.redisConnection\" (dict \"ctx\" $ \"database\" \"events\") }}"` |  |
| config.EVENTS_FRAMEWORK_REDIS_URL | string | `"{{ include \"harnesscommon.dbv3.redisConnection\" (dict \"ctx\" $ \"database\" \"events\") }}"` |  |
| config.EVENTS_FRAMEWORK_SENTINEL_MASTER_NAME | string | `"harness-redis"` |  |
| config.EVENTS_FRAMEWORK_USE_SENTINEL | string | `"{{ .Values.global.database.redis.installed }}"` |  |
| config.EXTERNAL_GRAPHQL_RATE_LIMIT | string | `"{{ .Values.external_graphql_rate_limit }}"` |  |
| config.FAIL_DELEGATE_TASK_ITERATOR_THREAD_COUNT | string | `"2"` |  |
| config.FEATURES | string | `"{{ include \"harness-manager.ffString\" . }}"` |  |
| config.FEATURE_FLAG_SYSTEM | string | `"LOCAL"` |  |
| config.GENERAL_CONSUMER_COUNT | string | `"2"` |  |
| config.GITOPS_SERVICE_CLIENT_BASEURL | string | `"http://gitops:7908/api/v1/"` |  |
| config.HARNESS_ENABLE_NG_AUTH_UI_PLACEHOLDER | string | `"true"` |  |
| config.HAZELCAST_NAMESPACE | string | `"{{ .Release.Namespace }}"` |  |
| config.HAZELCAST_SERVICE | string | `"harness-manager"` |  |
| config.HZ_CLUSTER_NAME | string | `"harness-manager"` |  |
| config.IMMUTABLE_DELEGATE_DOCKER_IMAGE | string | `"{{ include \"harness-manager.immutable_delegate_docker_image\" . }}"` |  |
| config.IMMUTABLE_DELEGATE_ENABLED | string | `"{{ .Values.global.useImmutableDelegate }}"` |  |
| config.INTERNAL_DELEGATE_SERVICE_AUTHORITY | string | `"harness-manager:9879"` |  |
| config.INTERNAL_DELEGATE_SERVICE_TARGET | string | `"harness-manager:9879"` |  |
| config.ITERATOR_CONFIG_PATH | string | `"/opt/harness/config"` |  |
| config.LOCK_NOTIFY_RESPONSE_CLEANUP | string | `"true"` |  |
| config.LOGGING_LEVEL | string | `"{{ .Values.appLogLevel }}"` |  |
| config.LOG_STREAMING_SERVICE_BASEURL | string | `"http://log-service.{{ .Release.Namespace }}.svc.cluster.local:8079/"` |  |
| config.LOG_STREAMING_SERVICE_EXTERNAL_URL | string | `"{{ .Values.global.loadbalancerURL }}/log-service/"` |  |
| config.MALLOC_ARENA_MAX | string | `"4"` |  |
| config.MEMORY | string | `"{{ .Values.java.memory }}"` |  |
| config.MONGO_MAX_DOCUMENT_LIMIT | string | `"30000"` |  |
| config.MONGO_MAX_OPERATION_TIME_IN_MILLIS | string | `"60000"` |  |
| config.NG_MANAGER_AVAILABLE | string | `"true"` |  |
| config.NOTIFY_CONSUMER_COUNT | string | `"2"` |  |
| config.PERPETUAL_TASK_ASSIGNMENT_ITERATOR_THREAD_COUNT | string | `"4"` |  |
| config.PERPETUAL_TASK_REBALANCE_ITERATOR_THREAD_COUNT | string | `"2"` |  |
| config.PUBLISH_DELEGATE_TASK_METRICS | string | `"false"` |  |
| config.REDIS_CONNECTION_MINIMUM_IDLE_SIZE | string | `"32"` |  |
| config.REDIS_MASTER_NAME | string | `"harness-redis"` |  |
| config.REDIS_NETTY_THREADS | string | `"{{ .Values.redisConfig.nettyThreads }}"` |  |
| config.REDIS_SENTINEL | string | `"{{ .Values.global.database.redis.installed }}"` |  |
| config.REDIS_SENTINELS | string | `"{{ include \"harnesscommon.dbconnectionv2.redisConnection\" (dict \"context\" $) }}"` |  |
| config.REDIS_SUBSCRIPTIONS_PER_CONNECTION | string | `"10"` |  |
| config.REDIS_SUBSCRIPTION_CONNECTION_POOL_SIZE | string | `"100"` |  |
| config.REDIS_URL | string | `"{{ include \"harnesscommon.dbv3.redisConnection\" (dict \"ctx\" $ \"database\" \"lock\") }}"` |  |
| config.SEARCH_ENABLED | string | `"false"` |  |
| config.SERVER_PORT | string | `"9090"` |  |
| config.SERVICE_ACC | string | `"/opt/harness/svc/service_acc.json"` |  |
| config.STACK_DRIVER_LOGGING_ENABLED | string | `"{{ .Values.global.stackDriverLoggingEnabled }}"` |  |
| config.TIMESCALEDB_HEALTH_CHECK_NEEDED | string | `"false"` |  |
| config.UI_SERVER_URL | string | `"{{  .Values.global.loadbalancerURL }}"` |  |
| config.UPGRADER_DOCKER_IMAGE | string | `"{{ include \"harness-manager.upgrader_docker_image\" . }}"` |  |
| config.USE_GLOBAL_KMS_AS_BASE_ALGO | string | `"false"` |  |
| config.USE_WORKLOAD_IDENTITY | string | `"true"` |  |
| config.VERSION | string | `"{{ .Values.version }}"` |  |
| config.WATCHER_METADATA_URL | string | `"{{  .Values.global.loadbalancerURL }}/storage/wingswatchers/watcherprod.txt"` |  |
| database.mongo.dmsharness.enabled | bool | `false` |  |
| database.mongo.dmsharness.extraArgs | string | `""` |  |
| database.mongo.dmsharness.hosts | list | `[]` |  |
| database.mongo.dmsharness.protocol | string | `""` |  |
| database.mongo.dmsharness.secrets.kubernetesSecrets[0].keys.MONGO_PASSWORD | string | `""` |  |
| database.mongo.dmsharness.secrets.kubernetesSecrets[0].keys.MONGO_USER | string | `""` |  |
| database.mongo.dmsharness.secrets.kubernetesSecrets[0].secretName | string | `""` |  |
| database.mongo.dmsharness.secrets.secretManagement.externalSecretsOperator[0].remoteKeys.MONGO_PASSWORD.name | string | `""` |  |
| database.mongo.dmsharness.secrets.secretManagement.externalSecretsOperator[0].remoteKeys.MONGO_PASSWORD.property | string | `""` |  |
| database.mongo.dmsharness.secrets.secretManagement.externalSecretsOperator[0].remoteKeys.MONGO_USER.name | string | `""` |  |
| database.mongo.dmsharness.secrets.secretManagement.externalSecretsOperator[0].remoteKeys.MONGO_USER.property | string | `""` |  |
| database.mongo.dmsharness.secrets.secretManagement.externalSecretsOperator[0].secretStore.kind | string | `""` |  |
| database.mongo.dmsharness.secrets.secretManagement.externalSecretsOperator[0].secretStore.name | string | `""` |  |
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
| database.mongo.harness.enabled | bool | `false` |  |
| database.mongo.harness.extraArgs | string | `""` |  |
| database.mongo.harness.hosts | list | `[]` |  |
| database.mongo.harness.protocol | string | `""` |  |
| database.mongo.harness.secrets.kubernetesSecrets[0].keys.MONGO_PASSWORD | string | `""` |  |
| database.mongo.harness.secrets.kubernetesSecrets[0].keys.MONGO_USER | string | `""` |  |
| database.mongo.harness.secrets.kubernetesSecrets[0].secretName | string | `""` |  |
| database.mongo.harness.secrets.secretManagement.externalSecretsOperator[0].remoteKeys.MONGO_PASSWORD.name | string | `""` |  |
| database.mongo.harness.secrets.secretManagement.externalSecretsOperator[0].remoteKeys.MONGO_PASSWORD.property | string | `""` |  |
| database.mongo.harness.secrets.secretManagement.externalSecretsOperator[0].remoteKeys.MONGO_USER.name | string | `""` |  |
| database.mongo.harness.secrets.secretManagement.externalSecretsOperator[0].remoteKeys.MONGO_USER.property | string | `""` |  |
| database.mongo.harness.secrets.secretManagement.externalSecretsOperator[0].secretStore.kind | string | `""` |  |
| database.mongo.harness.secrets.secretManagement.externalSecretsOperator[0].secretStore.name | string | `""` |  |
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
| delegate_docker_image.image.digest | string | `""` |  |
| delegate_docker_image.image.registry | string | `"docker.io"` |  |
| delegate_docker_image.image.repository | string | `"harness/delegate"` |  |
| delegate_docker_image.image.tag | string | `"latest"` |  |
| external_graphql_rate_limit | string | `"500"` |  |
| extraEnvVars | list | `[]` |  |
| extraVolumeMounts | list | `[]` |  |
| extraVolumes | list | `[]` |  |
| featureFlags | object | `{"ADDITIONAL":"","Base":"ASYNC_ARTIFACT_COLLECTION,JIRA_INTEGRATION,AUDIT_TRAIL_UI,GDS_TIME_SERIES_SAVE_PER_MINUTE,STACKDRIVER_SERVICEGUARD,TIME_SERIES_SERVICEGUARD_V2,TIME_SERIES_WORKFLOW_V2,CUSTOM_DASHBOARD,GRAPHQL,CV_FEEDBACKS,LOGS_V2_247,UPGRADE_JRE,LOG_STREAMING_INTEGRATION,NG_HARNESS_APPROVAL,GIT_SYNC_NG,NG_CG_TASK_ASSIGNMENT_ISOLATION,AZURE_CLOUD_PROVIDER_VALIDATION_ON_DELEGATE,TERRAFORM_AWS_CP_AUTHENTICATION,NG_TEMPLATES,NEW_DEPLOYMENT_FREEZE,HELM_CHART_AS_ARTIFACT,RESOLVE_DEPLOYMENT_TAGS_BEFORE_EXECUTION,WEBHOOK_TRIGGER_AUTHORIZATION,GITHUB_WEBHOOK_AUTHENTICATION,CUSTOM_MANIFEST,GIT_ACCOUNT_SUPPORT,AZURE_WEBAPP,POLLING_INTERVAL_CONFIGURABLE,APPLICATION_DROPDOWN_MULTISELECT,RESOURCE_CONSTRAINT_SCOPE_PIPELINE_ENABLED,NG_TEMPLATE_GITX,ELK_HEALTH_SOURCE,CVNG_METRIC_THRESHOLD,SRM_HOST_SAMPLING_ENABLE,SRM_ENABLE_HEALTHSOURCE_CLOUDWATCH_METRICS,CDS_SHELL_VARIABLES_EXPORT,CDS_TAS_NG,CD_TRIGGER_V2,CDS_NG_TRIGGER_MULTI_ARTIFACTS,ACCOUNT_BASIC_ROLE,CD_NG_DOCKER_ARTIFACT_DIGEST,CDS_SERVICE_OVERRIDES_2_0,NG_SVC_ENV_REDESIGN,NG_EXECUTION_INPUT,CDS_SERVICENOW_REFRESH_TOKEN_AUTH,SERVICE_DASHBOARD_V2,CDS_OrgAccountLevelServiceEnvEnvGroup,CDC_SERVICE_DASHBOARD_REVAMP_NG,PL_FORCE_DELETE_CONNECTOR_SECRET,POST_PROD_ROLLBACK,PIE_STATIC_YAML_SCHEMA,SPG_SIDENAV_COLLAPSE,HOSTED_BUILDS,CIE_HOSTED_VMS,ENABLE_K8_BUILDS,CI_OUTPUT_VARIABLES_AS_ENV,CDS_GITHUB_APP_AUTHENTICATION,CDS_REMOVE_TIME_BUCKET_GAPFILL_QUERY,CDS_CONTAINER_STEP_GROUP,CDS_SUPPORT_EXPRESSION_REMOTE_TERRAFORM_VAR_FILES_NG,CDS_AWS_CDK,DISABLE_WINRM_COMMAND_ENCODING_NG,SKIP_ADDING_TRACK_LABEL_SELECTOR_IN_ROLLING,ENABLE_CERT_VALIDATION,CDS_GET_SERVICENOW_STANDARD_TEMPLATE,CDS_ENABLE_NEW_PARAMETER_FIELD_PROCESSOR,SRM_MICRO_FRONTEND,CVNG_TEMPLATE_MONITORED_SERVICE,PIE_ASYNC_FILTER_CREATION,PL_DISCOVERY_ENABLE,PIE_GIT_BI_DIRECTIONAL_SYNC,CDS_METHOD_INVOCATION_NEW_FLOW_EXPRESSION_ENGINE,CD_NG_DYNAMIC_PROVISIONING_ENV_V2,CDS_HELM_MULTIPLE_MANIFEST_SUPPORT_NG,CDS_SERVERLESS_V2,CDP_AWS_SAM,CDS_IMPROVED_HELM_DEPLOYMENT_TRACKING,CDS_K8S_APPLY_MANIFEST_WITHOUT_SERVICE_NG,CDS_HELM_FETCH_CHART_METADATA_NG,CDS_K8S_HELM_INSTANCE_SYNC_V2_NG,USE_K8S_API_FOR_STEADY_STATE_CHECK,CVNG_TEMPLATE_VERIFY_STEP","CCM":"","CD":"CDS_AUTO_APPROVAL,CDS_NG_TRIGGER_SELECTIVE_STAGE_EXECUTION","CDB":"NG_DASHBOARDS","CHAOS":"CHAOS_ENABLED","CI":"CI_INDIRECT_LOG_UPLOAD","DBOPS":"DBOPS_ENABLED,CDS_NAV_2_0","FF":"CFNG_ENABLED","GitOps":"GITOPS_ONPREM_ENABLED,CUSTOM_ARTIFACT_NG,SERVICE_DASHBOARD_V2,OPTIMIZED_GIT_FETCH_FILES,MULTI_SERVICE_INFRA,ENV_GROUP,NG_SVC_ENV_REDESIGN,GITOPS_ORG_LEVEL","IDP":"IDP_ENABLED,IDP_UI_API_BASED_RESTART","LICENSE":"NG_LICENSES_ENABLED,VIEW_USAGE_ENABLED","NG":"ENABLE_DEFAULT_NG_EXPERIENCE_FOR_ONPREM,NEXT_GEN_ENABLED,NEW_LEFT_NAVBAR_SETTINGS,SPG_SIDENAV_COLLAPSE,PL_ENABLE_JIT_USER_PROVISION","OPA":"OPA_PIPELINE_GOVERNANCE,OPA_GIT_GOVERNANCE","SAMLAutoAccept":"AUTO_ACCEPT_SAML_ACCOUNT_INVITES,PL_NO_EMAIL_FOR_SAML_ACCOUNT_INVITES","SDM":"PL_DISCOVERY_ENABLE","SRM":"CVNG_ENABLED","SSCA":"SSCA_ENABLED,SSCA_MANAGER_ENABLED,DEBEZIUM_ENABLED","STO":"STO_BASELINE_REGEX,STO_STEP_PALETTE_BURP_ENTERPRISE,STO_STEP_PALETTE_CODEQL,STO_STEP_PALETTE_FOSSA,STO_STEP_PALETTE_GIT_LEAKS,STO_STEP_PALETTE_SEMGREP"}` | Feature Flags |
| featureFlags.ADDITIONAL | string | `""` | Additional Feature Flag |
| featureFlags.Base | string | `"ASYNC_ARTIFACT_COLLECTION,JIRA_INTEGRATION,AUDIT_TRAIL_UI,GDS_TIME_SERIES_SAVE_PER_MINUTE,STACKDRIVER_SERVICEGUARD,TIME_SERIES_SERVICEGUARD_V2,TIME_SERIES_WORKFLOW_V2,CUSTOM_DASHBOARD,GRAPHQL,CV_FEEDBACKS,LOGS_V2_247,UPGRADE_JRE,LOG_STREAMING_INTEGRATION,NG_HARNESS_APPROVAL,GIT_SYNC_NG,NG_CG_TASK_ASSIGNMENT_ISOLATION,AZURE_CLOUD_PROVIDER_VALIDATION_ON_DELEGATE,TERRAFORM_AWS_CP_AUTHENTICATION,NG_TEMPLATES,NEW_DEPLOYMENT_FREEZE,HELM_CHART_AS_ARTIFACT,RESOLVE_DEPLOYMENT_TAGS_BEFORE_EXECUTION,WEBHOOK_TRIGGER_AUTHORIZATION,GITHUB_WEBHOOK_AUTHENTICATION,CUSTOM_MANIFEST,GIT_ACCOUNT_SUPPORT,AZURE_WEBAPP,POLLING_INTERVAL_CONFIGURABLE,APPLICATION_DROPDOWN_MULTISELECT,RESOURCE_CONSTRAINT_SCOPE_PIPELINE_ENABLED,NG_TEMPLATE_GITX,ELK_HEALTH_SOURCE,CVNG_METRIC_THRESHOLD,SRM_HOST_SAMPLING_ENABLE,SRM_ENABLE_HEALTHSOURCE_CLOUDWATCH_METRICS,CDS_SHELL_VARIABLES_EXPORT,CDS_TAS_NG,CD_TRIGGER_V2,CDS_NG_TRIGGER_MULTI_ARTIFACTS,ACCOUNT_BASIC_ROLE,CD_NG_DOCKER_ARTIFACT_DIGEST,CDS_SERVICE_OVERRIDES_2_0,NG_SVC_ENV_REDESIGN,NG_EXECUTION_INPUT,CDS_SERVICENOW_REFRESH_TOKEN_AUTH,SERVICE_DASHBOARD_V2,CDS_OrgAccountLevelServiceEnvEnvGroup,CDC_SERVICE_DASHBOARD_REVAMP_NG,PL_FORCE_DELETE_CONNECTOR_SECRET,POST_PROD_ROLLBACK,PIE_STATIC_YAML_SCHEMA,SPG_SIDENAV_COLLAPSE,HOSTED_BUILDS,CIE_HOSTED_VMS,ENABLE_K8_BUILDS,CI_OUTPUT_VARIABLES_AS_ENV,CDS_GITHUB_APP_AUTHENTICATION,CDS_REMOVE_TIME_BUCKET_GAPFILL_QUERY,CDS_CONTAINER_STEP_GROUP,CDS_SUPPORT_EXPRESSION_REMOTE_TERRAFORM_VAR_FILES_NG,CDS_AWS_CDK,DISABLE_WINRM_COMMAND_ENCODING_NG,SKIP_ADDING_TRACK_LABEL_SELECTOR_IN_ROLLING,ENABLE_CERT_VALIDATION,CDS_GET_SERVICENOW_STANDARD_TEMPLATE,CDS_ENABLE_NEW_PARAMETER_FIELD_PROCESSOR,SRM_MICRO_FRONTEND,CVNG_TEMPLATE_MONITORED_SERVICE,PIE_ASYNC_FILTER_CREATION,PL_DISCOVERY_ENABLE,PIE_GIT_BI_DIRECTIONAL_SYNC,CDS_METHOD_INVOCATION_NEW_FLOW_EXPRESSION_ENGINE,CD_NG_DYNAMIC_PROVISIONING_ENV_V2,CDS_HELM_MULTIPLE_MANIFEST_SUPPORT_NG,CDS_SERVERLESS_V2,CDP_AWS_SAM,CDS_IMPROVED_HELM_DEPLOYMENT_TRACKING,CDS_K8S_APPLY_MANIFEST_WITHOUT_SERVICE_NG,CDS_HELM_FETCH_CHART_METADATA_NG,CDS_K8S_HELM_INSTANCE_SYNC_V2_NG,USE_K8S_API_FOR_STEADY_STATE_CHECK,CVNG_TEMPLATE_VERIFY_STEP"` | Base flags for all modules(enabled by Default) |
| featureFlags.CCM | string | `""` | CCM Feature Flags (activated when global.ccm is enabled) |
| featureFlags.CD | string | `"CDS_AUTO_APPROVAL,CDS_NG_TRIGGER_SELECTIVE_STAGE_EXECUTION"` | CD Feature Flags (activated when global.cd is enabled) |
| featureFlags.CDB | string | `"NG_DASHBOARDS"` | Custom Dashboard Flags (activated when global.dashboards is enabled) |
| featureFlags.CHAOS | string | `"CHAOS_ENABLED"` | CHAOS Feature Flags (activated when global.chaos is enabled) |
| featureFlags.CI | string | `"CI_INDIRECT_LOG_UPLOAD"` | CI Feature Flags (activated when global.ci is enabled) |
| featureFlags.DBOPS | string | `"DBOPS_ENABLED,CDS_NAV_2_0"` | DBOPS Feature Flag (activated when global.dbops is enabled) |
| featureFlags.FF | string | `"CFNG_ENABLED"` | FF Feature Flags (activated when global.ff is enabled) |
| featureFlags.GitOps | string | `"GITOPS_ONPREM_ENABLED,CUSTOM_ARTIFACT_NG,SERVICE_DASHBOARD_V2,OPTIMIZED_GIT_FETCH_FILES,MULTI_SERVICE_INFRA,ENV_GROUP,NG_SVC_ENV_REDESIGN,GITOPS_ORG_LEVEL"` | GitOps Feature Flags (activated when global.gitops is enabled) |
| featureFlags.IDP | string | `"IDP_ENABLED,IDP_UI_API_BASED_RESTART"` | IDP Feature Flags |
| featureFlags.LICENSE | string | `"NG_LICENSES_ENABLED,VIEW_USAGE_ENABLED"` | Licensing flags |
| featureFlags.NG | string | `"ENABLE_DEFAULT_NG_EXPERIENCE_FOR_ONPREM,NEXT_GEN_ENABLED,NEW_LEFT_NAVBAR_SETTINGS,SPG_SIDENAV_COLLAPSE,PL_ENABLE_JIT_USER_PROVISION"` | NG Specific Feature Flags(activated when global.ng is enabled) |
| featureFlags.OPA | string | `"OPA_PIPELINE_GOVERNANCE,OPA_GIT_GOVERNANCE"` | OPA (activated when global.opa is enabled) |
| featureFlags.SAMLAutoAccept | string | `"AUTO_ACCEPT_SAML_ACCOUNT_INVITES,PL_NO_EMAIL_FOR_SAML_ACCOUNT_INVITES"` | AutoAccept Feature Flags |
| featureFlags.SDM | string | `"PL_DISCOVERY_ENABLE"` | - ServiceDiscoveryManager Feature Flags |
| featureFlags.SRM | string | `"CVNG_ENABLED"` | SRM Flags (activated when global.srm is enabled) |
| featureFlags.SSCA | string | `"SSCA_ENABLED,DEBEZIUM_ENABLED"` | SSCA Feature Flags (activated when global.ssca is enabled) |
| featureFlags.STO | string | `"STO_BASELINE_REGEX,STO_STEP_PALETTE_BURP_ENTERPRISE,STO_STEP_PALETTE_CODEQL,STO_STEP_PALETTE_FOSSA,STO_STEP_PALETTE_GIT_LEAKS,STO_STEP_PALETTE_SEMGREP"` | STO Feature Flags (activated when global.sto is enabled) |
| fullnameOverride | string | `""` |  |
| global.awsServiceEndpointUrls.cloudwatchEndPointUrl | string | `"https://monitoring.us-east-2.amazonaws.com"` |  |
| global.awsServiceEndpointUrls.ecsEndPointUrl | string | `"https://ecs.us-east-2.amazonaws.com"` |  |
| global.awsServiceEndpointUrls.enabled | bool | `false` |  |
| global.awsServiceEndpointUrls.endPointRegion | string | `"us-east-2"` |  |
| global.awsServiceEndpointUrls.stsEndPointUrl | string | `"https://sts.us-east-2.amazonaws.com"` |  |
| global.ccm.enabled | bool | `false` |  |
| global.cd.enabled | bool | `false` |  |
| global.cg.enabled | bool | `false` |  |
| global.chaos.enabled | bool | `false` |  |
| global.ci.enabled | bool | `false` |  |
| global.commonAnnotations | object | `{}` |  |
| global.commonLabels | object | `{}` |  |
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
| global.database.timescaledb.certKey | string | `""` |  |
| global.database.timescaledb.certName | string | `""` |  |
| global.database.timescaledb.extraArgs | string | `""` |  |
| global.database.timescaledb.hosts[0] | string | `"timescaledb-single-chart:5432"` |  |
| global.database.timescaledb.installed | bool | `true` |  |
| global.database.timescaledb.passwordKey | string | `""` |  |
| global.database.timescaledb.protocol | string | `"jdbc:postgresql"` |  |
| global.database.timescaledb.secretName | string | `""` | TimescaleDB secrets |
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
| global.dbops.enabled | bool | `false` |  |
| global.ff.enabled | bool | `false` |  |
| global.fileLogging.enabled | bool | `false` |  |
| global.fileLogging.logFilename | string | `"/opt/harness/logs/pod.log"` |  |
| global.fileLogging.maxBackupFileCount | int | `10` |  |
| global.fileLogging.maxFileSize | string | `"50MB"` |  |
| global.fileLogging.totalFileSizeCap | string | `"1GB"` |  |
| global.gitops.enabled | bool | `false` |  |
| global.ha | bool | `false` | High availability: deploy 3 mongodb pods instead of 1. Not recommended for evaluation or POV |
| global.idp.enabled | bool | `false` |  |
| global.ingress.className | string | `"harness"` | set ingress object classname |
| global.ingress.disableHostInIngress | bool | `false` |  |
| global.ingress.enabled | bool | `false` | create ingress objects |
| global.ingress.hosts | list | `["my-host.example.org"]` | set host of ingressObjects |
| global.ingress.objects | object | `{"annotations":{}}` | add annotations to ingress objects |
| global.ingress.pathPrefix | string | `""` |  |
| global.ingress.pathType | string | `""` |  |
| global.ingress.tls | object | `{"enabled":true,"secretName":""}` | set tls for ingress objects |
| global.istio.enabled | bool | `false` | create virtualServices objects |
| global.istio.gateway | object | `{"create":false}` | create gateway and use in virtualservice |
| global.istio.virtualService | object | `{"gateways":null,"hosts":null}` | if gateway not created, use specified gateway and host |
| global.kubeVersion | string | `""` |  |
| global.license.cg | string | `""` |  |
| global.license.ng | string | `""` |  |
| global.license.secrets.kubernetesSecrets[0].keys.CG_LICENSE | string | `""` |  |
| global.license.secrets.kubernetesSecrets[0].keys.NG_LICENSE | string | `""` |  |
| global.license.secrets.kubernetesSecrets[0].secretName | string | `""` |  |
| global.license.secrets.secretManagement.externalSecretsOperator[0].remoteKeys.CG_LICENSE.name | string | `""` |  |
| global.license.secrets.secretManagement.externalSecretsOperator[0].remoteKeys.CG_LICENSE.property | string | `""` |  |
| global.license.secrets.secretManagement.externalSecretsOperator[0].remoteKeys.NG_LICENSE.name | string | `""` |  |
| global.license.secrets.secretManagement.externalSecretsOperator[0].remoteKeys.NG_LICENSE.property | string | `""` |  |
| global.license.secrets.secretManagement.externalSecretsOperator[0].secretStore.kind | string | `""` |  |
| global.license.secrets.secretManagement.externalSecretsOperator[0].secretStore.name | string | `""` |  |
| global.loadbalancerURL | string | `""` |  |
| global.mongoSSL | bool | `false` |  |
| global.monitoring.enabled | bool | `false` |  |
| global.monitoring.managedPlatform | string | `""` |  |
| global.monitoring.path | string | `"/metrics"` |  |
| global.monitoring.port | int | `8889` |  |
| global.ng.enabled | bool | `true` |  |
| global.ngcustomdashboard.enabled | bool | `false` |  |
| global.opa.enabled | bool | `false` |  |
| global.proxy.enabled | bool | `false` |  |
| global.proxy.host | string | `"localhost"` |  |
| global.proxy.password | string | `""` |  |
| global.proxy.port | int | `80` |  |
| global.proxy.protocol | string | `"http"` |  |
| global.proxy.username | string | `""` |  |
| global.saml.autoaccept | bool | `false` |  |
| global.servicediscoverymanager.enabled | bool | `false` |  |
| global.smtpCreateSecret.SMTP_HOST | string | `""` |  |
| global.smtpCreateSecret.SMTP_PASSWORD | string | `""` |  |
| global.smtpCreateSecret.SMTP_PORT | string | `"465"` |  |
| global.smtpCreateSecret.SMTP_USERNAME | string | `""` |  |
| global.smtpCreateSecret.SMTP_USE_SSL | string | `"true"` |  |
| global.smtpCreateSecret.enabled | bool | `false` |  |
| global.smtpCreateSecret.secrets.kubernetesSecrets[0].keys.SMTP_HOST | string | `""` |  |
| global.smtpCreateSecret.secrets.kubernetesSecrets[0].keys.SMTP_PASSWORD | string | `""` |  |
| global.smtpCreateSecret.secrets.kubernetesSecrets[0].keys.SMTP_PORT | string | `""` |  |
| global.smtpCreateSecret.secrets.kubernetesSecrets[0].keys.SMTP_USERNAME | string | `""` |  |
| global.smtpCreateSecret.secrets.kubernetesSecrets[0].keys.SMTP_USE_SSL | string | `""` |  |
| global.smtpCreateSecret.secrets.kubernetesSecrets[0].secretName | string | `""` |  |
| global.smtpCreateSecret.secrets.secretManagement.externalSecretsOperator[0].remoteKeys.SMTP_HOST.name | string | `""` |  |
| global.smtpCreateSecret.secrets.secretManagement.externalSecretsOperator[0].remoteKeys.SMTP_HOST.property | string | `""` |  |
| global.smtpCreateSecret.secrets.secretManagement.externalSecretsOperator[0].remoteKeys.SMTP_PASSWORD.name | string | `""` |  |
| global.smtpCreateSecret.secrets.secretManagement.externalSecretsOperator[0].remoteKeys.SMTP_PASSWORD.property | string | `""` |  |
| global.smtpCreateSecret.secrets.secretManagement.externalSecretsOperator[0].remoteKeys.SMTP_PORT.name | string | `""` |  |
| global.smtpCreateSecret.secrets.secretManagement.externalSecretsOperator[0].remoteKeys.SMTP_PORT.property | string | `""` |  |
| global.smtpCreateSecret.secrets.secretManagement.externalSecretsOperator[0].remoteKeys.SMTP_USERNAME.name | string | `""` |  |
| global.smtpCreateSecret.secrets.secretManagement.externalSecretsOperator[0].remoteKeys.SMTP_USERNAME.property | string | `""` |  |
| global.smtpCreateSecret.secrets.secretManagement.externalSecretsOperator[0].remoteKeys.SMTP_USE_SSL.name | string | `""` |  |
| global.smtpCreateSecret.secrets.secretManagement.externalSecretsOperator[0].remoteKeys.SMTP_USE_SSL.property | string | `""` |  |
| global.smtpCreateSecret.secrets.secretManagement.externalSecretsOperator[0].secretStore.kind | string | `""` |  |
| global.smtpCreateSecret.secrets.secretManagement.externalSecretsOperator[0].secretStore.name | string | `""` |  |
| global.srm.enabled | bool | `false` |  |
| global.ssca.enabled | bool | `false` |  |
| global.stackDriverLoggingEnabled | bool | `false` |  |
| global.sto.enabled | bool | `false` |  |
| global.useImmutableDelegate | string | `"true"` |  |
| global.useMinimalDelegateImage | bool | `false` |  |
| global.waitForInitContainer.enabled | bool | `true` |  |
| global.waitForInitContainer.image.digest | string | `""` |  |
| global.waitForInitContainer.image.imagePullSecrets | list | `[]` |  |
| global.waitForInitContainer.image.pullPolicy | string | `"Always"` |  |
| global.waitForInitContainer.image.registry | string | `"docker.io"` |  |
| global.waitForInitContainer.image.repository | string | `"harness/helm-init-container"` |  |
| global.waitForInitContainer.image.tag | string | `"latest"` |  |
| image.digest | string | `""` |  |
| image.imagePullSecrets | list | `[]` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.registry | string | `"docker.io"` |  |
| image.repository | string | `"harness/manager-signed"` |  |
| image.tag | string | `"81725"` |  |
| immutable_delegate_docker_image.image.digest | string | `""` |  |
| immutable_delegate_docker_image.image.registry | string | `"docker.io"` |  |
| immutable_delegate_docker_image.image.repository | string | `"harness/delegate"` |  |
| immutable_delegate_docker_image.image.tag | string | `"24.02.82308"` |  |
| ingress.annotations | object | `{}` |  |
| ingress.objects[0].annotations."nginx.ingress.kubernetes.io/proxy-read-timeout" | string | `"300"` |  |
| ingress.objects[0].annotations."nginx.ingress.kubernetes.io/rewrite-target" | string | `"/api$1$2"` |  |
| ingress.objects[0].name | string | `"harness-manager-api"` |  |
| ingress.objects[0].paths[0].path | string | `"{{ .Values.global.ingress.pathPrefix }}/api(/|$)(.*)"` |  |
| ingress.objects[0].paths[1].backend.service.port | int | `9999` |  |
| ingress.objects[0].paths[1].path | string | `"{{ .Values.global.ingress.pathPrefix }}/api/swagger(/|$)(.*)"` |  |
| ingress.objects[1].annotations."nginx.ingress.kubernetes.io/rewrite-target" | string | `"/stream$1$2"` |  |
| ingress.objects[1].name | string | `"harness-manager-stream"` |  |
| ingress.objects[1].paths[0].path | string | `"{{ .Values.global.ingress.pathPrefix }}/stream(/|$)(.*)"` |  |
| initContainer.image.digest | string | `""` |  |
| initContainer.image.pullPolicy | string | `"IfNotPresent"` |  |
| initContainer.image.registry | string | `"docker.io"` |  |
| initContainer.image.repository | string | `"busybox"` |  |
| initContainer.image.tag | string | `"latest"` |  |
| java.memory | string | `"2048"` |  |
| java17flags | string | `""` |  |
| lifecycleHooks.preStop.exec.command[0] | string | `"touch"` |  |
| lifecycleHooks.preStop.exec.command[1] | string | `"shutdown"` |  |
| maxSurge | int | `1` |  |
| maxUnavailable | int | `0` |  |
| mongoSecrets.password.key | string | `"mongodb-root-password"` |  |
| mongoSecrets.password.name | string | `"mongodb-replicaset-chart"` |  |
| mongoSecrets.userName.key | string | `"mongodbUsername"` |  |
| mongoSecrets.userName.name | string | `"harness-secrets"` |  |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| podAnnotations | object | `{}` |  |
| podSecurityContext | object | `{}` |  |
| probes.livenessProbe.failureThreshold | int | `5` |  |
| probes.livenessProbe.httpGet.path | string | `"/api/health/liveness"` |  |
| probes.livenessProbe.httpGet.port | int | `9090` |  |
| probes.livenessProbe.httpGet.scheme | string | `"HTTP"` |  |
| probes.livenessProbe.periodSeconds | int | `60` |  |
| probes.livenessProbe.successThreshold | int | `1` |  |
| probes.livenessProbe.timeoutSeconds | int | `10` |  |
| probes.readinessProbe.failureThreshold | int | `3` |  |
| probes.readinessProbe.httpGet.path | string | `"/api/health"` |  |
| probes.readinessProbe.httpGet.port | int | `9090` |  |
| probes.readinessProbe.httpGet.scheme | string | `"HTTP"` |  |
| probes.readinessProbe.periodSeconds | int | `5` |  |
| probes.readinessProbe.successThreshold | int | `1` |  |
| probes.readinessProbe.timeoutSeconds | int | `1` |  |
| probes.startupProbe.failureThreshold | int | `32` |  |
| probes.startupProbe.httpGet.path | string | `"/api/health"` |  |
| probes.startupProbe.httpGet.port | int | `9090` |  |
| probes.startupProbe.httpGet.scheme | string | `"HTTP"` |  |
| probes.startupProbe.initialDelaySeconds | int | `25` |  |
| probes.startupProbe.periodSeconds | int | `5` |  |
| probes.startupProbe.successThreshold | int | `1` |  |
| probes.startupProbe.timeoutSeconds | int | `1` |  |
| rbac.roles | list | `[]` |  |
| redisConfig.nettyThreads | string | `"32"` |  |
| replicaCount | int | `1` |  |
| resources.limits.memory | string | `"8192Mi"` |  |
| resources.requests.cpu | int | `2` |  |
| resources.requests.memory | string | `"3072Mi"` |  |
| secondaryTimescaledb.hosts | list | `[]` | TimescaleDB host names |
| secondaryTimescaledb.protocol | string | `"jdbc:postgresql2312321"` |  |
| secondaryTimescaledb.secrets | object | `{"kubernetesSecrets":[{"keys":{"TIMESCALEDB_PASSWORD":"","TIMESCALEDB_SSL_ROOT_CERT":"","TIMESCALEDB_USERNAME":""},"secretName":""}],"secretManagement":{"externalSecretsOperator":[{"remoteKeys":{"TIMESCALEDB_PASSWORD":{"name":"","property":""},"TIMESCALEDB_SSL_ROOT_CERT":{"name":"","property":""},"TIMESCALEDB_USERNAME":{"name":"","property":""}},"secretStore":{"kind":"","name":""}}]}}` | TimescaleDB secrets |
| secrets.default.CF_CLIENT_API_KEY | string | `"DUMMY"` |  |
| secrets.default.LOG_STREAMING_SERVICE_TOKEN | string | `"c76e567a-b341-404d-a8dd-d9738714eb82"` |  |
| secrets.default.VERIFICATION_SERVICE_SECRET | string | `"59MR5RlVARcdH7zb7pNx6GzqiglBmXR8"` |  |
| secrets.kubernetesSecrets[0].keys.CF_CLIENT_API_KEY | string | `""` |  |
| secrets.kubernetesSecrets[0].keys.LOG_STREAMING_SERVICE_TOKEN | string | `""` |  |
| secrets.kubernetesSecrets[0].keys.VERIFICATION_SERVICE_SECRET | string | `""` |  |
| secrets.kubernetesSecrets[0].secretName | string | `""` |  |
| secrets.secretManagement.externalSecretsOperator[0].remoteKeys.CF_CLIENT_API_KEY.name | string | `""` |  |
| secrets.secretManagement.externalSecretsOperator[0].remoteKeys.CF_CLIENT_API_KEY.property | string | `""` |  |
| secrets.secretManagement.externalSecretsOperator[0].remoteKeys.LOG_STREAMING_SERVICE_TOKEN.name | string | `""` |  |
| secrets.secretManagement.externalSecretsOperator[0].remoteKeys.LOG_STREAMING_SERVICE_TOKEN.property | string | `""` |  |
| secrets.secretManagement.externalSecretsOperator[0].remoteKeys.VERIFICATION_SERVICE_SECRET.name | string | `""` |  |
| secrets.secretManagement.externalSecretsOperator[0].remoteKeys.VERIFICATION_SERVICE_SECRET.property | string | `""` |  |
| secrets.secretManagement.externalSecretsOperator[0].secretStore.kind | string | `""` |  |
| secrets.secretManagement.externalSecretsOperator[0].secretStore.name | string | `""` |  |
| securityContext.runAsNonRoot | bool | `true` |  |
| securityContext.runAsUser | int | `65534` |  |
| service.annotations | object | `{}` |  |
| service.grpcport | int | `9879` |  |
| service.port | int | `9090` |  |
| service.type | string | `"ClusterIP"` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.name | string | `""` |  |
| timescaleSecret.password.key | string | `"timescaledbPostgresPassword"` |  |
| timescaleSecret.password.name | string | `"harness-secrets"` |  |
| timescaledb.enabled | bool | `false` |  |
| timescaledb.hosts | list | `[]` | TimescaleDB host names |
| timescaledb.secrets | object | `{"kubernetesSecrets":[{"keys":{"TIMESCALEDB_PASSWORD":"","TIMESCALEDB_SSL_ROOT_CERT":"","TIMESCALEDB_USERNAME":""},"secretName":""}],"secretManagement":{"externalSecretsOperator":[{"remoteKeys":{"TIMESCALEDB_PASSWORD":{"name":"","property":""},"TIMESCALEDB_SSL_ROOT_CERT":{"name":"","property":""},"TIMESCALEDB_USERNAME":{"name":"","property":""}},"secretStore":{"kind":"","name":""}}]}}` | TimescaleDB secrets |
| tolerations | list | `[]` |  |
| upgrader_docker_image.image.digest | string | `""` |  |
| upgrader_docker_image.image.registry | string | `"docker.io"` |  |
| upgrader_docker_image.image.repository | string | `"harness/upgrader"` |  |
| upgrader_docker_image.image.tag | string | `"latest"` |  |
| version | string | `"1.0.80209"` |  |
| virtualService.annotations | object | `{}` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.11.0](https://github.com/norwoodj/helm-docs/releases/v1.11.0)
