{{/*
Copyright Krack8
*/}}
{{- define "lighthouse-agent.name" -}}
{{- default "lighthouse-agent" .Chart.Name | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "lighthouse-agent.namespace" -}}
{{- default "klovercloud" .Values.global.namespace | trunc 63 | trimSuffix "-"  }}
{{- end }}