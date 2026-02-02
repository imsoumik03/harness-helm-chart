{{/*
Build the args for the service binary.
Usage {{ include "nginx.args" . }}
*/}}
{{- define "nginx.args" -}}
{{- include "harnesscommon.tplvalues.render" ( dict "value" .Values.nginx.controller.args "context" $) | nindent 0 }}
{{- if .Values.nginx.clusterRole.create }}
- --watch-ingress-without-class=false
- --controller-class={{ default "k8s.io/harness-ingress-controller" .Values.nginx.controller.controllerClass }}
{{ else }}
- --watch-ingress-without-class={{ .Values.nginx.controller.watchIngressWithoutClass }}
{{ end }}
{{- if .Values.nginx.controller.extraArgs}}
    {{- toYaml .Values.nginx.controller.extraArgs }}
{{- end }}
{{- end -}}
