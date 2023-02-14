# [`infra-cloud-shishifubing.com`][repo-url]

<!-- shields -->

[![AGPLv3.0 License][license-shield]][license-url]
[![Terraform][terraform-workflow-shield]][terraform-workflow-url]

<!-- description -->

Terraform module managing infrastructure for [shishifubing.com][site-url]

Currently it's using [Yandex Cloud][yandex-cloud-url]

For more information please refer to [cloud/yandex][documentation]

# Architecture diagram

TODO

# Regenerate module documentation

```bash
terraform-docs markdown table --recursive --output-file README.md cloud/yandex
```

<!-- relative links -->

[documentation]: ./cloud/yandex

<!-- project links -->

[repo-url]: https://github.com/shishifubing/infra-cloud-shishifubing.com
[terraform-workflow-url]: https://github.com/shishifubing/infra-cloud-shishifubing.com/actions/workflows/terraform.yml
[license-url]: https://github.com/shishifubing/infra-cloud-shishifubing.com/actions/workflows/terraform.yml

<!-- external links -->

[site-url]: https://shishifubing.com
[yandex-cloud-url]: https://cloud.yandex.com/en

<!-- shield links -->

[terraform-workflow-shield]: https://img.shields.io/github/actions/workflow/status/shishifubing/infra-cloud-shishifubing.com/terraform.yml?label=Terraform&style=for-the-badge
[license-shield]: https://img.shields.io/github/license/shishifubing/infra-cloud-shishifubing.com.svg?style=for-the-badge
