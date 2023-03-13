<div align="center" markdown="1">

# [`infra-cloud-shishifubing.com`][url-repo]

[![License][badge-license]][url-license]
[![Terraform][badge-workflow-terraform]][url-workflow-terraform]
[![Version][badge-version]][url-version]
[![Release][badge-workflow-release]][url-workflow-release]
[![Conventional Commits][badge-conventionalcommits]][url-conventionalcommits]

Terraform module managing infrastructure for [shishifubing.com][url-site]

</div>

## About The Project

Currently the module using [Yandex Cloud][url-yandex-cloud]

For more information please refer to [cloud/yandex][documentation]

### Architecture diagram

TODO

## Regenerate module documentation

```bash
terraform-docs markdown table --recursive --output-file README.md cloud/yandex
```

<!-- relative links -->

[documentation]: ./cloud/yandex

<!-- project links -->

[url-repo]: https://github.com/shishifubing/infra-cloud-shishifubing.com
[url-workflow-terraform]: https://github.com/shishifubing/infra-cloud-shishifubing.com/actions/workflows/terraform.yml
[url-license]: https://github.com/shishifubing/infra-cloud-shishifubing.com/actions/workflows/terraform.yml
[url-workflow-release]: https://github.com/shishifubing/infra-cloud-shishifubing.com/actions/workflows/release.yml
[url-version]: https://github.com/shishifubing/infra-cloud-shishifubing.com/releases/latest

<!-- external links -->

[url-site]: https://shishifubing.com
[url-yandex-cloud]: https://cloud.yandex.com/en
[url-conventionalcommits]: https://conventionalcommits.org

<!-- badge links -->

[badge-workflow-terraform]: https://img.shields.io/github/actions/workflow/status/shishifubing/infra-cloud-shishifubing.com/terraform.yml?label=terraform
[badge-license]: https://img.shields.io/github/license/shishifubing/infra-cloud-shishifubing.com.svg
[badge-workflow-release]: https://img.shields.io/github/actions/workflow/status/shishifubing/infra-cloud-shishifubing.com/release.yml?branch=main&label=release&logo=github
[badge-version]: https://img.shields.io/github/v/release/shishifubing/infra-cloud-shishifubing.com?label=version

<!-- other badge links -->

[badge-conventionalcommits]: https://img.shields.io/badge/conventional--commits-1.0.0-%23FE5196?logo=conventionalcommits&logoColor=white
