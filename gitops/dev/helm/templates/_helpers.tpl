{{- define "frontend.image" -}}
{{ .Values.frontend.image.uri }}/{{ .Values.frontend.image.name }}:{{ .Values.frontend.image.version }}
{{- end }}

{{- define "backend.image" -}}
{{ .Values.backend.image.uri }}/{{ .Values.backend.image.name }}:{{ .Values.backend.image.version }}
{{- end }}
