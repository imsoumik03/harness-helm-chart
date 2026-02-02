{{/* Helper functions to support using ESO for database host values*/}}

{{/*
Generates env object with POSTGRES_HOST for ESO Secrets
*/}}
{{- define "idp.postgres.hostEnv" -}}
{{- $ := . }}
{{- $variableName := "POSTGRES_HOST" }}
{{- $envVariableName := $variableName }}
{{- $secretName := "" }}
{{- $secretKey := "" }}
{{- if $.Values.postgres.secrets.secretManagement.externalSecretsOperator }}
  {{- range $esoSecretIdx, $esoSecret := $.Values.postgres.secrets.secretManagement.externalSecretsOperator }}
    {{- if and $esoSecret $esoSecret.secretStore $esoSecret.secretStore.name $esoSecret.secretStore.kind }}
      {{- $remoteKeyName := (dig "remoteKeys" $variableName "name" "" $esoSecret) }}
      {{- if $remoteKeyName }}
        {{- $secretContextIdentifier := printf "%s-postgres-ext-secret" $.Chart.Name }}
        {{- $secretName = printf "%s-%s" $secretContextIdentifier ($esoSecretIdx | toString) }}
        {{- $secretKey = $variableName }}
      {{- end }}
    {{- end }}
  {{- end }}
{{- end }}
{{- if and $secretName $secretKey }}
- name: {{ print $envVariableName }}
  valueFrom:
    secretKeyRef:
      name: {{ printf "%s" $secretName }}
      key: {{ printf "%s" $secretKey }}
{{- end }}
{{- end }}

{{/*
Generates env object with POSTGRES_PORT for ESO Secrets
*/}}
{{- define "idp.postgres.portEnv" -}}
{{- $ := . }}
{{- $variableName := "POSTGRES_PORT" }}
{{- $envVariableName := $variableName }}
{{- $secretName := "" }}
{{- $secretKey := "" }}
{{- if $.Values.postgres.secrets.secretManagement.externalSecretsOperator }}
  {{- range $esoSecretIdx, $esoSecret := $.Values.postgres.secrets.secretManagement.externalSecretsOperator }}
    {{- if and $esoSecret $esoSecret.secretStore $esoSecret.secretStore.name $esoSecret.secretStore.kind }}
      {{- $remoteKeyName := (dig "remoteKeys" $variableName "name" "" $esoSecret) }}
      {{- if $remoteKeyName }}
        {{- $secretContextIdentifier := printf "%s-postgres-ext-secret" $.Chart.Name }}
        {{- $secretName = printf "%s-%s" $secretContextIdentifier ($esoSecretIdx | toString) }}
        {{- $secretKey = $variableName }}
      {{- end }}
    {{- end }}
  {{- end }}
{{- end }}
{{- if and $secretName $secretKey }}
- name: {{ print $envVariableName }}
  valueFrom:
    secretKeyRef:
      name: {{ printf "%s" $secretName }}
      key: {{ printf "%s" $secretKey }}
{{- end }}
{{- end }}

{{- define "idp.postgres.host" -}}
{{- $ := . }}
{{- if $.Values.postgres.secrets.secretManagement.externalSecretsOperator }}
  {{- range $.Values.postgres.secrets.secretManagement.externalSecretsOperator }}
    {{- if .remoteKeys.POSTGRES_HOST }}
      {{- print "${POSTGRES_HOST}" }}
      {{- break }}
    {{- end }}
  {{- end }}
{{- else }}
  {{- if gt (len $.Values.postgres.hosts) 0 }}
    {{- printf "%s" (split ":" (index $.Values.postgres.hosts 0))._0 }}
  {{- else if $.Values.global.database.postgres.hosts }}
    {{- printf "%s" (split ":" (index $.Values.global.database.postgres.hosts 0))._0 }}
  {{- else }}
    {{- print "postgres" }}
  {{- end }}
{{- end }}
{{- end }}

{{- define "idp.postgres.port" -}}
{{- $ := . }}
{{- if $.Values.postgres.secrets.secretManagement.externalSecretsOperator }}
  {{- range $.Values.postgres.secrets.secretManagement.externalSecretsOperator }}
    {{- if .remoteKeys.POSTGRES_PORT }}
      {{- print "${POSTGRES_PORT}" }}
      {{- break }}
    {{- end }}
  {{- end }}
{{- else }}
  {{- if gt (len $.Values.postgres.hosts) 0 }}
    {{- printf "%s" (split ":" (index $.Values.postgres.hosts 0))._1 }}
  {{- else if $.Values.global.database.postgres.hosts }}
    {{- printf "%s" (split ":" (index $.Values.global.database.postgres.hosts 0))._1 }}
  {{- else }}
    {{- print "5432" }}
  {{- end }}
{{- end }}
{{- end }}

{{- define "idp.postgres.connection" -}}
{{- $ := . }}
{{- $host := include "idp.postgres.host" $ }}
{{- $port := include "idp.postgres.port" $ }}
{{- $user := "" }}
{{- $password := "" }}
{{- if $.Values.postgres.secrets.secretManagement.externalSecretsOperator }}
  {{- $user = "${POSTGRES_USER}" }}
  {{- $password = "${POSTGRES_PASSWORD}" }}
{{- else }}
  {{- /* Fall back to the default implementation */ -}}
{{- end }}
{{- $database := default "postgres" $.Values.postgres.database }}
{{- $sslMode := default "disable" $.Values.postgres.sslMode }}
{{- $protocol := default "postgres" $.Values.postgres.protocol }}

{{- $connectionString := printf "%s://%s:%s@%s:%s/%s?sslmode=%s" $protocol $user $password $host $port $database $sslMode }}
{{- printf "%s" $connectionString }}
{{- end }}
