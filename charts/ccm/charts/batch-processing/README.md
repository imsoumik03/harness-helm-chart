# batch-processing

![Version: 0.13.5](https://img.shields.io/badge/Version-0.13.5-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.0.81905](https://img.shields.io/badge/AppVersion-0.0.81905-informational?style=flat-square)

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
| awsAccountTagsCollectionJobConfig.enabled | bool | `true` |  |
| awsSecret.S3_SYNC_CONFIG_ACCESSKEY | string | `""` |  |
| awsSecret.S3_SYNC_CONFIG_SECRETKEY | string | `""` |  |
| azureConfig.AZURE_SMP_ENABLED | bool | `false` |  |
| azureConfig.AZURE_SMP_HISTORY_TIME_DELTA | int | `1` |  |
| azureConfig.AZURE_SMP_REPORT_RETRIES | int | `5` |  |
| azureConfig.HARNESS_CE_AZURE_CONTAINER_NAME | string | `""` |  |
| azureConfig.HARNESS_CE_AZURE_IS_SYNC_JOB_DISABLED | string | `""` |  |
| azureConfig.HARNESS_CE_AZURE_STORAGE_NAME | string | `""` |  |
| azureCronJobResources.limits.memory | string | `"2Gi"` |  |
| azureCronJobResources.requests.cpu | string | `"1"` |  |
| azureCronJobResources.requests.memory | string | `"2Gi"` |  |
| batchJobRepository.dataRetentionPeriodInDays | int | `7` |  |
| batchJobRepository.metadataCleanupSchedule | string | `"0 0 0 * * ?"` |  |
| ceBatchGCPCredentials | string | `""` |  |
| ceGCPHomeProjectCreds | string | `""` |  |
| cliProxy.enabled | bool | `false` |  |
| cliProxy.host | string | `"localhost"` |  |
| cliProxy.password | string | `""` |  |
| cliProxy.port | int | `80` |  |
| cliProxy.protocol | string | `"http"` |  |
| cliProxy.username | string | `""` |  |
| clickhouse.password.key | string | `"admin-password"` |  |
| clickhouse.password.name | string | `"clickhouse"` |  |
| clickhouse.queryRetries | string | `"3"` |  |
| clickhouse.sendReceiveTimeout | string | `"86400"` |  |
| clickhouse.socketTimeout | string | `"86400000"` |  |
| clickhouse.username | string | `"default"` |  |
| cloudProviderConfig.CLUSTER_DATA_GCS_BACKUP_BUCKET | string | `"clusterdata-onprem-backup"` |  |
| cloudProviderConfig.CLUSTER_DATA_GCS_BUCKET | string | `"clusterdata-onprem"` |  |
| cloudProviderConfig.DATA_PIPELINE_CONFIG_GCS_BASE_PATH | string | `"gs://awscustomerbillingdata-onprem"` |  |
| cloudProviderConfig.S3_SYNC_CONFIG_BUCKET_NAME | string | `"ccm-service-data-bucket"` |  |
| cloudProviderConfig.S3_SYNC_CONFIG_REGION | string | `"us-east-1"` |  |
| config.ACCESS_CONTROL_BASE_URL | string | `"http://access-control.{{ .Release.Namespace }}.svc.cluster.local:9006/api/"` |  |
| config.ACCESS_CONTROL_ENABLED | string | `"true"` |  |
| config.ANOMALY_DETECTION_PYTHON_SERVICE_URL | string | `"http://anomaly-detection.{{ .Release.Namespace }}.svc.cluster.local:8081"` |  |
| config.ANOMALY_DETECTION_USE_PROPHET | string | `"true"` |  |
| config.AWS_ACCOUNT_TAGS_COLLECTION_JOB_ENABLED | string | `"{{ .Values.awsAccountTagsCollectionJobConfig.enabled }}"` |  |
| config.AWS_USE_NEW_PIPELINE | string | `"true"` |  |
| config.BANZAI_CONFIG_HOST | string | `"http://cloud-info.{{ .Release.Namespace }}.svc.cluster.local"` |  |
| config.BANZAI_CONFIG_PORT | string | `"8082"` |  |
| config.BANZAI_RECOMMENDER_BASEURL | string | `"http://telescopes.{{ .Release.Namespace }}.svc.cluster.local:9090/"` |  |
| config.BATCH_JOB_METADATA_CLEANUP_SCHEDULE | string | `"{{ .Values.batchJobRepository.metadataCleanupSchedule }}"` |  |
| config.BATCH_JOB_METADATA_RETENTION_PERIOD | string | `"{{ .Values.batchJobRepository.dataRetentionPeriodInDays }}"` |  |
| config.BUCKET_NAME_PREFIX | string | `"{{ .Values.gcpConfig.bucketNamePrefix }}"` |  |
| config.CE_NG_SERVICE_HTTP_CLIENT_CONFIG_BASE_URL | string | `"http://nextgen-ce.{{ .Release.Namespace }}.svc.cluster.local:6340/ccm/api/"` |  |
| config.CLICKHOUSE_ENABLED | string | `"{{ .Values.global.database.clickhouse.enabled }}"` |  |
| config.CLUSTER_DATA_GCS_BACKUP_BUCKET | string | `"{{ .Values.cloudProviderConfig.CLUSTER_DATA_GCS_BACKUP_BUCKET }}"` |  |
| config.CLUSTER_DATA_GCS_BUCKET | string | `"{{ .Values.cloudProviderConfig.CLUSTER_DATA_GCS_BUCKET }}"` |  |
| config.CONNECTOR_HEALTH_UPDATE_CRON | string | `"0 0 10,22 * * ?"` |  |
| config.CONNECTOR_HEALTH_UPDATE_JOB_ENABLED | string | `"true"` |  |
| config.DATA_PIPELINE_CONFIG_GCP_PROJECT_ID | string | `"{{ .Values.global.ccm.gcpProjectId }}"` |  |
| config.DATA_PIPELINE_CONFIG_GCS_BASE_PATH | string | `"{{ .Values.cloudProviderConfig.DATA_PIPELINE_CONFIG_GCS_BASE_PATH }}"` |  |
| config.BILLING_DATA_INGESTION_METRICS_CRON | string | `"0 0 11 * * *"` |  |
| config.DELEGATE_HEALTH_UPDATE_CRON | string | `"0 0 10,22 * * ?"` |  |
| config.DELEGATE_HEALTH_UPDATE_JOB_ENABLED | string | `"true"` |  |
| config.DEPLOY_MODE | string | `"{{ .Values.global.deployMode }}"` |  |
| config.DKRON_CLIENT_BASEURL | string | `"http://dkron:8080"` |  |
| config.EVEMTS_MONGO_INDEX_MANAGER_MODE | string | `"AUTO"` |  |
| config.FEATURE_FLAG_SYSTEM | string | `"LOCAL"` |  |
| config.GCP_BQ_UPDATE_BATCH_ENABLED | string | `"false"` |  |
| config.GCP_CLOUD_FUNCTION_NAME | string | `"ce-gcp-billing-bq-terraform"` |  |
| config.GCP_CLOUD_FUNCTION_REGION | string | `"us-central1"` |  |
| config.GCP_PROJECT_ID | string | `"{{ .Values.global.ccm.gcpProjectId }}"` |  |
| config.GCP_SMP_ENABLED | string | `"{{ .Values.gcpConfig.GCP_SMP_ENABLED }}"` |  |
| config.GCP_SYNC_ENABLED | string | `"true"` |  |
| config.GCP_SYNC_PYTHON_IMAGE_PATH | string | `"{{ include \"common.images.image\" (dict \"imageRoot\" .Values.imageGCPDataPipeline \"global\" .Values.global) }}"` |  |
| config.GCP_USE_NEW_PIPELINE | string | `"true"` |  |
| config.GOVERNANCE_BQ_LOAD_JOB_CONFIG_ENABLED | string | `"{{ .Values.governance.bqLoadJobConfigEnabled }}"` |  |
| config.GOVERNANCE_CALLBACK_API_ENDPOINT | string | `"http://nextgen-ce.{{ .Release.Namespace }}.svc.cluster.local:6340/ccm/api/governance/enqueue"` |  |
| config.GOVERNANCE_OOTB_ACCOUNT | string | `"{{ .Values.governance.ootbAccount }}"` |  |
| config.GOVERNANCE_RECOMMENDATION_ACCOUNT_REGION_LIMIT | string | `"{{ .Values.governance.governanceRecommendationAccountAndRegionLimit }}"` |  |
| config.GOVERNANCE_RECOMMENDATION_JOB_CRON | string | `"{{ .Values.governance.awsRecommendationJobCron }}"` |  |
| config.GOVERNANCE_RECOMMENDATION_JOB_CRON_AZURE | string | `"{{ .Values.governance.azureRecommendationJobCron }}"` |  |
| config.GOVERNANCE_RECOMMENDATION_JOB_CRON_GCP | string | `"{{ .Values.governance.gcpRecommendationJobCron }}"` |  |
| config.GOVERNANCE_RECOMMENDATION_JOB_ENABLED | string | `"{{ .Values.governance.awsRecommendationJobEnabled }}"` |  |
| config.GOVERNANCE_RECOMMENDATION_JOB_ENABLED_AZURE | string | `"{{ .Values.governance.azureRecommendationJobEnabled }}"` |  |
| config.GOVERNANCE_RECOMMENDATION_JOB_ENABLED_GCP | string | `"{{ .Values.governance.gcpRecommendationJobEnabled }}"` |  |
| config.GOVERNANCE_RECOMMENDATION_MIN_COST_LIMIT | string | `"{{ .Values.governance.governanceRecommendationMinCostForMonth }}"` |  |
| config.HARNESS_CE_AZURE_CONTAINER_NAME | string | `"{{ .Values.azureConfig.HARNESS_CE_AZURE_CONTAINER_NAME }}"` |  |
| config.HARNESS_CE_AZURE_IS_SYNC_JOB_DISABLED | string | `"{{ .Values.azureConfig.HARNESS_CE_AZURE_IS_SYNC_JOB_DISABLED }}"` |  |
| config.HARNESS_CE_AZURE_STORAGE_NAME | string | `"{{ .Values.azureConfig.HARNESS_CE_AZURE_STORAGE_NAME }}"` |  |
| config.INTERNAL_MANAGER_AUTHORITY | string | `"harness-manager:9879"` |  |
| config.INTERNAL_MANAGER_TARGET | string | `"harness-manager:9879"` |  |
| config.ISOLATED_REPLICA | string | `"{{ .Values.isolatedReplica }}"` |  |
| config.MANAGER_CLIENT_BASEURL | string | `"http://harness-manager.{{ .Release.Namespace }}.svc.cluster.local:9090/api/"` |  |
| config.MEMORY | string | `"{{ .Values.java.memory }}"` |  |
| config.METRICS_COLLECTION_DISABLED | string | `"true"` |  |
| config.MONGO_INDEX_MANAGER_MODE | string | `"AUTO"` |  |
| config.NAMESPACE | string | `"{{ .Release.Namespace }}"` |  |
| config.NG_MANAGER_SERVICE_HTTP_CLIENT_CONFIG_BASE_URL | string | `"http://ng-manager.{{ .Release.Namespace }}.svc.cluster.local:7090/"` |  |
| config.REDISSON_PING_CONNECTION_INTERVAL_IN_MILLIS | string | `"0"` |  |
| config.REPLICA | string | `"{{ .Values.replicaCount }}"` |  |
| config.S3_SYNC_CONFIG_BUCKET_NAME | string | `"{{ .Values.cloudProviderConfig.S3_SYNC_CONFIG_BUCKET_NAME }}"` |  |
| config.S3_SYNC_CONFIG_REGION | string | `"{{ .Values.cloudProviderConfig.S3_SYNC_CONFIG_REGION }}"` |  |
| config.SEGMENT_ENABLED | string | `"false"` |  |
| config.STACK_DRIVER_LOGGING_ENABLED | string | `"{{ .Values.global.stackDriverLoggingEnabled }}"` |  |
| config.UI_SERVER_URL | string | `"{{.Values.global.loadbalancerURL}}"` |  |
| config.USE_WORKLOAD_IDENTITY | string | `"{{ .Values.workloadIdentity.enabled }}"` |  |
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
| extraVolumeMounts | list | `[]` |  |
| extraVolumes | list | `[]` |  |
| fullnameOverride | string | `""` |  |
| gcpConfig.GCP_SMP_ENABLED | bool | `false` |  |
| gcpConfig.bucketNamePrefix | string | `"harness-ccm-%s-%s"` |  |
| global.awsServiceEndpointUrls.cloudwatchEndPointUrl | string | `"https://monitoring.us-east-2.amazonaws.com"` |  |
| global.awsServiceEndpointUrls.ecsEndPointUrl | string | `"https://ecs.us-east-2.amazonaws.com"` |  |
| global.awsServiceEndpointUrls.enabled | bool | `false` |  |
| global.awsServiceEndpointUrls.endPointRegion | string | `"us-east-2"` |  |
| global.awsServiceEndpointUrls.stsEndPointUrl | string | `"https://sts.us-east-2.amazonaws.com"` |  |
| global.ccm.gcpProjectId | string | `"placeHolder"` |  |
| global.ccm.governance.enabled | bool | `false` |  |
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
| global.database.postgres.databaseName | string | `""` |  |
| global.database.postgres.extraArgs | string | `""` |  |
| global.database.postgres.hosts[0] | string | `"postgres:5432"` |  |
| global.database.postgres.installed | bool | `true` |  |
| global.database.postgres.passwordKey | string | `""` |  |
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
| global.deployMode | string | `"KUBERNETES_ONPREM"` |  |
| global.imagePullSecrets | list | `[]` |  |
| global.ingress.className | string | `"harness"` |  |
| global.ingress.enabled | bool | `false` |  |
| global.ingress.hosts[0] | string | `"my-host.example.org"` |  |
| global.ingress.tls.enabled | bool | `true` |  |
| global.ingress.tls.secretName | string | `""` |  |
| global.loadbalancerURL | string | `"https://test"` |  |
| global.monitoring.enabled | bool | `false` |  |
| global.monitoring.managedPlatform | string | `""` |  |
| global.monitoring.path | string | `"/metrics"` |  |
| global.monitoring.port | int | `8889` |  |
| global.pdb.create | bool | `false` |  |
| global.proxy.enabled | bool | `false` |  |
| global.proxy.host | string | `"localhost"` |  |
| global.proxy.password | string | `""` |  |
| global.proxy.port | int | `80` |  |
| global.proxy.protocol | string | `"http"` |  |
| global.proxy.username | string | `""` |  |
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
| global.stackDriverLoggingEnabled | bool | `false` |  |
| global.waitForInitContainer.enabled | bool | `true` |  |
| global.waitForInitContainer.image.digest | string | `""` |  |
| global.waitForInitContainer.image.pullPolicy | string | `"Always"` |  |
| global.waitForInitContainer.image.registry | string | `"docker.io"` |  |
| global.waitForInitContainer.image.repository | string | `"harness/helm-init-container"` |  |
| global.waitForInitContainer.image.tag | string | `"latest"` |  |
| governance.awsRecommendationJobCron | string | `"0 0 0 * * *"` |  |
| governance.awsRecommendationJobEnabled | bool | `false` |  |
| governance.azureRecommendationJobCron | string | `"0 0 4 * * *"` |  |
| governance.azureRecommendationJobEnabled | bool | `false` |  |
| governance.bqLoadJobConfigEnabled | bool | `false` |  |
| governance.gcpRecommendationJobCron | string | `"0 0 8 * * *"` |  |
| governance.gcpRecommendationJobEnabled | bool | `false` |  |
| governance.governanceRecommendationAccountAndRegionLimit | int | `500` |  |
| governance.governanceRecommendationMinCostForMonth | int | `300` |  |
| governance.ootbAccount | string | `"kmpySmUISimoRrJL6NL73w"` |  |
| image.digest | string | `""` |  |
| image.imagePullSecrets | list | `[]` |  |
| image.pullPolicy | string | `"Always"` |  |
| image.registry | string | `"docker.io"` |  |
| image.repository | string | `"harness/batch-processing-signed"` |  |
| image.tag | string | `"81905-000"` |  |
| imageAzureDataPipeline.digest | string | `""` |  |
| imageAzureDataPipeline.imagePullSecrets | list | `[]` |  |
| imageAzureDataPipeline.pullPolicy | string | `"Always"` |  |
| imageAzureDataPipeline.registry | string | `"docker.io"` |  |
| imageAzureDataPipeline.repository | string | `"harness/ccm-azure-smp-signed"` |  |
| imageAzureDataPipeline.tag | string | `"10006"` |  |
| imageGCPDataPipeline.digest | string | `""` |  |
| imageGCPDataPipeline.imagePullSecrets | list | `[]` |  |
| imageGCPDataPipeline.pullPolicy | string | `"Always"` |  |
| imageGCPDataPipeline.registry | string | `"docker.io"` |  |
| imageGCPDataPipeline.repository | string | `"harness/ccm-gcp-smp-signed"` |  |
| imageGCPDataPipeline.tag | string | `"10057"` |  |
| isolatedReplica | int | `0` |  |
| java.memory | string | `"7168"` |  |
| java17flags | string | `"--illegal-access=debug --add-opens java.base/java.lang=ALL-UNNAMED --add-opens java.base/java.util=ALL-UNNAMED --add-opens java.base/java.nio=ALL-UNNAMED --add-opens java.base/java.util.concurrent.atomic=ALL-UNNAMED --add-opens java.base/java.time=ALL-UNNAMED --add-opens java.base/java.io=ALL-UNNAMED --add-opens java.base/java.lang.invoke=ALL-UNNAMED --add-opens java.base/java.math=ALL-UNNAMED --add-opens java.base/java.nio.file=ALL-UNNAMED --add-opens java.base/java.util.concurrent=ALL-UNNAMED --add-opens java.xml/com.sun.org.apache.xpath.internal=ALL-UNNAMED --add-opens=java.base/java.lang.reflect=ALL-UNNAMED --add-opens java.base/java.text=ALL-UNNAMED --add-exports java.xml/com.sun.org.apache.xerces.internal.parsers=ALL-UNNAMED --add-exports java.base/sun.nio.ch=ALL-UNNAMED"` |  |
| lifecycleHooks | object | `{}` |  |
| mongoSecrets.password.key | string | `"mongodb-root-password"` |  |
| mongoSecrets.password.name | string | `"mongodb-replicaset-chart"` |  |
| mongoSecrets.userName.key | string | `"mongodbUsername"` |  |
| mongoSecrets.userName.name | string | `"harness-secrets"` |  |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| pdb.create | bool | `false` |  |
| podAnnotations | object | `{}` |  |
| podSecurityContext | object | `{}` |  |
| postgres.enabled | bool | `false` |  |
| postgres.extraArgs | string | `""` |  |
| postgres.hosts | list | `[]` |  |
| postgres.image.registry | string | `"docker.io"` |  |
| postgres.image.repository | string | `"harness/postgresql"` |  |
| postgres.image.tag | string | `"14.18.0-debian-12-r0"` |  |
| postgres.initializeDb | bool | `true` |  |
| postgres.secrets.kubernetesSecrets[0].keys.POSTGRES_PASSWORD | string | `""` |  |
| postgres.secrets.kubernetesSecrets[0].keys.POSTGRES_USER | string | `""` |  |
| postgres.secrets.kubernetesSecrets[0].secretName | string | `""` |  |
| postgres.secrets.secretManagement.externalSecretsOperator[0].remoteKeys.POSTGRES_PASSWORD.name | string | `""` |  |
| postgres.secrets.secretManagement.externalSecretsOperator[0].remoteKeys.POSTGRES_PASSWORD.property | string | `""` |  |
| postgres.secrets.secretManagement.externalSecretsOperator[0].remoteKeys.POSTGRES_USER.name | string | `""` |  |
| postgres.secrets.secretManagement.externalSecretsOperator[0].remoteKeys.POSTGRES_USER.property | string | `""` |  |
| postgres.secrets.secretManagement.externalSecretsOperator[0].secretStore.kind | string | `""` |  |
| postgres.secrets.secretManagement.externalSecretsOperator[0].secretStore.name | string | `""` |  |
| rbac.rules | list | `[]` |  |
| replicaCount | int | `1` |  |
| resources.limits.memory | string | `"10Gi"` |  |
| resources.requests.cpu | string | `"1024m"` |  |
| resources.requests.memory | string | `"10Gi"` |  |
| secondaryTimescaledb.hosts | list | `[]` | TimescaleDB host names |
| secondaryTimescaledb.protocol | string | `"jdbc:postgresql2312321"` |  |
| secondaryTimescaledb.secrets | object | `{"kubernetesSecrets":[{"keys":{"TIMESCALEDB_PASSWORD":"","TIMESCALEDB_SSL_ROOT_CERT":"","TIMESCALEDB_USERNAME":""},"secretName":""}],"secretManagement":{"externalSecretsOperator":[{"remoteKeys":{"TIMESCALEDB_PASSWORD":{"name":"","property":""},"TIMESCALEDB_SSL_ROOT_CERT":{"name":"","property":""},"TIMESCALEDB_USERNAME":{"name":"","property":""}},"secretStore":{"kind":"","name":""}}]}}` | TimescaleDB secrets |
| secrets.conditions.FAKTORY_PASSWORD | string | `"global.ccm.governance.enabled"` |  |
| secrets.default.ACCESS_CONTROL_SECRET | string | `"IC04LYMBf1lDP5oeY4hupxd4HJhLmN6azUku3xEbeE3SUx5G3ZYzhbiwVtK4i7AmqyU9OZkwB4v8E9qM"` |  |
| secrets.default.CE_NG_SERVICE_SECRET | string | `"IC04LYMBf1lDP5oeY4hupxd4HJhLmN6azUku3xEbeE3SUx5G3ZYzhbiwVtK4i7AmqyU9OZkwB4v8E9qM"` |  |
| secrets.default.CF_CLIENT_API_KEY | string | `"BATCH_PROCESSING_ON_PREM"` |  |
| secrets.default.FAKTORY_PASSWORD | string | `""` |  |
| secrets.default.HARNESS_CE_AZURE_CLIENTID | string | `"placeholder"` |  |
| secrets.default.HARNESS_CE_AZURE_CLIENTSECRET | string | `"placeHolder"` |  |
| secrets.default.HARNESS_CE_AZURE_SAS | string | `"placeholder"` |  |
| secrets.default.HARNESS_CE_AZURE_TENANTID | string | `"placeholder"` |  |
| secrets.default.HMAC_ACCESS_KEY | string | `"placeholder"` |  |
| secrets.default.HMAC_SECRET_KEY | string | `"placeholder"` |  |
| secrets.default.NEXT_GEN_MANAGER_SECRET | string | `"IC04LYMBf1lDP5oeY4hupxd4HJhLmN6azUku3xEbeE3SUx5G3ZYzhbiwVtK4i7AmqyU9OZkwB4v8E9qM"` |  |
| secrets.default.S3_SYNC_CONFIG_ACCESSKEY | string | `"placeholder"` |  |
| secrets.default.S3_SYNC_CONFIG_SECRETKEY | string | `"placeholder"` |  |
| secrets.default.cloud-data-store | string | `""` |  |
| secrets.fileSecret[0].keys[0].key | string | `"cloud-data-store"` |  |
| secrets.fileSecret[0].keys[0].path | string | `"cloud_data_store.json"` |  |
| secrets.fileSecret[0].volumeMountPath | string | `"/opt/harness/svc"` |  |
| secrets.kubernetesSecrets[0].keys.ACCESS_CONTROL_SECRET | string | `""` |  |
| secrets.kubernetesSecrets[0].keys.CE_NG_SERVICE_SECRET | string | `""` |  |
| secrets.kubernetesSecrets[0].keys.HARNESS_CE_AZURE_CLIENTID | string | `""` |  |
| secrets.kubernetesSecrets[0].keys.HARNESS_CE_AZURE_CLIENTSECRET | string | `""` |  |
| secrets.kubernetesSecrets[0].keys.HARNESS_CE_AZURE_SAS | string | `""` |  |
| secrets.kubernetesSecrets[0].keys.HARNESS_CE_AZURE_TENANTID | string | `""` |  |
| secrets.kubernetesSecrets[0].keys.HMAC_ACCESS_KEY | string | `""` |  |
| secrets.kubernetesSecrets[0].keys.HMAC_SECRET_KEY | string | `""` |  |
| secrets.kubernetesSecrets[0].keys.NEXT_GEN_MANAGER_SECRET | string | `""` |  |
| secrets.kubernetesSecrets[0].keys.S3_SYNC_CONFIG_ACCESSKEY | string | `""` |  |
| secrets.kubernetesSecrets[0].keys.S3_SYNC_CONFIG_SECRETKEY | string | `""` |  |
| secrets.kubernetesSecrets[0].secretName | string | `""` |  |
| secrets.kubernetesSecrets[1].keys.FAKTORY_PASSWORD | string | `""` |  |
| secrets.kubernetesSecrets[1].secretName | string | `""` |  |
| secrets.secretManagement.externalSecretsOperator[0].remoteKeys.ACCESS_CONTROL_SECRET.name | string | `""` |  |
| secrets.secretManagement.externalSecretsOperator[0].remoteKeys.ACCESS_CONTROL_SECRET.property | string | `""` |  |
| secrets.secretManagement.externalSecretsOperator[0].remoteKeys.CE_NG_SERVICE_SECRET.name | string | `""` |  |
| secrets.secretManagement.externalSecretsOperator[0].remoteKeys.CE_NG_SERVICE_SECRET.property | string | `""` |  |
| secrets.secretManagement.externalSecretsOperator[0].remoteKeys.FAKTORY_PASSWORD.name | string | `""` |  |
| secrets.secretManagement.externalSecretsOperator[0].remoteKeys.FAKTORY_PASSWORD.property | string | `""` |  |
| secrets.secretManagement.externalSecretsOperator[0].remoteKeys.HARNESS_CE_AZURE_CLIENTID.name | string | `""` |  |
| secrets.secretManagement.externalSecretsOperator[0].remoteKeys.HARNESS_CE_AZURE_CLIENTID.property | string | `""` |  |
| secrets.secretManagement.externalSecretsOperator[0].remoteKeys.HARNESS_CE_AZURE_CLIENTSECRET.name | string | `""` |  |
| secrets.secretManagement.externalSecretsOperator[0].remoteKeys.HARNESS_CE_AZURE_CLIENTSECRET.property | string | `""` |  |
| secrets.secretManagement.externalSecretsOperator[0].remoteKeys.HARNESS_CE_AZURE_SAS.name | string | `""` |  |
| secrets.secretManagement.externalSecretsOperator[0].remoteKeys.HARNESS_CE_AZURE_SAS.property | string | `""` |  |
| secrets.secretManagement.externalSecretsOperator[0].remoteKeys.HARNESS_CE_AZURE_TENANTID.name | string | `""` |  |
| secrets.secretManagement.externalSecretsOperator[0].remoteKeys.HARNESS_CE_AZURE_TENANTID.property | string | `""` |  |
| secrets.secretManagement.externalSecretsOperator[0].remoteKeys.HMAC_ACCESS_KEY.name | string | `""` |  |
| secrets.secretManagement.externalSecretsOperator[0].remoteKeys.HMAC_ACCESS_KEY.property | string | `""` |  |
| secrets.secretManagement.externalSecretsOperator[0].remoteKeys.HMAC_SECRET_KEY.name | string | `""` |  |
| secrets.secretManagement.externalSecretsOperator[0].remoteKeys.HMAC_SECRET_KEY.property | string | `""` |  |
| secrets.secretManagement.externalSecretsOperator[0].remoteKeys.NEXT_GEN_MANAGER_SECRET.name | string | `""` |  |
| secrets.secretManagement.externalSecretsOperator[0].remoteKeys.NEXT_GEN_MANAGER_SECRET.property | string | `""` |  |
| secrets.secretManagement.externalSecretsOperator[0].remoteKeys.S3_SYNC_CONFIG_ACCESSKEY.name | string | `""` |  |
| secrets.secretManagement.externalSecretsOperator[0].remoteKeys.S3_SYNC_CONFIG_ACCESSKEY.property | string | `""` |  |
| secrets.secretManagement.externalSecretsOperator[0].remoteKeys.S3_SYNC_CONFIG_SECRETKEY.name | string | `""` |  |
| secrets.secretManagement.externalSecretsOperator[0].remoteKeys.S3_SYNC_CONFIG_SECRETKEY.property | string | `""` |  |
| secrets.secretManagement.externalSecretsOperator[0].secretStore.kind | string | `""` |  |
| secrets.secretManagement.externalSecretsOperator[0].secretStore.name | string | `""` |  |
| securityContext | object | `{}` |  |
| service.annotations | object | `{}` |  |
| service.metrics.name | string | `"metrics"` |  |
| service.metrics.port | int | `8889` |  |
| service.port | int | `6340` |  |
| service.type | string | `"ClusterIP"` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.create | bool | `false` |  |
| serviceAccount.name | string | `"harness-default"` |  |
| smtp.host | string | `""` |  |
| smtp.password | string | `""` |  |
| smtp.user | string | `""` |  |
| storageObjectAdmin | string | `""` |  |
| terminationGracePeriodSeconds | int | `30` |  |
| timescaleSecret.password.key | string | `"timescaledbPostgresPassword"` |  |
| timescaleSecret.password.name | string | `"harness-secrets"` |  |
| timescaledb.hosts | list | `[]` | TimescaleDB host names |
| timescaledb.secrets | object | `{"kubernetesSecrets":[{"keys":{"TIMESCALEDB_PASSWORD":"","TIMESCALEDB_SSL_ROOT_CERT":"","TIMESCALEDB_USERNAME":""},"secretName":""}],"secretManagement":{"externalSecretsOperator":[{"remoteKeys":{"TIMESCALEDB_PASSWORD":{"name":"","property":""},"TIMESCALEDB_SSL_ROOT_CERT":{"name":"","property":""},"TIMESCALEDB_USERNAME":{"name":"","property":""}},"secretStore":{"kind":"","name":""}}]}}` | TimescaleDB secrets |
| tolerations | list | `[]` |  |
| workloadIdentity.enabled | bool | `false` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.11.0](https://github.com/norwoodj/helm-docs/releases/v1.11.0)
