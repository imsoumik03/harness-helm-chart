{{/*
Expand the name of the chart.
*/}}
{{- define "ff-pushpin-service.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "ff-pushpin-service.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "ff-pushpin-service.labels" -}}
helm.sh/chart: {{ include "ff-pushpin-service.chart" . }}
{{ include "ff-pushpin-service.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "ff-pushpin-service.selectorLabels" -}}
app.kubernetes.io/name: {{ include "ff-pushpin-service.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "ff-pushpin-service.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "ff-pushpin-service.name" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
Create the name of the pushpin image to use
*/}}
{{- define "ff-pushpin-service.pushpinImage" -}}
{{ include "common.images.image" (dict "imageRoot" .Values.image "global" .Values.global) }}
{{- end }}

{{/*
Create the name of the worker image to use
*/}}
{{- define "ff-pushpin-service.pushpinworkerImage" -}}
{{ include "common.images.image" (dict "imageRoot" .Values.pushpinworker.image "global" .Values.global) }}
{{- end }}

{{- define "ff-pushpin-service.pullSecrets" -}}
{{- if .Values.waitForInitContainer }}
    {{ include "common.images.pullSecrets" (dict "images" (list .Values.waitForInitContainer.image .Values.pushpinworker.image .Values.image ) "global" .Values.global ) }}
{{- else }}
    {{ include "common.images.pullSecrets" (dict "images" (list .Values.global.waitForInitContainer.image .Values.pushpinworker.image .Values.image ) "global" .Values.global ) }}
{{- end }}
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
