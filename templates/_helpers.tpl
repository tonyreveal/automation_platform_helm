{{- define "automation-platform.namespace" -}}
{{- default .Values.global.namespace .Values.namespace.name -}}
{{- end -}}

{{- define "automation-platform.labels" -}}
app.kubernetes.io/managed-by: {{ .Release.Service | quote }}
app.kubernetes.io/instance: {{ .Release.Name | quote }}
app.kubernetes.io/part-of: "automation-platform"
helm.sh/chart: {{ printf "%s-%s" .Chart.Name .Chart.Version | quote }}
{{- end -}}

{{- define "automation-platform.annotations" -}}
{{- with .Values.global.commonAnnotations }}
{{- toYaml . }}
{{- end }}
{{- end -}}
