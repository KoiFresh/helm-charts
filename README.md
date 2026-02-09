<img src="https://raw.githubusercontent.com/cncf/artwork/892ce913bbce895ddbd99f981917fcf93050a8ca/projects/helm/icon/color/helm-icon-color.svg" alt="Helm Logo" align="right" width="225"/>

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

### OCI Installation (TBD)

```shell
helm install oci://ghcr.io/koifresh/helm-charts/<CHART_NAME>:<VERSION>
```

## 📖 Overview

<div align="center">

| Chart                                                                                                                                                                                                                                                                  | Current Version | Default Container Images                            |
| :--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | :-------------: | --------------------------------------------------- |
| [Gotenberg <img src="https://user-images.githubusercontent.com/8983173/130322857-185831e2-f041-46eb-a17f-0a69d066c4e5.png" alt="Gotenberg Logo" width="32px" height="32px" align="right" loading="lazy">][gotenberg_chart]                                             |      0.2.2      | [gotenberg/gotenberg][gotenberg_images]             |
| [Paperless-NGX <img src="https://raw.githubusercontent.com/paperless-ngx/paperless-ngx/5842944d1ef817c11a47ed5c19ba8b7886c9fbfe/resources/logo/web/svg/square.svg" alt="Paperless-NGX Logo" width="32px" height="32px" align="right" loading="lazy">][paperless_chart] |      0.3.0      | [paperless-ngx/paperless-ngx][paperless_ngx_images] |

</div>

<!-- INTERNAL REFERENCES -->

<!-- Chart references -->

[gotenberg_chart]: charts/gotenberg
[paperless_chart]: charts/paperless-ngx

<!-- File references -->

[license]: LICENSE

<!-- General links -->

[helm]: https://helm.sh

<!-- Overview links -->

[gotenberg_images]: https://hub.docker.com/r/gotenberg/gotenberg
[paperless_ngx_images]: https://github.com/paperless-ngx/paperless-ngx/pkgs/container/paperless-ngx
