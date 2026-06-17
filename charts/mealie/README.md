<p align="center">
    <img src="https://raw.githubusercontent.com/mealie-recipes/mealie/refs/heads/mealie-next/docs/docs/assets/img/favicon.png" height="150" alt="Mealie Logo"/>
</p>

---

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square)
![AppVersion: 3.19.2](https://img.shields.io/badge/AppVersion-3.19.2-informational?style=flat-square)

Mealie is a self hosted recipe manager and meal planner with a RestAPI backend and a reactive frontend application built in Vue for a pleasant user experience for the whole family. Easily add recipes into your database by providing the url and mealie will automatically import the relevant data or add a family recipe with the UI editor

**Homepage:** <https://github.com/mealie-recipes/mealie>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| koifresh | <kai@mayer.sh> | <https://mayer.sh/> |

## Source Code

* <https://github.com/koifresh/helm-charts>

## Requirements

Kubernetes: `>=1.26.0-0`

| Repository | Name | Version |
|------------|------|---------|
| oci://registry-1.docker.io/bitnamicharts | postgresql | ~15.1 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` | Affinity for pod assignment ref: https://kubernetes.io/docs/concepts/configuration/assign-pod-node/#affinity-and-anti-affinity |
| fullnameOverride | string | `""` | String to fully override mealie.fullname |
| image.digest | string | `""` | The image digest to pull |
| image.pullPolicy | string | `"IfNotPresent"` | The Kubernetes image pull policy |
| image.pullSecrets | list | `[]` | A list of secrets to use for pulling images from private registries |
| image.registry | string | `"ghcr.io"` | The Docker registry to pull the image from |
| image.repository | string | `"mealie-recipes/mealie"` | The registry repository to pull the image from |
| image.tag | string | `""` | The image tag to pull |
| ingress.annotations | object | `{}` | Annotations for the Ingress resource |
| ingress.className | string | `""` | The IngressClass to use for the pod's ingress |
| ingress.enabled | bool | `false` | Whether to enable Ingress |
| ingress.host | string | `"mealie.helm.private"` | The host mealie listens to  |
| ingress.tls | list | `[]` | A list of hostnames and secret names to use for TLS |
| initContainers | list | `[]` | Define initContainers for the main mealie pod |
| livenessProbe.enabled | bool | `false` | Enable or disable the use of liveness probes |
| livenessProbe.failureThreshold | int | `10` | Configure the failure threshold for the liveness probe |
| livenessProbe.initialDelaySeconds | int | `5` | Configure the initial delay seconds for the liveness probe |
| livenessProbe.periodSeconds | int | `10` | Configure the seconds for each period of the liveness probe |
| livenessProbe.successThreshold | int | `1` | Configure the success threshold for the liveness probe |
| livenessProbe.timeoutSeconds | int | `1` | Configure the initial delay seconds for the liveness probe |
| mealie.env | object | `{"DB_ENGINE":"posgres","POSTGRES_DB":"mealie","POSTGRES_PASSWORD":"postgres","POSTGRES_PORT":"5432","POSTGRES_SERVER":"mealie-postgresql","POSTGRES_USER":"postgres"}` | Additional env variables to configure, see: https://docs.mealie.io/documentation/getting-started/installation/backend-config/ |
| mealie.envFrom | string | `nil` | Additional env variables from secrets or config maps |
| mealie.guid | int | `1000` | The guid to use insised the container |
| mealie.port | int | `9000` | The port mealie listens on |
| mealie.puid | int | `1000` | The puid to use insidde the container |
| mealie.timeZone | string | `"UTC"` | The timezone mealie should use e.g. UTC or Europe/Berlin |
| nameOverride | string | `""` | String to partially override mealie.fullname |
| nodeSelector | object | `{}` | Node labels for pod assignment ref: https://kubernetes.io/docs/user-guide/node-selection/ |
| podAnnotations | object | `{}` | Extra annotations for the Mealie pod |
| podLabels | object | `{}` | Extra labels for the Mealie pod |
| podSecurityContext | object | `{}` | Security context settings for the Paperless pod ref: https://kubernetes.io/docs/tasks/configure-pod-container/security-context/ |
| postgresql | object | `{"auth":{"database":"mealie","enablePostgresUser":true,"password":"postgres","postgresPassword":"postgres","usePasswordFiles":false,"username":"postgres"},"enabled":true,"image":{"registry":"docker.io","repository":"library/postgres","tag":"16.13-bookworm"},"primary":{"extraVolumeMounts":[{"mountPath":"/var/run/postgresql","name":"postgresql-socket"}],"extraVolumes":[{"emptyDir":{},"name":"postgresql-socket"}],"name":"primary","persistence":{"accessModes":["ReadWriteOnce"],"enabled":true,"existingClaim":"","size":"5Gi","storageClass":""}}}` | PostgreSQL configuration ref: https://github.com/bitnami/charts/blob/main/bitnami/postgresql/values.yaml |
| postgresql.auth.database | string | `"mealie"` | Name for a custom database to create |
| postgresql.auth.enablePostgresUser | bool | `true` | Assign a password to the "postgres" admin user. Otherwise, remote access will be blocked for this user |
| postgresql.auth.password | string | `"postgres"` | Password for the custom user to create. Ignored if `auth.existingSecret` is provided |
| postgresql.auth.postgresPassword | string | `"postgres"` | Password for the "postgres" admin user. Ignored if `auth.existingSecret` is provided |
| postgresql.auth.usePasswordFiles | bool | `false` | Mount credentials as a files instead of using an environment variable |
| postgresql.auth.username | string | `"postgres"` | Name for a custom user to create |
| postgresql.enabled | bool | `true` | Enable or disable the PostgreSQL subchart |
| postgresql.image | object | `{"registry":"docker.io","repository":"library/postgres","tag":"16.13-bookworm"}` | Image configuration for the postgres container. Use the official postgres image by default, instead of the bitnami image. |
| postgresql.image.registry | string | `"docker.io"` | Registry for the postgres container image |
| postgresql.image.repository | string | `"library/postgres"` | Repository for the postgres container image |
| postgresql.image.tag | string | `"16.13-bookworm"` | Tag for the postgres container image |
| postgresql.primary.name | string | `"primary"` | Name of the primary database (eg primary, master, leader, ...) |
| postgresql.primary.persistence.accessModes | list | `["ReadWriteOnce"]` | PVC Access Mode for PostgreSQL volume |
| postgresql.primary.persistence.enabled | bool | `true` | Enable PostgreSQL Primary data persistence using PVC |
| postgresql.primary.persistence.existingClaim | string | `""` | Name of an existing PVC to use |
| postgresql.primary.persistence.size | string | `"5Gi"` | PVC Storage Request for PostgreSQL volume |
| postgresql.primary.persistence.storageClass | string | `""` | PVC Storage Class for PostgreSQL Primary data volume If defined, storageClassName: <storageClass> If set to "-", storageClassName: "", which disables dynamic provisioning If undefined (the default) or set to null, no storageClassName spec is set, choosing the default provisioner.  (gp2 on AWS, standard on GKE, AWS & OpenStack) |
| priorityClassName | string | `""` | The name of an existing PriorityClass ref: https://kubernetes.io/docs/concepts/scheduling-eviction/pod-priority-preemption/ |
| readinessProbe.enabled | bool | `false` | Enable or disable the use of readiness probes |
| readinessProbe.failureThreshold | int | `3` | Configure the failure threshold for the readiness probe |
| readinessProbe.initialDelaySeconds | int | `5` | Configure the initial delay seconds for the readiness probe |
| readinessProbe.periodSeconds | int | `10` | Configure the seconds for each period of the readiness probe |
| readinessProbe.successThreshold | int | `1` | Configure the success threshold for the readiness probe |
| readinessProbe.timeoutSeconds | int | `1` | Configure the initial delay seconds for the readiness probe |
| replicas | int | `1` | Then number of replicas |
| resources | object | `{}` | The resource limits/requests for the Paperless pod |
| securityContext | object | `{}` | General security context settings for ref: https://kubernetes.io/docs/tasks/configure-pod-container/security-context/ |
| service.annotations | object | `{}` | Annotations for the service resource |
| service.clusterIP | string | `""` | Define a static cluster IP for the service |
| service.externalIPs | list | `[]` | Service External IPs |
| service.externalTrafficPolicy | string | `"Cluster"` | The external traffic policy for the service |
| service.extraPorts | list | `[]` | Extra ports to add to the service |
| service.internalTrafficPolicy | string | `"Cluster"` | The internal traffic policy for the service |
| service.ipFamilyPolicy | string | `""` | The ipFamilyPolicy |
| service.labels | object | `{}` | Labels for the service resource |
| service.loadBalancerClass | string | `""` | Define Load Balancer class if service type is `LoadBalancer` (optional, cloud specific) |
| service.loadBalancerIP | string | `""` | Set the Load Balancer IP |
| service.loadBalancerSourceRanges | list | `[]` | Service Load Balancer source ranges |
| service.nodePort | int | `30080` | The Node port to use on the service |
| service.port | int | `8000` | The port to use on the service |
| service.sessionAffinity | string | `"None"` | Session Affinity for Kubernetes service, can be "None" or "ClientIP". If "ClientIP", consecutive client requests will be directed to the same Pod |
| service.sessionAffinityConfig | object | `{}` | Additional settings for the sessionAffinity |
| service.type | string | `"ClusterIP"` | The type of service to create |
| startupProbe.enabled | bool | `false` | Enable or disable the use of readiness probes |
| startupProbe.failureThreshold | int | `10` | Configure the failure threshold for the startup probe |
| startupProbe.initialDelaySeconds | int | `5` | Configure the initial delay seconds for the startup probe |
| startupProbe.periodSeconds | int | `10` | Configure the seconds for each period of the startup probe |
| startupProbe.successThreshold | int | `1` | Configure the success threshold for the startup probe |
| startupProbe.timeoutSeconds | int | `1` | Configure the initial delay seconds for the startup probe |
| strategy | object | `{}` | Specify a deployment strategy for the Mealie pod |
| tolerations | list | `[]` | Tolerations for pod assignment ref: https://kubernetes.io/docs/concepts/configuration/taint-and-toleration/ |
| volumeMounts | list | `[]` | Define volumeMounts for the mealie pod |
| volumes | list | `[]` | Define volumes for the mealie pod |
