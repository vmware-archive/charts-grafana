{{- define "pks-observability.dashboard.fullname" -}}
{{- printf "%s-%s" .Release.Name .Values.dashboard.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "pks-observability.prometheus-datasource.fullname" -}}
{{- printf "%s-%s" .Release.Name .Values.datasource.prometheus.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "pks-observability.prometheus-datasource.server-name" -}}
{{- printf "%s-%s" .Release.Name .Values.datasource.prometheus.serverName | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "pks-observability.prometheus-datasource.config-name" -}}
{{- printf "%s-%s-datasource" .Release.Name .Values.datasource.prometheus.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}