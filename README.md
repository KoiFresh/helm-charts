# Helm Charts <img src="https://raw.githubusercontent.com/cncf/artwork/892ce913bbce895ddbd99f981917fcf93050a8ca/projects/helm/icon/color/helm-icon-color.svg" alt="Helm Logo" align="right" width="225"/>

[![License](https://img.shields.io/github/license/fmjstudios/helm?label=License)](https://opensource.org/licenses/MIT)
[![CI Status](https://github.com/koifresh/helm-charts/actions/workflows/release.yaml/badge.svg)](https://github.com/koifresh/helm-charts/blob/main/.github/workflows/ci-pipeline.yml)

A collection of open-source [MIT][license]-licensed [_Helm Charts_][helm]. Have a look [at the table below](#-overview) to get a list of the
included charts, their versions and the default container images.

## ✨ TL;DR

### Helm Repository Installation

```shell
helm repo add koifresh https://koifresh.github.io/helm-charts
helm install <RELEASE_NAME> koifresh/<CHART_NAME>
```

### OCI Installation

```shell
helm install oci://ghcr.io/koifresh/helm-charts/<CHART_NAME>:<VERSION>
```

## 📖 Charts

- [Gotenberg](./charts/gotenberg/)
- [Paperless-NGX](./charts/paperless-ngx/)
- [Mealie](./charts/mealie/)

<!-- INTERNAL REFERENCES -->

<!-- File references -->

[license]: LICENSE

<!-- General links -->

[helm]: https://helm.sh
