{{/*
Expand the name of the chart.
*/}}
{{- define "service-discovery-manager.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "service-discovery-manager.fullname" -}}
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
{{- define "service-discovery-manager.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "service-discovery-manager.labels" -}}
helm.sh/chart: {{ include "service-discovery-manager.chart" . }}
{{ include "service-discovery-manager.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "service-discovery-manager.selectorLabels" -}}
app.kubernetes.io/name: {{ include "service-discovery-manager.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "service-discovery-manager.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "service-discovery-manager.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
Create the name of the collector image to use
*/}}
{{- define "service-discovery-manager.collectorImage" -}}
{{ include "common.images.image" (dict "imageRoot" .Values.collectorImage.image "global" .Values.global) }}
{{- end }}

{{/*
Create the name of the logWatcherImage image to use
*/}}
{{- define "service-discovery-manager.logWatcherImage" -}}
{{ include "common.images.image" (dict "imageRoot" .Values.logWatcherImage.image "global" .Values.global) }}
{{- end }}

{{- define "service-discovery-manager.pullSecrets" -}}
{{ include "common.images.pullSecrets" (dict "images" (list .Values.image ) "global" .Values.global ) }}
{{- end -}}

{{/*
Manage Service Discovery Manager Secrets

USAGE:
{{- "service-discovery-manager.generateSecrets" (dict "ctx" $)}}
*/}}
{{- define "service-discovery-manager.generateSecrets" }}
    {{- $ := .ctx }}
    {{- $hasAtleastOneSecret := false }}
    {{- $localESOSecretCtxIdentifier := (include "harnesscommon.secrets.localESOSecretCtxIdentifier" (dict "ctx" $ )) }}
    {{- if eq (include "harnesscommon.secrets.isDefaultAppSecret" (dict "ctx" $ "variableName" "SERVICE_DISCOVERY_JWT_SECRET")) "true" }}
    {{- $hasAtleastOneSecret = true }}
SERVICE_DISCOVERY_JWT_SECRET: '{{ .ctx.Values.secrets.default.SERVICE_DISCOVERY_JWT_SECRET | b64enc }}'
    {{- end }}
    {{- if eq (include "harnesscommon.secrets.isDefaultAppSecret" (dict "ctx" $ "variableName" "NG_JWT_SECRET")) "true" }}
    {{- $hasAtleastOneSecret = true }}
NG_JWT_SECRET: '{{ .ctx.Values.secrets.default.NG_JWT_SECRET | b64enc }}'
    {{- end }}
    {{- if eq (include "harnesscommon.secrets.isDefaultAppSecret" (dict "ctx" $ "variableName" "ACL_JWT_SECRET")) "true" }}
    {{- $hasAtleastOneSecret = true }}
ACL_JWT_SECRET: '{{ .ctx.Values.secrets.default.ACL_JWT_SECRET | b64enc }}'
    {{- end }}
    {{- if eq (include "harnesscommon.secrets.isDefaultAppSecret" (dict "ctx" $ "variableName" "JWT_SECRET")) "true" }}
    {{- $hasAtleastOneSecret = true }}
JWT_SECRET: '{{ .ctx.Values.secrets.default.JWT_SECRET | b64enc }}'
    {{- end }}
    {{- if eq (include "harnesscommon.secrets.isDefaultAppSecret" (dict "ctx" $ "variableName" "LOG_SERVICE_SECRET")) "true" }}
    {{- $hasAtleastOneSecret = true }}
LOG_SERVICE_SECRET: '{{ .ctx.Values.secrets.default.LOG_SERVICE_SECRET | b64enc }}'
    {{- end }}
    {{- if not $hasAtleastOneSecret }}
{}
    {{- end }}
{{- end }}
