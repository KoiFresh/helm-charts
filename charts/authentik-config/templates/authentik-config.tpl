{{ define "authentik-config" }}

version: 1
metadata:
  name: authentik-config

{{- with .Values.authentik }}
{{- $authentik := . }}

entries: {{ if not (or .providers .applications .groups .patches) -}} [] 
{{- end }}
{{- range $key, $provider := .providers }}
  
  - model: authentik_providers_{{ $provider.type }}.{{ $provider.type }}provider
    identifiers:
      name: {{ $key }}
    state: {{ default "present" $provider.state }}
    attrs:
      name: {{ $key }}
      {{- include "resolve-attribute" (dict "authentik" $authentik "value" $provider.attrs) | indent 4 }}
{{- end }} {{/* end range $key, $provider := .providers */}}

{{- range $key, $group := .groups }}
  
  - model: authentik_core.group
    id: {{ $key }}
    state: present
    identifiers:
      name: {{ $key }}
    attrs:     
    {{- include "resolve-attribute" (dict "authentik" $authentik "value" $group.attrs) | indent 4 }}
{{- end }}

{{- range $key, $application := .applications }}
  
  - model: authentik_core.application
    identifiers:
      name: {{ $application.name }}
    state: {{ default "present" $application.state }}
    attrs:
      name: {{ $key }}
      {{- include "resolve-attribute" (dict "authentik" $authentik "value" $application.attrs) | indent 4 }}
    {{- if $application.conditions }}
    conditions: {{ include "resolve-attribute" (dict "authentik" $authentik "value" $application.conditions) | indent 4 }} 
    {{- end }}
    {{- if $application.permissions }}
    permissions: {{ include "resolve-attribute" (dict "authentik" $authentik "value" $application.permissions ) | indent 4 }}
    {{- end }}
    {{- range $index, $group := $application.groups }}

  - model: authentik_policies.policybinding
    state: present
    identifiers:
      enabled: true
      order: {{ $index }}
      timeout: 30
      failure_result: false
      target: !Find [ authentik_core.application, [ slug, {{ $application.attrs.slug }} ]]
      group: !Find [ authentik_core.group, [ name, {{ $group }} ]]
    {{- end }}
{{- end }} {{/* end range $key, $application := .applications */}}

{{- if not (eq (len .patches) 0) }}
{{- include "resolve-attribute" (dict "authentik" $authentik "value" .patches) }}
{{- end }}

{{ end }} {{/* with .Values.authentik */}}
{{ end }} {{/* define "authentik-config" */}}
