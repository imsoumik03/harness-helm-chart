{{/*
Expand the name of the chart.
*/}}
{{- define "sto-core.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "sto-core.parseSearchPath" -}}
  {{- $searchPath := "public" -}}
  {{- $inputString := . -}}
  {{- if not (eq $inputString "") -}}
    {{- $parts := split "&" $inputString -}}
      {{- range $part := $parts -}}
      {{- $kv := split "=" $part -}}
      {{- if (eq ($kv._0) "search_path") -}}
        {{- $searchPath = $kv._1 -}}
      {{- end -}}
    {{- end -}}
  {{- end -}}
  {{ $searchPath }}
{{- end -}}

{{- define "sto-core.dbCreationConnection" -}}
{{- $ := .ctx -}}
{{- $connection := include "harnesscommon.dbconnectionv2.postgresConnection" (dict "ctx" $) -}}
{{- $connectionWithoutQueryAndDB := regexReplaceAll "(.*/).*$" $connection "$1" -}}
{{ $connectionWithoutQueryAndDB }}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "sto-core.fullname" -}}
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
{{- define "sto-core.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "sto-core.labels" -}}
helm.sh/chart: {{ include "sto-core.chart" . }}
{{ include "sto-core.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "sto-core.selectorLabels" -}}
app.kubernetes.io/name: {{ include "sto-core.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "sto-core.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "sto-core.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{- define "sto-core.pullSecrets" -}}
{{ include "common.images.pullSecrets" (dict "images" (list .Values.image) "global" .Values.global ) }}
{{- end -}}


{{/*
Manage sto-core  Secrets
USAGE:
{{- "sto-core.generateSecrets" (dict "ctx" $)}}
*/}}
{{- define "sto-core.generateSecrets" }}
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
