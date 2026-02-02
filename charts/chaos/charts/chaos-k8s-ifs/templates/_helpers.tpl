{{/*
Expand the name of the chart.
*/}}
{{- define "chaos-k8s-ifs.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "chaos-k8s-ifs.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "chaos-k8s-ifs.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "chaos-k8s-ifs.labels" -}}
helm.sh/chart: {{ include "chaos-k8s-ifs.chart" . }}
{{ include "chaos-k8s-ifs.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "chaos-k8s-ifs.selectorLabels" -}}
app.kubernetes.io/name: {{ include "chaos-k8s-ifs.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "chaos-k8s-ifs.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "chaos-k8s-ifs.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{- define "chaos-k8s-ifs.pullSecrets" -}}
{{ include "common.images.pullSecrets" (dict "images" (list .Values.image ) "global" .Values.global ) }}
{{- end -}}

{{/*
Create the name of the ddcr image to use
*/}}
{{- define "chaos-k8s-ifs.ddcrImage" -}}
{{ include "common.images.image" (dict "imageRoot" .Values.ddcrImage.image "global" .Values.global) }}
{{- end }}

{{/*
Create the name of the logWatcherImage image to use
*/}}
{{- define "chaos-k8s-ifs.logWatcherImage" -}}
{{ include "common.images.image" (dict "imageRoot" .Values.logWatcherImage.image "global" .Values.global) }}
{{- end }}

{{/*
Create the name of the subscriber image to use
*/}}
{{- define "chaos-k8s-ifs.subscriberImage" -}}
{{ include "common.images.image" (dict "imageRoot" .Values.subscriberImage.image "global" .Values.global) }}
{{- end }}

{{/*
Create the name of the argoWorkflowController image to use
*/}}
{{- define "chaos-k8s-ifs.argoWorkflowControllerImage" -}}
{{ include "common.images.image" (dict "imageRoot" .Values.argoWorkflowControllerImage.image "global" .Values.global) }}
{{- end }}

{{/*
Create the name of the argoWorkflowExecutorImage image to use
*/}}
{{- define "chaos-k8s-ifs.argoWorkflowExecutorImage" -}}
{{ include "common.images.image" (dict "imageRoot" .Values.argoWorkflowExecutorImage.image "global" .Values.global) }}
{{- end }}

{{/*
Create the name of the litmusChaosOperatorImage image to use
*/}}
{{- define "chaos-k8s-ifs.litmusChaosOperatorImage" -}}
{{ include "common.images.image" (dict "imageRoot" .Values.litmusChaosOperatorImage.image "global" .Values.global) }}
{{- end }}

{{/*
Create the name of the litmusChaosRunnerImage image to use
*/}}
{{- define "chaos-k8s-ifs.litmusChaosRunnerImage" -}}
{{ include "common.images.image" (dict "imageRoot" .Values.litmusChaosRunnerImage.image "global" .Values.global) }}
{{- end }}

{{/*
Create the name of the litmusChaosExporterImage image to use
*/}}
{{- define "chaos-k8s-ifs.litmusChaosExporterImage" -}}
{{ include "common.images.image" (dict "imageRoot" .Values.litmusChaosExporterImage.image "global" .Values.global) }}
{{- end }}

{{/*
Create the name of the k8sInfraUpgraderImage image to use
*/}}
{{- define "chaos-k8s-ifs.k8sInfraUpgraderImage" -}}
{{ include "common.images.image" (dict "imageRoot" .Values.k8sInfraUpgraderImage.image "global" .Values.global) }}
{{- end }}

{{/*
Create the name of the chaosGoRunnerImage image to use
*/}}
{{- define "chaos-k8s-ifs.chaosGoRunnerImage" -}}
{{ include "common.images.image" (dict "imageRoot" .Values.chaosGoRunnerImage.image "global" .Values.global) }}
{{- end }}

{{/*
Create the name of the chaosGoRunnerBaseImage image to use
*/}}
{{- define "chaos-k8s-ifs.chaosGoRunnerBaseImage" -}}
{{ include "common.images.image" (dict "imageRoot" .Values.chaosGoRunnerBaseImage.image "global" .Values.global) }}
{{- end }}

{{/*
Create the name of the chaosGoRunnerIoImage image to use
*/}}
{{- define "chaos-k8s-ifs.chaosGoRunnerIoImage" -}}
{{ include "common.images.image" (dict "imageRoot" .Values.chaosGoRunnerIoImage.image "global" .Values.global) }}
{{- end }}

{{/*
Create the name of the chaosGoRunnerTimeImage image to use
*/}}
{{- define "chaos-k8s-ifs.chaosGoRunnerTimeImage" -}}
{{ include "common.images.image" (dict "imageRoot" .Values.chaosGoRunnerTimeImage.image "global" .Values.global) }}
{{- end }}

{{/*
Create the name of the ddcrFaultsImage image to use
*/}}
{{- define "chaos-k8s-ifs.ddcrFaultsImage" -}}
{{ include "common.images.image" (dict "imageRoot" .Values.ddcrFaultsImage.image "global" .Values.global) }}
{{- end }}

{{/*
Create the name of the ddcrLibImage image to use
*/}}
{{- define "chaos-k8s-ifs.ddcrLibImage" -}}
{{ include "common.images.image" (dict "imageRoot" .Values.ddcrLibImage.image "global" .Values.global) }}
{{- end }}

{{/*
Create the name of the eventWatcherImage image to use
*/}}
{{- define "chaos-k8s-ifs.eventWatcherImage" -}}
{{ include "common.images.image" (dict "imageRoot" .Values.eventWatcherImage.image "global" .Values.global) }}
{{- end }}

{{/*
Manage chaos-k8s-ifs Secrets
USAGE:
{{- include "chaos-k8s-ifs.generateSecrets" (dict "ctx" $)}}
*/}}
{{- define "chaos-k8s-ifs.generateSecrets" }}
    {{- $ := .ctx }}
    {{- $hasAtleastOneSecret := false }}
    {{- $localESOSecretCtxIdentifier := (include "harnesscommon.secrets.localESOSecretCtxIdentifier" (dict "ctx" $ )) }}
    {{- if eq (include "harnesscommon.secrets.isDefaultAppSecret" (dict "ctx" $ "variableName" "CUSTOM_TLS_CERT")) "true" }}
    {{- $hasAtleastOneSecret = true }}
CUSTOM_TLS_CERT: '{{ default $.Values.customTlsCert $.Values.secrets.default.CUSTOM_TLS_CERT }}'
    {{- end }}
    {{- if eq (include "harnesscommon.secrets.isDefaultAppSecret" (dict "ctx" $ "variableName" "CHAOS_SERVICE_JWT_SECRET")) "true" }}
    {{- $hasAtleastOneSecret = true }}
CHAOS_SERVICE_JWT_SECRET: '{{ $.Values.secrets.default.CHAOS_SERVICE_JWT_SECRET }}'
    {{- end }}
    {{- if eq (include "harnesscommon.secrets.isDefaultAppSecret" (dict "ctx" $ "variableName" "NG_JWT_SECRET")) "true" }}
    {{- $hasAtleastOneSecret = true }}
NG_JWT_SECRET: '{{ $.Values.secrets.default.NG_JWT_SECRET }}'
    {{- end }}
    {{- if eq (include "harnesscommon.secrets.isDefaultAppSecret" (dict "ctx" $ "variableName" "JWT_SECRET")) "true" }}
    {{- $hasAtleastOneSecret = true }}
JWT_SECRET: '{{ $.Values.secrets.default.JWT_SECRET }}'
    {{- end }}
    {{- if eq (include "harnesscommon.secrets.isDefaultAppSecret" (dict "ctx" $ "variableName" "JWT_IDENTITY_SERVICE_SECRET")) "true" }}
    {{- $hasAtleastOneSecret = true }}
JWT_IDENTITY_SERVICE_SECRET: '{{ $.Values.secrets.default.JWT_IDENTITY_SERVICE_SECRET }}'
    {{- end }}
    {{- if eq (include "harnesscommon.secrets.isDefaultAppSecret" (dict "ctx" $ "variableName" "REDIS_PASSWORD")) "true" }}
    {{- $hasAtleastOneSecret = true }}
REDIS_PASSWORD: '{{ $.Values.secrets.default.REDIS_PASSWORD }}'
    {{- end }}
    {{- if eq (include "harnesscommon.secrets.isDefaultAppSecret" (dict "ctx" $ "variableName" "REDIS_CACHE_PASSWORD")) "true" }}
    {{- $hasAtleastOneSecret = true }}
REDIS_CACHE_PASSWORD: '{{ $.Values.secrets.default.REDIS_CACHE_PASSWORD }}'
    {{- end }}
    {{- if eq (include "harnesscommon.secrets.isDefaultAppSecret" (dict "ctx" $ "variableName" "SEGMENT_API_KEY")) "true" }}
    {{- $hasAtleastOneSecret = true }}
SEGMENT_API_KEY: '{{ $.Values.secrets.default.SEGMENT_API_KEY }}'
    {{- end }}
    {{- if eq (include "harnesscommon.secrets.isDefaultAppSecret" (dict "ctx" $ "variableName" "LOG_SERVICE_TOKEN")) "true" }}
    {{- $hasAtleastOneSecret = true }}
LOG_SERVICE_TOKEN: '{{ $.Values.secrets.default.LOG_SERVICE_TOKEN }}'
    {{- end }}
    {{- if eq (include "harnesscommon.secrets.isDefaultAppSecret" (dict "ctx" $ "variableName" "SLACK_URL")) "true" }}
    {{- $hasAtleastOneSecret = true }}
SLACK_URL: '{{ $.Values.secrets.default.SLACK_URL }}'
    {{- end }}
    {{- if not $hasAtleastOneSecret }}
{}
    {{- end }}
{{- end }}
