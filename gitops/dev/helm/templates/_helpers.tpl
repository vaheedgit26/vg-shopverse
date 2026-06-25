{{- define "backend.image" -}}
{{ .Values.backend.image.uri }}/{{ .Values.backend.image.name }}:{{ .Values.backend.image.version }}
{{- end }}
