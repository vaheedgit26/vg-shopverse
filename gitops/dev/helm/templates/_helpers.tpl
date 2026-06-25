{{- define "shopverse.backend.image" -}}
{{ printf "%s/%s:%s" .Values.backend.image.uri .Values.backend.image.name .Values.backend.image.version }}
{{- end }}

{{- define "shopverse.frontend.image" -}}
{{ printf "%s/%s:%s" .Values.frontend.image.uri .Values.frontend.image.name .Values.frontend.image.version }}
{{- end }}

{{/*
=========================================================
OLD IMPLEMENTATION (without printf) — kept for reference
=========================================================
{{- define "shopverse.frontend.image" -}}
{{ .Values.frontend.image.uri }}/{{ .Values.frontend.image.name }}:{{ .Values.frontend.image.version }}
{{- end }}

{{- define "shopverse.backend.image" -}}
{{ .Values.backend.image.uri }}/{{ .Values.backend.image.name }}:{{ .Values.backend.image.version }}
{{- end }}

*/}}
