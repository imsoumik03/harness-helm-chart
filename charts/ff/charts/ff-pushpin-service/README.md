# ff-pushpin-service

![Version: 0.9.0](https://img.shields.io/badge/Version-0.9.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.0.1](https://img.shields.io/badge/AppVersion-0.0.1-informational?style=flat-square)

A Helm chart for Kubernetes

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://harness.github.io/helm-common | harness-common | 1.x.x |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| appLogLevel | string | `"INFO"` |  |
| autoscaling.enabled | bool | `false` |  |
| autoscaling.maxReplicas | int | `100` |  |
| autoscaling.minReplicas | int | `1` |  |
| autoscaling.targetCPU | string | `""` |  |
| autoscaling.targetMemory | string | `""` |  |
| configmap | object | `{}` |  |
| extraVolumeMounts | list | `[]` |  |
| extraVolumes | list | `[]` |  |
| global.airgap | bool | `false` |  |
| global.database.mongo.extraArgs | string | `""` |  |
| global.database.mongo.hosts | list | `[]` | provide default values if mongo.installed is set to false |
| global.database.mongo.installed | bool | `true` |  |
| global.database.mongo.passwordKey | string | `""` |  |
| global.database.mongo.protocol | string | `"mongodb"` |  |
| global.database.mongo.secretName | string | `""` |  |
| global.database.mongo.userKey | string | `""` |  |
| global.database.redis.extraArgs | string | `""` |  |
| global.database.redis.hosts | list | `["redis:6379"]` | provide default values if redis.installed is set to false |
| global.database.redis.installed | bool | `true` |  |
| global.database.redis.passwordKey | string | `"redis-password"` |  |
| global.database.redis.protocol | string | `"redis"` |  |
| global.database.redis.secretName | string | `"redis-secret"` |  |
| global.database.redis.userKey | string | `"redis-user"` |  |
| global.database.timescaledb.certKey | string | `""` |  |
| global.database.timescaledb.certName | string | `""` |  |
| global.database.timescaledb.extraArgs | string | `""` |  |
| global.database.timescaledb.hosts | list | `["timescaledb-single-chart:5432"]` | provide default values if mongo.installed is set to false |
| global.database.timescaledb.installed | bool | `true` |  |
| global.database.timescaledb.passwordKey | string | `""` |  |
| global.database.timescaledb.protocol | string | `"jdbc:postgresql"` |  |
| global.database.timescaledb.secretName | string | `""` |  |
| global.database.timescaledb.userKey | string | `""` |  |
| global.ha | bool | `false` |  |
| global.imagePullSecrets | list | `[]` |  |
| global.ingress.className | string | `"harness"` | set ingress object classname |
| global.ingress.enabled | bool | `false` | create ingress objects |
| global.ingress.hosts | list | `["my-host.example.org"]` | set host of ingressObjects |
| global.ingress.objects | object | `{"annotations":{}}` | add annotations to ingress objects |
| global.ingress.tls | object | `{"enabled":true,"secretName":""}` | set tls for ingress objects |
| global.istio.enabled | bool | `false` | create virtualServices objects |
| global.istio.gateway | object | `{"create":false}` | create gateway and use in virtualservice |
| global.istio.virtualService | object | `{"gateways":null,"hosts":null}` | if gateway not created, use specified gateway and host |
| global.loadbalancerURL | string | `"test@harness.io"` |  |
| lifecycleHooks | object | `{}` |  |
| maxSurge | int | `1` |  |
| maxUnavailable | int | `0` |  |
| memory | int | `4096` |  |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| podAnnotations | object | `{}` |  |
| podSecurityContext | object | `{}` |  |
| pushpin.image.digest | string | `""` |  |
| pushpin.image.imagePullSecrets | list | `[]` |  |
| pushpin.image.pullPolicy | string | `"IfNotPresent"` |  |
| pushpin.image.registry | string | `"docker.io"` |  |
| pushpin.image.repository | string | `"harness/ff-pushpin-signed"` |  |
| pushpin.image.tag | string | `"1.0.11"` |  |
| pushpin.resources.limits.memory | string | `"2048Mi"` |  |
| pushpin.resources.requests.cpu | int | `1` |  |
| pushpin.resources.requests.memory | string | `"2048Mi"` |  |
| pushpinworker.image.digest | string | `""` |  |
| pushpinworker.image.imagePullSecrets | list | `[]` |  |
| pushpinworker.image.pullPolicy | string | `"IfNotPresent"` |  |
| pushpinworker.image.registry | string | `"docker.io"` |  |
| pushpinworker.image.repository | string | `"harness/ff-pushpin-worker-signed"` |  |
| pushpinworker.image.tag | string | `"1.1076.0"` |  |
| pushpinworker.resources.limits.memory | string | `"2048Mi"` |  |
| pushpinworker.resources.requests.cpu | int | `1` |  |
| pushpinworker.resources.requests.memory | string | `"2048Mi"` |  |
| pushpinworker.securityContext.runAsNonRoot | bool | `true` |  |
| pushpinworker.securityContext.runAsUser | int | `65534` |  |
| replicaCount | int | `1` |  |
| service.port | int | `17001` |  |
| service.port17002 | int | `17002` |  |
| service.port17003 | int | `17003` |  |
| service.targetport | int | `7999` |  |
| service.targetport17002 | int | `443` |  |
| service.targetport17003 | int | `5561` |  |
| service.type | string | `"ClusterIP"` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.create | bool | `false` |  |
| serviceAccount.name | string | `"harness-default"` |  |
| tolerations | list | `[]` |  |
| waitForInitContainer.image.digest | string | `""` |  |
| waitForInitContainer.image.imagePullSecrets | list | `[]` |  |
| waitForInitContainer.image.pullPolicy | string | `"IfNotPresent"` |  |
| waitForInitContainer.image.registry | string | `"docker.io"` |  |
| waitForInitContainer.image.repository | string | `"harness/helm-init-container"` |  |
| waitForInitContainer.image.tag | string | `"latest"` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.11.0](https://github.com/norwoodj/helm-docs/releases/v1.11.0)
