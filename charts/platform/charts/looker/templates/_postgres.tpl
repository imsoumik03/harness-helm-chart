
{{/*
Return the Postgres host.
In the case of a replicated postgres with multiple hosts, we return just the first hostname
*/}}
{{- define "looker.postgres.host" -}}
    {{- if .Values.database.postgres.host -}}
        {{- .Values.database.postgres.host -}}
    {{- else -}}
        {{- $postgresUrlParts := urlParse (include "harnesscommon.dbconnection.postgresConnection" (dict "database" "" "args" "" "context" $)) -}}
        {{- $hostsPortsList := regexSplit "[,:]" $postgresUrlParts.host -1 -}}
        {{- $firstHost := first $hostsPortsList -}}
        {{- if $firstHost -}}
            {{- $firstHost -}}
        {{- else -}}
            {{- "postgres" -}}
        {{- end -}}
    {{- end -}}
{{- end -}}

{{/*
Return the Postgres port
In the case of a replicated postgres with multiple hosts, we return the port of the first host
*/}}
{{- define "looker.postgres.port" -}}
    {{- if .Values.database.postgres.port -}}
        {{- .Values.database.postgres.port -}}
    {{- else -}}
        {{- $postgresUrlParts := urlParse (include "harnesscommon.dbconnection.postgresConnection" (dict "database" "" "args" "" "context" $)) -}}
        {{- $hostsList := splitList "," $postgresUrlParts.host -}}
        {{- $firstHost := first $hostsList -}}
        {{- if contains ":" $firstHost -}}
            {{- $hostPortList := splitList ":" $firstHost -}}
            {{- last $hostPortList -}}
        {{- else -}}
            {{- "5432" -}}
        {{- end -}}
    {{- end -}}
{{- end -}}

{{/*
Return the Postgres database name
*/}}
{{- define "looker.postgres.database" -}}
    {{- if .Values.database.postgres.database -}}
        {{- .Values.database.postgres.database -}}
    {{- else -}}
        {{- $postgresUrlParts := urlParse (include "harnesscommon.dbconnection.postgresConnection" (dict "database" "" "args" "" "context" $)) -}}
        {{- $database := trimPrefix "/" $postgresUrlParts.path -}}
        {{- if $database -}}
            {{- $database -}}
        {{- else -}}
            {{- "postgres" -}}
        {{- end -}}
    {{- end -}}
{{- end -}}

{{/*
Return whether SSL is enabled for Postgres
*/}}
{{- define "looker.postgres.ssl" -}}
    {{- if .Values.database.postgres.ssl -}}
        {{- .Values.database.postgres.ssl -}}
    {{- else -}}
        {{- $postgresUrlParts := urlParse (include "harnesscommon.dbconnection.postgresConnection" (dict "database" "" "args" "" "context" $)) -}}
        {{- if contains "ssl=true" $postgresUrlParts.query -}}
            {{- "true" -}}
        {{- end -}}
    {{- end -}}
{{- end -}}

{{/*
Return whether SSL is enabled for Postgres
*/}}
{{- define "looker.postgres.ssl.verify" -}}
    {{- if .Values.database.postgres.verifySsl -}}
        {{- .Values.database.postgres.verifySsl -}}
    {{- else -}}
        {{- $postgresUrlParts := urlParse (include "harnesscommon.dbconnection.postgresConnection" (dict "database" "" "args" "" "context" $)) -}}
        {{- if contains "sslfactory=org.postgresql.ssl.DefaultJavaSSLFactory" $postgresUrlParts.query -}}
            {{- "true" -}}
        {{- end -}}
    {{- end -}}
{{- end -}}
