{{/*
Expand the name of the chart.
*/}}
{{- define "gitops.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "gitops.fullname" -}}
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
{{- define "gitops.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "gitops.labels" -}}
helm.sh/chart: {{ include "gitops.chart" . }}
{{ include "gitops.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "gitops.selectorLabels" -}}
app.kubernetes.io/name: {{ include "gitops.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "gitops.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "gitops.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{- define "gitops.pullSecrets" -}}
{{- if .Values.waitForInitContainer }}
    {{ include "common.images.pullSecrets" (dict "images" (list .Values.image .Values.waitForInitContainer.image .Values.upgraderImage.image .Values.agentDockerImage.image .Values.argoCDImage.image .Values.agentHAProxyImage .Values.agentRedisImage.image ) "global" .Values.global ) }}
{{- else }}
    {{ include "common.images.pullSecrets" (dict "images" (list .Values.image .Values.global.waitForInitContainer.image .Values.upgraderImage.image .Values.agentDockerImage.image .Values.argoCDImage.image .Values.agentHAProxyImage .Values.agentRedisImage.image ) "global" .Values.global ) }}
{{- end }}
{{- end -}}


{{/*
Manage gitops Secrets
USAGE:
{{- "gitops.generateSecrets" (dict "ctx" $)}}
*/}}
{{- define "gitops.generateSecrets" }}
    {{- $ := .ctx }}
    {{- $hasAtleastOneSecret := false }}
    {{- $localESOSecretCtxIdentifier := (include "harnesscommon.secrets.localESOSecretCtxIdentifier" (dict "ctx" $ )) }}
    {{- if eq (include "harnesscommon.secrets.isDefaultAppSecret" (dict "ctx" $ "variableName" "ACL_SECRET")) "true" }}
    {{- $hasAtleastOneSecret = true }}
ACL_SECRET: '{{ $.Values.accessControlService.secret | b64enc }}'
    {{- end }}
    {{- if eq (include "harnesscommon.secrets.isDefaultAppSecret" (dict "ctx" $ "variableName" "IDENTITY_SERVICE_SECRET")) "true" }}
    {{- $hasAtleastOneSecret = true }}
IDENTITY_SERVICE_SECRET: '{{ $.Values.identitySecret | b64enc }}'
    {{- end }}
    {{- if eq (include "harnesscommon.secrets.isDefaultAppSecret" (dict "ctx" $ "variableName" "JWT_SECRET")) "true" }}
    {{- $hasAtleastOneSecret = true }}
JWT_SECRET: '{{ $.Values.jwtSecret | b64enc }}'
    {{- end }}
    {{- if eq (include "harnesscommon.secrets.isDefaultAppSecret" (dict "ctx" $ "variableName" "PLATFORM_AUTH_SECRET")) "true" }}
    {{- $hasAtleastOneSecret = true }}
MANAGER_JWT_AUTH_SECRET: '{{ $.Values.managerService.secret | b64enc }}'
    {{- end }}
    {{- if eq (include "harnesscommon.secrets.isDefaultAppSecret" (dict "ctx" $ "variableName" "MANAGER_JWT_AUTH_SECRET")) "true" }}
    {{- $hasAtleastOneSecret = true }}
PLATFORM_AUTH_SECRET: '{{ $.Values.platformService.secret | b64enc }}'
    {{- end }}
    {{- if eq (include "harnesscommon.secrets.isDefaultAppSecret" (dict "ctx" $ "variableName" "PLATFORMSERVICE_AUTH_SECRET")) "true" }}
    {{- $hasAtleastOneSecret = true }}
PLATFORMSERVICE_AUTH_SECRET: '{{ $.Values.platformSvc.secret | b64enc }}'
    {{- end }}
    {{- if not $hasAtleastOneSecret }}
{}
    {{- end }}
{{- end }}

{{ include "common.images.image" ( dict "imageRoot" .Values.path.to.the.image "global" $) }}
*/}}
{{- define "gitops.images.image" -}}
{{- $registryName := .imageRoot.registry -}}
{{- $repositoryName := .imageRoot.repository -}}
{{- $separator := ":" -}}
{{- $termination := .imageRoot.tag | toString -}}
{{- $ignoreGlobalImageRegistry := default false .imageRoot.ignoreGlobalImageRegistry }}
{{- if .global }}
    {{- if and .global.imageRegistry (not $ignoreGlobalImageRegistry) }}
     {{- $registryName = .global.imageRegistry -}}
    {{- end -}}
{{- end -}}
{{- if .imageRoot.digest }}
    {{- $separator = "@" -}}
    {{- $termination = .imageRoot.digest | toString -}}
{{- end -}}
{{- if not $registryName }}
{{- printf "%s%s%s" $repositoryName $separator $termination -}}
{{- else }}
{{- printf "%s/%s%s%s" $registryName $repositoryName $separator $termination -}}
{{- end }}
{{- end -}}

