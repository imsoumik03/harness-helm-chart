{{/*
Expand the name of the chart.
*/}}
{{- define "looker.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "looker.fullname" -}}
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
{{- define "looker.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "looker.labels" -}}
helm.sh/chart: {{ include "looker.chart" . }}
{{ include "looker.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "looker.selectorLabels" -}}
app.kubernetes.io/name: {{ include "looker.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "looker.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "looker.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
Return true if a PVC object should be created
*/}}
{{- define "looker.createPVC" -}}
{{- if not .persistence.existingClaim }}
    {{- true -}}
{{- end -}}
{{- end -}}

{{/*
Return the PVC name
*/}}
{{- define "looker.claimName" -}}
{{- if .persistence.existingClaim }}
    {{- .persistence.existingClaim -}}
{{- else -}}
    {{- .persistence.claimName -}}
{{- end -}}
{{- end -}}

{{- define "looker.pullSecrets" -}}
{{ include "common.images.pullSecrets" (dict "images" (list .Values.image .Values.waitForInitContainer.image) "global" .Values.global ) }}
{{- end -}}

{{- define "looker-mysql.pullSecrets" -}}
{{ include "common.images.pullSecrets" (dict "images" (list .Values.image.mysql ) "global" .Values.global ) }}
{{- end -}}

{{- define "looker.generateLookerInternalSecrets" }}
    {{- $ := .ctx }}
    {{- $hasAtleastOneSecret := false }}
    {{- $localESOSecretCtxIdentifier := (include "harnesscommon.secrets.localESOSecretCtxIdentifier" (dict "ctx" $ )) }}
    {{- if eq (include "harnesscommon.secrets.isDefaultAppSecret" (dict "ctx" $ "variableName" "LICENSE_KEY" "extKubernetesSecretCtxs" (list $.Values.secrets.kubernetesSecrets) "esoSecretCtxs" (list (dict $localESOSecretCtxIdentifier $.Values.secrets.secretManagement.externalSecretsOperator)))) "true" }}
    {{- $hasAtleastOneSecret = true }}
    lookerLicenseKey: {{ include "looker.secrets.passwords.manage" (dict "secret" "looker-secrets" "key" "lookerLicenseKey" "providedValues" (list "secrets.lookerLicenseKey" "secrets.default.LICENSE_KEY") "length" 10 "context" .) }}
    {{- end }}
    {{- if .Values.global.airgap }}
    {{- if eq (include "harnesscommon.secrets.isDefaultAppSecret" (dict "ctx" $ "variableName" "LICENSE_FILE" "extKubernetesSecretCtxs" (list $.Values.secrets.kubernetesSecrets) "esoSecretCtxs" (list (dict $localESOSecretCtxIdentifier $.Values.secrets.secretManagement.externalSecretsOperator)))) "true" }}
    {{- $hasAtleastOneSecret = true }}
    lookerLicenseFile: {{ include "looker.secrets.passwords.manage" (dict "secret" "looker-secrets" "key" "lookerLicenseFile" "providedValues" (list "secrets.lookerLicenseFile" "secrets.default.LICENSE_FILE") "length" 10 "context" .) }}
    {{- end }}
    {{- end }}
    {{- $secretData := (lookup "v1" "Secret" (include "harnesscommon.names.namespace" .) "looker-secrets").data }}
    {{- $lookerMasterKey := include "harnesscommon.secrets.passwords.manage" (dict "secret" "looker-secrets" "key" "lookerMasterKey" "providedValues" (list "secrets.lookerMasterKey") "length" 32 "context" .) }}
    {{- if hasKey $secretData "lookerMasterKey" }}
    lookerMasterKey: {{ $lookerMasterKey }}
    {{- else }}
    lookerMasterKey: {{ $lookerMasterKey | trimAll "\"" | b64enc }}
    {{- end }}
{{- end }}

{{- define "looker.generateLookerSecrets" }}
    lookerClientId: {{ include "harnesscommon.secrets.passwords.manage" (dict "secret" "harness-looker-secrets" "key" "lookerClientId" "providedValues" (list "secrets.lookerClientId") "length" 20 "context" $) }}
    lookerClientSecret: {{ include "harnesscommon.secrets.passwords.manage" (dict "secret" "harness-looker-secrets" "key" "lookerClientSecret" "providedValues" (list "secrets.lookerClientSecret") "length" 24 "context" $) }}
    lookerEmbedSecret: {{ include "harnesscommon.secrets.passwords.manage" (dict "secret" "harness-looker-secrets" "key" "lookerEmbedSecret" "providedValues" (list "secrets.lookerEmbedSecret") "length" 16 "context" $) }}
    lookerSignupUrl: {{ include "harnesscommon.secrets.passwords.manage" (dict "secret" "harness-looker-secrets" "key" "lookerSignupUrl" "providedValues" (list "secrets.lookerSignupUrl") "length" 16 "context" $) }}
{{- end }}

{{- define "looker.generateMysqlSecrets" }}
    lookerMySqlRootPassword: {{ include "harnesscommon.secrets.passwords.manage" (dict "secret" "looker-mysql-secrets" "key" "lookerMySqlRootPassword" "providedValues" (list "secrets.lookerMySqlRootPassword") "length" 24 "context" $) }}
    lookerMySqlUserPassword: {{ include "harnesscommon.secrets.passwords.manage" (dict "secret" "looker-mysql-secrets" "key" "lookerMySqlUserPassword" "providedValues" (list "secrets.lookerMySqlUserPassword") "length" 24 "context" $) }}
{{- end }}

{{- define "looker.secrets.passwords.manage" -}}

{{- $password := "" }}
{{- $subchart := "" }}
{{- $chartName := default "" .chartName }}
{{- $passwordLength := default 10 .length }}
{{- $providedPasswordKey := include "harnesscommon.utils.getKeyFromList" (dict "keys" .providedValues "context" $.context) }}
{{- $providedPasswordValue := include "harnesscommon.utils.getValueFromKey" (dict "key" $providedPasswordKey "context" $.context) }}
{{- $secretData := (lookup "v1" "Secret" (include "harnesscommon.names.namespace" .context) .secret).data }}
{{- if $providedPasswordValue }}
  {{- $password = $providedPasswordValue | toString | b64enc | quote }}
{{- else if $secretData }}
  {{- if hasKey $secretData .key }}
    {{- $password = index $secretData .key | quote }}
  {{- end -}}
{{- end -}}
{{- printf "%s" $password -}}
{{- end -}}
