{{/*
Expand the name of the chart.
*/}}
{{- define "ticket-service.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "ticket-service.fullname" -}}
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
{{- define "ticket-service.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "ticket-service.labels" -}}
helm.sh/chart: {{ include "ticket-service.chart" . }}
{{ include "ticket-service.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "ticket-service.selectorLabels" -}}
app.kubernetes.io/name: {{ include "ticket-service.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "ticket-service.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "ticket-service.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{- define "ticket-service.pullSecrets" -}}
{{ include "common.images.pullSecrets" (dict "images" (list .Values.image) "global" .Values.global ) }}
{{- end -}}

{{/*
Manage ticket-service  Secrets
USAGE:
{{- "ticket-service.generateSecrets" (dict "ctx" $)}}
*/}}
{{- define "ticket-service.generateSecrets" }}
    {{- $ := .ctx }}
    {{- $hasAtleastOneSecret := false }}
    {{- $localESOSecretCtxIdentifier := (include "harnesscommon.secrets.localESOSecretCtxIdentifier" (dict "ctx" $ )) }}
    {{- if eq (include "harnesscommon.secrets.isDefaultAppSecret" (dict "ctx" $ "variableName" "APP_TOKEN_JWT_SECRET")) "true" }}
    {{- $hasAtleastOneSecret = true }}
APP_TOKEN_JWT_SECRET: {{ .ctx.Values.secrets.default.APP_TOKEN_JWT_SECRET | b64enc }}
    {{- end }}
    {{- if eq (include "harnesscommon.secrets.isDefaultAppSecret" (dict "ctx" $ "variableName" "APP_NG_MANAGER_SECRET")) "true" }}
    {{- $hasAtleastOneSecret = true }}
APP_NG_MANAGER_SECRET: {{ .ctx.Values.secrets.default.APP_NG_MANAGER_SECRET | b64enc }}
    {{- end }}
    {{- if eq (include "harnesscommon.secrets.isDefaultAppSecret" (dict "ctx" $ "variableName" "APP_INTERNAL_TOKEN_JWT_SECRET")) "true" }}
    {{- $hasAtleastOneSecret = true }}
APP_INTERNAL_TOKEN_JWT_SECRET: {{ .ctx.Values.secrets.default.APP_INTERNAL_TOKEN_JWT_SECRET | b64enc }}
    {{- end }}
    {{- if not $hasAtleastOneSecret }}
{}
    {{- end }}
{{- end }}