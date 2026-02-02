{{/*
Expand the name of the chart.
*/}}
{{- define "chaos-machine-ifc.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "chaos-machine-ifc.fullname" -}}
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
{{- define "chaos-machine-ifc.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "chaos-machine-ifc.labels" -}}
helm.sh/chart: {{ include "chaos-machine-ifc.chart" . }}
{{ include "chaos-machine-ifc.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "chaos-machine-ifc.selectorLabels" -}}
app.kubernetes.io/name: {{ include "chaos-machine-ifc.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "chaos-machine-ifc.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "chaos-machine-ifc.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{- define "chaos-machine-ifc.pullSecrets" -}}
{{ include "common.images.pullSecrets" (dict "images" (list .Values.image ) "global" .Values.global ) }}
{{- end -}}

{{/*
Manage chaos-machine-ifc Secrets
USAGE:
{{- include "chaos-machine-ifc.generateSecrets" (dict "ctx" $)}}
*/}}
{{- define "chaos-machine-ifc.generateSecrets" }}
    {{- $ := .ctx }}
    {{- $hasAtleastOneSecret := false }}
    {{- $localESOSecretCtxIdentifier := (include "harnesscommon.secrets.localESOSecretCtxIdentifier" (dict "ctx" $ )) }}
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
REDIS_CACHE_PASSWORD: '{{ .ctx.Values.secrets.default.REDIS_CACHE_PASSWORD }}'
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