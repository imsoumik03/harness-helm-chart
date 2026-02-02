{{/*
Expand the name of the chart.
*/}}
{{- define "tsdb-to-psql-migrator.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "tsdb-to-psql-migrator.fullname" -}}
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
{{- define "tsdb-to-psql-migrator.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "tsdb-to-psql-migrator.labels" -}}
helm.sh/chart: {{ include "tsdb-to-psql-migrator.chart" . }}
{{ include "tsdb-to-psql-migrator.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "tsdb-to-psql-migrator.selectorLabels" -}}
app.kubernetes.io/name: {{ include "tsdb-to-psql-migrator.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Common labels for CCM Azure SMP K8s Cron Job
*/}}
{{- define "ccm-azure-smp.labels" -}}
helm.sh/chart: {{ include "tsdb-to-psql-migrator.chart" . }}
{{ include "ccm-azure-smp.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels for CCM Azure SMP K8s Cron Job
*/}}
{{- define "ccm-azure-smp.selectorLabels" -}}
app.kubernetes.io/name: ccm-smp-azure
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Prometheus Annotations
*/}}
{{- define "tsdb-to-psql-migrator.prometheusAnnotations" -}}
prometheus.io/scrape: 'true'
prometheus.io/port: '2112'
prometheus.io/path: '/metrics'
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "tsdb-to-psql-migrator.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "tsdb-to-psql-migrator.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{- define "tsdb-to-psql-migrator.deploymentEnv" -}}
- name: DB_PASSWORD
  valueFrom:
    secretKeyRef:
        name: postgres
        key: postgres-password
- { name: APP_DATABASE_DATASOURCE, value: "{{ printf "postgres://postgres:$(DB_PASSWORD)@postgres:5432" }}" }
- { name: APP_DB_MIGRATION_DATASOURCE, value: "{{ printf "postgres://postgres:$(DB_PASSWORD)@postgres:5432" }}" }
{{- end }}

{{- define "tsdb-to-psql-migrator.pullSecrets" -}}
    {{ include "common.images.pullSecrets" (dict "images" (list .Values.image ) "global" .Values.global ) }}
{{- end -}}

{{- define "tsdb-to-psql-migrator.renderScriptsInCM" -}}
{{- range $path, $_ := $.Files.Glob "scripts/**" }}
  {{- $filename := base $path }}
  {{ $filename }}: |-
{{- $.Files.Get $path | nindent 4 }}
{{- end }}
{{- end -}}

{{- define "tsdb-to-psql-migrator.storage.class" -}}
{{- $storageClass := "" -}}
{{- if .global -}}
    {{- if .global.storageClass -}}
        {{- $storageClass = .global.storageClass -}}
    {{- else }} 
      {{- if .global.storageClassName -}}
          {{- $storageClass = .global.storageClassName -}}
      {{- end -}}
    {{- end -}}
{{- end -}}
{{- end -}}