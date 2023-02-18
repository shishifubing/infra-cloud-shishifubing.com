<div align="center" markdown="1">

# [`infra-cloud-shishifubing.com`][url-repo]


[![License][shield-license]][url-license]
[![Terraform][shield-workflow-terraform]][url-workflow-terraform]

Terraform module managing infrastructure for [shishifubing.com][url-site]

</div>

Currently it's using [Yandex Cloud][url-yandex-cloud]

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

[url-repo]: https://github.com/shishifubing/infra-cloud-shishifubing.com
[url-workflow-terraform]: https://github.com/shishifubing/infra-cloud-shishifubing.com/actions/workflows/terraform.yml
[url-license]: https://github.com/shishifubing/infra-cloud-shishifubing.com/actions/workflows/terraform.yml

<!-- external links -->

[url-site]: https://shishifubing.com
[url-yandex-cloud]: https://cloud.yandex.com/en

<!-- shield links -->

[shield-workflow-terraform]: https://img.shields.io/github/actions/workflow/status/shishifubing/infra-cloud-shishifubing.com/terraform.yml?label=Terraform&style=for-the-badge
[shield-license]: https://img.shields.io/github/license/shishifubing/infra-cloud-shishifubing.com.svg?style=for-the-badge
