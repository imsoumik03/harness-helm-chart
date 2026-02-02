# chaos-web

![Version: 0.14.0](https://img.shields.io/badge/Version-0.14.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.30.0](https://img.shields.io/badge/AppVersion-1.30.0-informational?style=flat-square)

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
| config.ENABLE_CDN | string | `"false"` |  |
| configmap | object | `{}` |  |
| extraVolumeMounts | list | `[]` |  |
| extraVolumes | list | `[]` |  |
| fullnameOverride | string | `""` |  |
| global.cd.enabled | bool | `true` | Enable to install CD |
| global.commonAnnotations | object | `{}` |  |
| global.commonLabels | object | `{}` |  |
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
| image.digest | string | `""` |  |
| image.pullPolicy | string | `"Always"` |  |
| image.registry | string | `"docker.io"` |  |
| image.repository | string | `"harness/smp-chaos-web-signed"` |  |
| image.tag | string | `"1.30.1"` |  |
| ingress.objects[0].annotations."nginx.ingress.kubernetes.io/proxy-read-timeout" | string | `"300"` |  |
| ingress.objects[0].annotations."nginx.ingress.kubernetes.io/rewrite-target" | string | `"/$2"` |  |
| ingress.objects[0].annotations."nginx.ingress.kubernetes.io/use-regex" | string | `"true"` |  |
| ingress.objects[0].name | string | `"chaos-web"` |  |
| ingress.objects[0].paths[0].backend.service.name | string | `"chaos-web-service"` |  |
| ingress.objects[0].paths[0].path | string | `"{{ .Values.global.ingress.pathPrefix }}/chaos(/|$)(.*)"` |  |
| lifecycleHooks | object | `{}` |  |
| maxSurge | int | `1` |  |
| maxUnavailable | int | `0` |  |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| platform.harness-manager.featureFlags.ADDITIONAL | string | `"CHAOS_ENABLED"` |  |
| platform.harness-manager.featureFlags.OPA | string | `"OPA_PIPELINE_GOVERNANCE"` |  |
| podAnnotations | object | `{}` |  |
| podLabels | object | `{}` |  |
| podSecurityContext | object | `{}` |  |
| replicaCount | int | `1` |  |
| resources.limits.memory | string | `"512Mi"` |  |
| resources.requests.cpu | string | `"500m"` |  |
| resources.requests.memory | string | `"512Mi"` |  |
| securityContext | object | `{}` |  |
| service.annotations | object | `{}` |  |
| service.port | int | `8184` |  |
| service.targetport | int | `8184` |  |
| service.type | string | `"ClusterIP"` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.create | bool | `false` |  |
| serviceAccount.name | string | `"harness-default"` |  |
| tolerations | list | `[]` |  |
| virtualService.annotations | object | `{}` |  |
| virtualService.objects[0].pathMatchType | string | `"prefix"` |  |
| virtualService.objects[0].pathRewrite | string | `"/"` |  |
| virtualService.objects[0].paths[0].backend.service.name | string | `"chaos-web-service"` |  |
| virtualService.objects[0].paths[0].path | string | `"{{ .Values.global.istio.virtualService.pathPrefix }}/chaos/"` |  |
| virtualService.objects[0].paths[1].backend.service.name | string | `"chaos-web-service"` |  |
| virtualService.objects[0].paths[1].path | string | `"{{ .Values.global.istio.virtualService.pathPrefix }}/chaos"` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.11.0](https://github.com/norwoodj/helm-docs/releases/v1.11.0)
