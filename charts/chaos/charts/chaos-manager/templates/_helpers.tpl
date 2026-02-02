{{/*
Expand the name of the chart.
*/}}
{{- define "chaos-manager.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "chaos-manager.fullname" -}}
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
{{- define "chaos-manager.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "chaos-manager.labels" -}}
helm.sh/chart: {{ include "chaos-manager.chart" . }}
{{ include "chaos-manager.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "chaos-manager.selectorLabels" -}}
app.kubernetes.io/name: {{ include "chaos-manager.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "chaos-manager.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "chaos-manager.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}


{{/*
Create the name of the subscriber image to use
*/}}
{{- define "chaos-manager.subscriberImage" -}}
{{ include "common.images.image" (dict "imageRoot" .Values.subscriberImage.image "global" .Values.global) }}
{{- end }}

{{/*
Create the name of the argoWorkflowController image to use
*/}}
{{- define "chaos-manager.argoWorkflowControllerImage" -}}
{{ include "common.images.image" (dict "imageRoot" .Values.argoWorkflowControllerImage.image "global" .Values.global) }}
{{- end }}

{{/*
Create the name of the argoWorkflowExecutorImage image to use
*/}}
{{- define "chaos-manager.argoWorkflowExecutorImage" -}}
{{ include "common.images.image" (dict "imageRoot" .Values.argoWorkflowExecutorImage.image "global" .Values.global) }}
{{- end }}

{{/*
Create the name of the litmusChaosOperatorImage image to use
*/}}
{{- define "chaos-manager.litmusChaosOperatorImage" -}}
{{ include "common.images.image" (dict "imageRoot" .Values.litmusChaosOperatorImage.image "global" .Values.global) }}
{{- end }}

{{/*
Create the name of the litmusChaosRunnerImage image to use
*/}}
{{- define "chaos-manager.litmusChaosRunnerImage" -}}
{{ include "common.images.image" (dict "imageRoot" .Values.litmusChaosRunnerImage.image "global" .Values.global) }}
{{- end }}

{{/*
Create the name of the litmusChaosExporterImage image to use
*/}}
{{- define "chaos-manager.litmusChaosExporterImage" -}}
{{ include "common.images.image" (dict "imageRoot" .Values.litmusChaosExporterImage.image "global" .Values.global) }}
{{- end }}

{{/*
Create the name of the logWatcherImage image to use
*/}}
{{- define "chaos-manager.logWatcherImage" -}}
{{ include "common.images.image" (dict "imageRoot" .Values.logWatcherImage.image "global" .Values.global) }}
{{- end }}

{{- define "chaos-manager.pullSecrets" -}}
{{ include "common.images.pullSecrets" (dict "images" (list .Values.image ) "global" .Values.global ) }}
{{- end -}}

{{/*
Create the name of the chaosHub image to use
*/}}
{{- define "chaos-manager.chaosHubImage" -}}
{{ include "common.images.image" (dict "imageRoot" .Values.chaosHubImage.image "global" .Values.global) }}
{{- end }}

{{/*
Create the name of the ddcrImage image to use
*/}}
{{- define "chaos-manager.ddcrImage" -}}
{{ include "common.images.image" (dict "imageRoot" .Values.ddcrImage.image "global" .Values.global) }}
{{- end }}

{{/*
Create the name of the ddcrFaultsImage image to use
*/}}
{{- define "chaos-manager.ddcrFaultsImage" -}}
{{ include "common.images.image" (dict "imageRoot" .Values.ddcrFaultsImage.image "global" .Values.global) }}
{{- end }}

{{/*
Create the name of the ddcrLibImage image to use
*/}}
{{- define "chaos-manager.ddcrLibImage" -}}
{{ include "common.images.image" (dict "imageRoot" .Values.ddcrLibImage.image "global" .Values.global) }}
{{- end }}


{{/*
Manage Chaos Manager Secrets

USAGE:
{{- "chaos-manager.generateSecrets" (dict "ctx" $)}}
*/}}
{{- define "chaos-manager.generateSecrets" }}
    {{- $ := .ctx }}
    {{- $hasAtleastOneSecret := false }}
    {{- $localESOSecretCtxIdentifier := (include "harnesscommon.secrets.localESOSecretCtxIdentifier" (dict "ctx" $ )) }}
    {{- if eq (include "harnesscommon.secrets.isDefaultAppSecret" (dict "ctx" $ "variableName" "CHAOS_SERVICE_JWT_SECRET")) "true" }}
    {{- $hasAtleastOneSecret = true }}
CHAOS_SERVICE_JWT_SECRET: '{{ .ctx.Values.secrets.default.CHAOS_SERVICE_JWT_SECRET }}'
    {{- end }}
    {{- if eq (include "harnesscommon.secrets.isDefaultAppSecret" (dict "ctx" $ "variableName" "NG_JWT_SECRET")) "true" }}
    {{- $hasAtleastOneSecret = true }}
NG_JWT_SECRET: '{{ .ctx.Values.secrets.default.NG_JWT_SECRET }}'
    {{- end }}
    {{- if eq (include "harnesscommon.secrets.isDefaultAppSecret" (dict "ctx" $ "variableName" "REDIS_LOCK_PASSWORD")) "true" }}
    {{- $hasAtleastOneSecret = true }}
REDIS_LOCK_PASSWORD: '{{ .ctx.Values.secrets.default.REDIS_LOCK_PASSWORD }}'
    {{- end }}
    {{- if eq (include "harnesscommon.secrets.isDefaultAppSecret" (dict "ctx" $ "variableName" "JWT_SECRET")) "true" }}
    {{- $hasAtleastOneSecret = true }}
JWT_SECRET: '{{ .ctx.Values.secrets.default.JWT_SECRET }}'
    {{- end }}
    {{- if eq (include "harnesscommon.secrets.isDefaultAppSecret" (dict "ctx" $ "variableName" "JWT_IDENTITY_SERVICE_SECRET")) "true" }}
    {{- $hasAtleastOneSecret = true }}
JWT_IDENTITY_SERVICE_SECRET: '{{ .ctx.Values.secrets.default.JWT_IDENTITY_SERVICE_SECRET }}'
    {{- end }}
    {{- if eq (include "harnesscommon.secrets.isDefaultAppSecret" (dict "ctx" $ "variableName" "REDIS_PASSWORD")) "true" }}
    {{- $hasAtleastOneSecret = true }}
REDIS_PASSWORD: '{{ .ctx.Values.secrets.default.REDIS_PASSWORD }}'
    {{- end }}
    {{- if eq (include "harnesscommon.secrets.isDefaultAppSecret" (dict "ctx" $ "variableName" "REDIS_CACHE_PASSWORD")) "true" }}
    {{- $hasAtleastOneSecret = true }}
REDIS_CACHE_PASSWORD: '{{ .ctx.Values.secrets.default.REDIS_CACHE_PASSWORD }}'
    {{- end }}
    {{- if eq (include "harnesscommon.secrets.isDefaultAppSecret" (dict "ctx" $ "variableName" "SEGMENT_API_KEY")) "true" }}
    {{- $hasAtleastOneSecret = true }}
SEGMENT_API_KEY: '{{ .ctx.Values.secrets.default.SEGMENT_API_KEY }}'
    {{- end }}
    {{- if eq (include "harnesscommon.secrets.isDefaultAppSecret" (dict "ctx" $ "variableName" "ENTERPRISE_HUB_SECRET")) "true" }}
    {{- $hasAtleastOneSecret = true }}
ENTERPRISE_HUB_SECRET: '{{ .ctx.Values.secrets.default.ENTERPRISE_HUB_SECRET }}'
    {{- end }}
    {{- if eq (include "harnesscommon.secrets.isDefaultAppSecret" (dict "ctx" $ "variableName" "ENTERPRISE_HUB_TOKEN")) "true" }}
    {{- $hasAtleastOneSecret = true }}
ENTERPRISE_HUB_TOKEN: '{{ .ctx.Values.secrets.default.ENTERPRISE_HUB_TOKEN }}'
    {{- end }}
    {{- if eq (include "harnesscommon.secrets.isDefaultAppSecret" (dict "ctx" $ "variableName" "APP_AI_SECRET")) "true" }}
    {{- $hasAtleastOneSecret = true }}
APP_AI_SECRET: '{{ .ctx.Values.secrets.default.APP_AI_SECRET }}'
    {{- end }}
    {{- if eq (include "harnesscommon.secrets.isDefaultAppSecret" (dict "ctx" $ "variableName" "BASIC_AUTH_USERNAME")) "true" }}
    {{- $hasAtleastOneSecret = true }}
BASIC_AUTH_USERNAME: '{{ .ctx.Values.secrets.default.BASIC_AUTH_USERNAME }}'
    {{- end }}
    {{- if eq (include "harnesscommon.secrets.isDefaultAppSecret" (dict "ctx" $ "variableName" "BASIC_AUTH_PASSWORD")) "true" }}
    {{- $hasAtleastOneSecret = true }}
BASIC_AUTH_PASSWORD: '{{ .ctx.Values.secrets.default.BASIC_AUTH_PASSWORD }}'
    {{- end }}
    {{- if eq (include "harnesscommon.secrets.isDefaultAppSecret" (dict "ctx" $ "variableName" "LOG_SERVICE_TOKEN")) "true" }}
    {{- $hasAtleastOneSecret = true }}
LOG_SERVICE_TOKEN: '{{ .ctx.Values.secrets.default.LOG_SERVICE_TOKEN }}'
    {{- end }}
    {{- if eq (include "harnesscommon.secrets.isDefaultAppSecret" (dict "ctx" $ "variableName" "SLACK_URL")) "true" }}
    {{- $hasAtleastOneSecret = true }}
SLACK_URL: '{{ .ctx.Values.secrets.default.SLACK_URL }}'
    {{- end }}
    {{- if eq (include "harnesscommon.secrets.isDefaultAppSecret" (dict "ctx" $ "variableName" "SERVICE_DISCOVERY_TOKEN")) "true" }}
    {{- $hasAtleastOneSecret = true }}
SERVICE_DISCOVERY_TOKEN: '{{ $.Values.secrets.default.SERVICE_DISCOVERY_TOKEN }}'
    {{- end }}
    {{- if not $hasAtleastOneSecret }}
{}
    {{- end }}
    {{- if eq (include "harnesscommon.secrets.isDefaultAppSecret" (dict "ctx" $ "variableName" "SEGMENT_PLG_UTILITIES_KEY")) "true" }}
    {{- $hasAtleastOneSecret = true }}
SEGMENT_PLG_UTILITIES_KEY: '{{ $.Values.secrets.default.SEGMENT_PLG_UTILITIES_KEY }}'
    {{- end }}
{{- end }}

Manage bg-processor Secrets

USAGE:
{{- "bg_processor.generateSecrets" (dict "ctx" $)}}
*/}}
{{- define "bg_processor.generateSecrets" }}
    {{- $ := .ctx }}
    {{- $hasAtleastOneSecret := false }}
    {{- $localESOSecretCtxIdentifier := (include "harnesscommon.secrets.localESOSecretCtxIdentifier" (dict "ctx" $ )) }}
    {{- if eq (include "harnesscommon.secrets.isDefaultAppSecret" (dict "ctx" $ "variableName" "SLACK_URL")) "true" }}
    {{- $hasAtleastOneSecret = true }}
SLACK_URL: '{{ default $.Values.jobs.bg_processor.slackURLToNotify $.Values.secrets.default.SLACK_URL }}'
    {{- end }}
    {{- if not $hasAtleastOneSecret }}
{}
    {{- end }}
{{- end }}
