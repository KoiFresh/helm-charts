{{ define "resolve-attribute" -}}
	{{- $authentik := .authentik }}
    {{- $result := dict "value" .value }}
	{{- if typeIsLike "[]interface {}" .value }}
		{{- range $index, $item := .value }}
			{{- $res := include "resolve-attribute" (dict "authentik" $authentik "value" $item) }}
			{{- "" | nindent 1 }} - {{ $res | indent 2 }}
		{{- end }}
		{{- if eq (len .value) 0 -}}
			[]
		{{- end }}
	{{- else if typeIsLike "map[string]interface {}" .value }}
		{{- if hasKey .value "$ref" }}
			{{- "" | nindent 2 }}!Find [
				{{- $ref := index .value "$ref" }}
				{{- quote $ref.type -}}
				{{- range $key, $value := $ref.with -}}
					,[{{ quote $key }}, {{ quote $value }}]
				{{- end -}}
			]
		{{- else }} 
			{{- range $index, $item := .value }}
			{{- $res := include "resolve-attribute" (dict "authentik" $authentik "value" $item) | indent 2 }}
			{{- "" | nindent 2 }}{{ $index }}:{{ $res }}
			{{- end }}
			{{- if eq (len .value) 0 -}}
				{}
			{{- end }}
		{{- end }}
	{{- else -}}
		{{- $res := include "resolve-shortcut" (dict "authentik" $authentik "value" $result.value ) }}
		{{- $res | nindent 2 }}
	{{- end }}
{{- end }}



{{ define "resolve-shortcut" }}
	{{- if typeIsLike "bool" .value }}
		{{- toString .value }}
	{{- else if hasPrefix "\\" .value -}}
		{{- trimPrefix "\\" .value }}
	{{- else if hasPrefix "$flows." .value -}}
		!Find [ authentik_flows.flow, [ slug, {{ trimPrefix "$flows." .value }} ]]
    {{- else if hasPrefix "$providers." .value -}}
        {{- $provider := index .authentik.providers (trimPrefix "$providers." .value) -}}
        !Find [ authentik_providers_{{ $provider.type }}.{{ $provider.type }}provider, [ name, {{ trimPrefix "$providers." .value }} ]]
    {{- else if hasPrefix "$" .value -}}
		!Env {{ trimPrefix "$" .value }}
    {{- else }}
		{{- toYaml .value }}
    {{- end }}
{{- end }}
