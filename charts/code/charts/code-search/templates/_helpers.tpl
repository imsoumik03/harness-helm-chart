{{/*
Expand the name of the chart.
*/}}
{{- define "codesearch.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "codesearch.fullname" -}}
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
{{- define "codesearch.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "codesearch.labels" -}}
helm.sh/chart: {{ include "codesearch.chart" . }}
{{ include "codesearch.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "codesearch.selectorLabels" -}}
app.kubernetes.io/name: {{ include "codesearch.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "codesearch.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "codesearch.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{- define "codesearch.pullSecrets" -}}
{{ include "common.images.pullSecrets" (dict "images" (list .Values.image) "global" .Values.global ) }}
{{- end -}}

{{- define "codesearch.storage.class" -}}
{{- $storageClass := "" -}}

{{- $serviceName := "search" }}
{{- range .Values.harnessDisks.disks }}
  {{- if eq .servicename $serviceName }}
    {{- $storageClass = (include "codesearch.name" $) }}
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