{{/*
Expand the name of the chart.
*/}}
{{- define "ff-db-migrations.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "ff-db-migrations.fullname" -}}
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
{{- define "ff-db-migrations.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "ff-db-migrations.labels" -}}
helm.sh/chart: {{ include "ff-db-migrations.chart" . }}
{{ include "ff-db-migrations.selectorLabels" . }}
app.kubernetes.io/part-of: harness-feature-flags
app.kubernetes.io/component: admin
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "ff-db-migrations.selectorLabels" -}}
app.kubernetes.io/name: {{ include "ff-db-migrations.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "ff-db-migrations.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "ff-db-migrations.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{- define "ff-db-migrations.pullSecrets" -}}
{{ include "common.images.pullSecrets" (dict "images" (list .Values.image ) "global" .Values.global ) }}
{{- end -}}

{{- define "timescaleSSLMode" }}
    {{- $ := .context }}
    {{- $globalCtx := $.Values.global.database.timescaledb }}
    {{- if $globalCtx.installed }}
        {{- $globalCtx = dict }}
    {{- end }}
    {{- $localCtx := default $.Values.timescaledb .localCtx }}
    {{- $mergedCtx := $globalCtx }}
    {{- if $localCtx.enabled }}
        {{- $mergedCtx = $localCtx }}
    {{- end }}
    {{- $sslMode := default "disable" $mergedCtx.sslMode }}
    {{- printf "%s" $sslMode }}
{{- end }}

{{- define "postgresSSLMode" }}
    {{- $ := .context }}
    {{- $globalCtx := $.Values.global.database.postgres }}
    {{- if $globalCtx.installed }}
        {{- $globalCtx = dict }}
    {{- end }}
    {{- $localCtx := default $.Values.postgres .localCtx }}
    {{- $mergedCtx := $globalCtx }}
    {{- if $localCtx.enabled }}
        {{- $mergedCtx = $localCtx }}
    {{- end }}
    {{- $sslMode := default "disable" $mergedCtx.sslMode }}
    {{- printf "%s" $sslMode }}
{{- end }}
