{{/*
Expand the name of the chart.
*/}}
{{- define "policy-mgmt.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "policy-mgmt.fullname" -}}
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
{{- define "policy-mgmt.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "policy-mgmt.labels" -}}
helm.sh/chart: {{ include "policy-mgmt.chart" . }}
{{ include "policy-mgmt.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "policy-mgmt.selectorLabels" -}}
app.kubernetes.io/name: {{ include "policy-mgmt.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "policy-mgmt.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "policy-mgmt.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{- define "policy-mgmt.pullSecrets" -}}
{{- if .Values.waitForInitContainer }}
    {{ include "common.images.pullSecrets" (dict "images" (list .Values.image .Values.waitForInitContainer.image) "global" .Values.global ) }}
{{- else }}
    {{ include "common.images.pullSecrets" (dict "images" (list .Values.image .Values.global.waitForInitContainer.image) "global" .Values.global ) }}
{{- end }}
{{- end -}}

{{/* Generates Postgres Connection string
USAGE:
{{ include "policy-mgmt.postgresConnection" (dict "context" $ "database" "policy-mgmt" "keywordValueConnectionString" true "setPasswordEmpty" true "setUsernameEmpty" true "localDBCtx" $.Values.postgres) }}
*/}}
{{- define "policy-mgmt.postgresConnection" -}}
{{- $ctx := .context }}
{{- $type := "postgres" }}
{{- $dbType := upper $type }}
{{- $globalDBCtx := $ctx.Values.global.database.postgres }}
{{- $localDBCtx := default $ctx.Values.postgres .localDBCtx }}
{{- $installed := $globalDBCtx.installed }}

{{- if and $localDBCtx (eq $localDBCtx.enabled true) -}}
    {{- $installed = false -}}
{{- end -}}

{{- $hosts := list -}}
{{- if and $localDBCtx $localDBCtx.hosts (gt (len $localDBCtx.hosts) 0) -}}
    {{- $hosts = $localDBCtx.hosts -}}
{{- else -}}
    {{- $hosts = $globalDBCtx.hosts -}}
{{- end -}}

{{- $keywordValueConnectionString := default true .keywordValueConnectionString -}}
{{- $protocol := default "postgresql" .protocol -}}
{{- $extraArgs := coalesce $localDBCtx.extraArgs $globalDBCtx.extraArgs "" -}}
{{- $userVariableName := default (printf "%s_USER" $dbType) .userVariableName -}}
{{- $passwordVariableName := default (printf "%s_PASSWORD" $dbType) .passwordVariableName -}}

{{- if .setUsernameEmpty -}}{{- $userVariableName = "" -}}{{- end -}}
{{- if .setPasswordEmpty -}}{{- $passwordVariableName = "" -}}{{- end -}}

{{- $sslMode := default "disable" $ctx.Values.config.PG_SSLMODE -}}
{{- $database := default (default "policy-mgmt" $ctx.Values.config.APP_DATABASE_DBNAME) .database -}}

{{/* derive host + port (start from hosts list) */}}
{{- $host := "" -}}
{{- $port := "" -}}
{{- if gt (len $hosts) 0 -}}
    {{- $hp := split ":" (index $hosts 0) -}}
    {{- $host = $hp._0 -}}
    {{- /* Use default to handle nil case for $hp._1 */ -}}
    {{- $port = default "5432" $hp._1 -}}
{{- else -}}
    {{- $host = "postgres" -}}
    {{- $port = "5432" -}}
{{- end -}}

{{/* if installed, prefer explicit .host values, preserving port if not provided */}}
{{- if $installed -}}
    {{- $override := coalesce $localDBCtx.host $globalDBCtx.host "" -}}
    {{- if $override -}}
        {{- $hp := split ":" $override -}}
        {{- $host = default $host $hp._0 -}}
        {{- /* nested default to ensure port becomes hp._1 if present otherwise existing $port, finally "5432" */ -}}
        {{- $port = default (default $port $hp._1) "5432" -}}
    {{- end -}}
{{- end -}}

{{/* Build outputs */}}
{{- if $keywordValueConnectionString -}}
    {{- $conn := printf "host=%s port=%s dbname=%s" $host $port $database -}}
    {{- if $userVariableName -}}
        {{- $conn = printf "%s user=%s" $conn $userVariableName -}}
    {{- end -}}
    {{- if $passwordVariableName -}}
        {{- $conn = printf "%s password=%s" $conn $passwordVariableName -}}
    {{- end -}}
    {{- /* Check if extraArgs already contains sslmode */ -}}
    {{- if and $extraArgs (contains "sslmode=" $extraArgs) -}}
        {{- $conn = printf "%s %s" $conn $extraArgs -}}
    {{- else -}}
        {{- $conn = printf "%s sslmode=%s" $conn $sslMode -}}
        {{- if $extraArgs -}}
            {{- $conn = printf "%s %s" $conn $extraArgs -}}
        {{- end -}}
    {{- end -}}
    {{- printf "%s" $conn -}}
{{- else -}}
    {{- $auth := "" -}}
    {{- if and $userVariableName $passwordVariableName -}}
        {{- $auth = printf "%s:%s@" $userVariableName $passwordVariableName -}}
    {{- end -}}
    {{- $uri := printf "%s://%s%s:%s/%s" $protocol $auth $host $port $database -}}
    {{- /* Check if extraArgs already contains sslmode */ -}}
    {{- if and $extraArgs (contains "sslmode=" $extraArgs) -}}
        {{- $uri = printf "%s?%s" $uri $extraArgs -}}
    {{- else -}}
        {{- $uri = printf "%s?sslmode=%s" $uri $sslMode -}}
        {{- if $extraArgs -}}
            {{- $uri = printf "%s&%s" $uri $extraArgs -}}
        {{- end -}}
    {{- end -}}
    {{- printf "%s" $uri -}}
{{- end }}
{{- end }}

{{/*
Manage policy-mgmt Secrets
USAGE:
{{- "policy-mgmt.generateSecrets" (dict "ctx" $)}}
*/}}
{{- define "policy-mgmt.generateSecrets" }}
    {{- $ := .ctx }}
    {{- $hasAtleastOneSecret := false }}
    {{- $localESOSecretCtxIdentifier := (include "harnesscommon.secrets.localESOSecretCtxIdentifier" (dict "ctx" $ )) }}
    {{- if eq (include "harnesscommon.secrets.isDefaultAppSecret" (dict "ctx" $ "variableName" "APP_TOKEN_JWT_SECRET")) "true" }}
    {{- $hasAtleastOneSecret = true }}
APP_TOKEN_JWT_SECRET: '{{ .ctx.Values.secrets.default.APP_TOKEN_JWT_SECRET | b64enc }}'
    {{- end }}
    {{- if eq (include "harnesscommon.secrets.isDefaultAppSecret" (dict "ctx" $ "variableName" "APP_INTERNAL_TOKEN_JWT_SECRET")) "true" }}
    {{- $hasAtleastOneSecret = true }}
APP_INTERNAL_TOKEN_JWT_SECRET: '{{ .ctx.Values.secrets.default.APP_INTERNAL_TOKEN_JWT_SECRET | b64enc }}'
    {{- end }}
    {{- if eq (include "harnesscommon.secrets.isDefaultAppSecret" (dict "ctx" $ "variableName" "APP_NEXT_GEN_MANAGER_JWT_SECRET")) "true" }}
    {{- $hasAtleastOneSecret = true }}
APP_NEXT_GEN_MANAGER_JWT_SECRET: '{{ .ctx.Values.secrets.default.APP_NEXT_GEN_MANAGER_JWT_SECRET | b64enc }}'
    {{- end }}
    {{- if not $hasAtleastOneSecret }}
{}
    {{- end }}
{{- end }}

