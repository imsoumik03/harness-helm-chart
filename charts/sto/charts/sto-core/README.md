# sto-core

![Version: 0.12.5](https://img.shields.io/badge/Version-0.12.5-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.76.1](https://img.shields.io/badge/AppVersion-1.76.1-informational?style=flat-square)

A Helm chart for Kubernetes

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://harness.github.io/helm-common | harness-common | 1.x.x |

## Values

| Key | Type | Default                            | Description |
|-----|------|------------------------------------|-------------|
| additionalConfigs | object | `{}`                               |  |
| affinity | object | `{}`                               |  |
| autoscaling.enabled | bool | `false`                            |  |
| autoscaling.maxReplicas | int | `100`                              |  |
| autoscaling.minReplicas | int | `1`                                |  |
| autoscaling.targetCPU | string | `""`                               |  |
| autoscaling.targetMemory | string | `""`                               |  |
| extraVolumeMounts | list | `[]`                               |  |
| extraVolumes | list | `[]`                               |  |
| fullnameOverride | string | `""`                               |  |
| global.database.postgres.extraArgs | string | `""`                               |  |
| global.database.postgres.hosts[0] | string | `"postgres:5432"`                  |  |
| global.database.postgres.installed | bool | `true`                             |  |
| global.database.postgres.passwordKey | string | `""`                               |  |
| global.database.postgres.protocol | string | `"postgres"`                       |  |
| global.database.postgres.secretName | string | `""`                               |  |
| global.database.postgres.userKey | string | `""`                               |  |
| global.imagePullSecrets | list | `[]`                               |  |
| global.ingress.className | string | `"harness"`                        | set ingress object classname |
| global.ingress.enabled | bool | `false`                            | create ingress objects |
| global.ingress.hosts | list | `["my-host.example.org"]`          | set host of ingressObjects |
| global.ingress.objects | object | `{"annotations":{}}`               | add annotations to ingress objects |
| global.ingress.tls | object | `{"enabled":true,"secretName":""}` | set tls for ingress objects |
| global.istio.enabled | bool | `false`                            | create virtualServices objects |
| global.istio.gateway | object | `{"create":false}`                 | create gateway and use in virtualservice |
| global.istio.virtualService | object | `{"gateways":null,"hosts":null}`   | if gateway not created, use specified gateway and host |
| global.kubeVersion | string | `""`                               |  |
| image.digest | string | `""`                               |  |
| image.imagePullSecrets | list | `[]`                               |  |
| image.pullPolicy | string | `"IfNotPresent"`                   |  |
| image.registry | string | `"docker.io"`                      |  |
| image.repository | string | `"harness/stocore-signed"`         |  |
| image.tag | string | `"v1.76.1"`                        |  |
| lifecycleHooks | object | `{}`                               |  |
| maxSurge | string | `"100%"`                           |  |
| maxUnavailable | int | `0`                                |  |
| nameOverride | string | `""`                               |  |
| nodeSelector | object | `{}`                               |  |
| podAnnotations | object | `{}`                               |  |
| podSecurityContext | object | `{}`                               |  |
| postgresPassword.key | string | `"postgres-password"`              |  |
| postgresPassword.name | string | `"postgres"`                       |  |
| replicaCount | int | `1`                                |  |
| resources.requests.cpu | string | `"500m"`                           |  |
| resources.requests.memory | string | `"500Mi"`                          |  |
| retryMigrations | bool | `true`                             |  |
| securityContext | object | `{}`                               |  |
| service.port | int | `4000`                             |  |
| service.type | string | `"ClusterIP"`                      |  |
| serviceAccount.annotations | object | `{}`                               |  |
| serviceAccount.create | bool | `false`                            |  |
| serviceAccount.name | string | `"harness-default"`                |  |
| stoAppAuditJWTSecret.key | string | `"stoAppAuditJWTSecret"`           |  |
| stoAppAuditJWTSecret.name | string | `"harness-secrets"`                |  |
| stoAppHarnessToken.key | string | `"stoAppHarnessToken"`             |  |
| stoAppHarnessToken.name | string | `"harness-secrets"`                |  |
| tolerations | list | `[]`                               |  |
| waitForInitContainer.image.digest | string | `""`                               |  |
| waitForInitContainer.image.pullPolicy | string | `"IfNotPresent"`                   |  |
| waitForInitContainer.image.registry | string | `"docker.io"`                      |  |
| waitForInitContainer.image.repository | string | `"harness/helm-init-container"`    |  |
| waitForInitContainer.image.tag | string | `"latest"`                         |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.11.0](https://github.com/norwoodj/helm-docs/releases/v1.11.0)
