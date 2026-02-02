{{/*
Expand the name of the chart.
*/}}
{{- define "code-gitrpc.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "code-gitrpc.fullname" -}}
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
{{- define "code-gitrpc.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "code-gitrpc.labels" -}}
helm.sh/chart: {{ include "code-gitrpc.chart" . }}
{{ include "code-gitrpc.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "code-gitrpc.selectorLabels" -}}
app.kubernetes.io/name: {{ include "code-gitrpc.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "code-gitrpc.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "code-gitrpc.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{- define "code-gitrpc.deploymentEnv" -}}
- name: DB_PASSWORD
  valueFrom:
    secretKeyRef:
        name: postgres
        key: postgres-password
- { name: APP_DATABASE_DATASOURCE, value: "{{ printf "postgres://postgres:$(DB_PASSWORD)@postgres:5432" }}" }
{{- end }}

{{- define "code-gitrpc.pullSecrets" -}}
{{ include "common.images.pullSecrets" (dict "images" (list .Values.image) "global" .Values.global ) }}
{{- end -}}

{{- define "code-gitrpc.storage.class" -}}
{{- $storageClass := "" -}}

{{- $serviceName := "gitrpc" }}
{{- range .Values.harnessDisks.disks }}
  {{- if eq .servicename $serviceName }}
    {{- $storageClass = (include "code-gitrpc.name" $) }}
    {{- break -}}
  {{- end }} 
{{- end }}

{{- if not $storageClass }}
  {{- if .Values.global -}}
      {{- if .Values.global.storageClass -}}
          {{- $storageClass = .Values.global.storageClass -}}
      {{- else }} 
          {{- if .Values.global.storageClassName -}}
              {{- $storageClass = .Values.global.storageClassName -}}
          {{- end -}}
      {{- end -}}
  {{- end -}}
{{- end -}}

{{- $storageClass -}}

{{- end -}}