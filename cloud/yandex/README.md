# Usage

## CI

- Commit
- Make a PR
- Merge

## Manual

```bash
# export auth variables
. ./variables.sh
# build images
make
# update the infrastructure
terraform apply
```

# Getting started

## Delegate domain

In order for public Cloud DNS to work with your domain, you need to delegate it to Yandex DNS servers:

- `ns1.yandexcloud.net`
- `ns2.yandexcloud.net`

Cloud DNS settings are located in [networking.tf][networking]

## Setup terraform backend and local environment

> **Warning**
> If you are trying to create an expensive resource, e.g., Kubernetes cluster,
> and your account doesn't have enough money, Yandex will return 403 without any
> explanation

- create two folders - bucket and main
- put their ids in [variables.tf][variables.tf] and [packer/variables.pkr.hcl][packer-variables]
- create service accounts `bucket-admin` and `main-admin-personal` with `admin` role
  (one in each folder)
- create authorized keys (IAM keys), download them
- create an s3 bucket to store the terraform state file
- create `bucket-terraform-editor` account with `storage.editor` role
- create a static key for it, download the key
- modify `TF_VAR_authorized_key_bucket`, `AWS_ACCESS_KEY_ID`, and
  `AWS_SECRET_ACCESS_KEY` in [variables.sh][variables.sh]
- modify the backend bucket configuration in [main.s3.tfbackend][backend]
- import the accounts and the bucket

[S3 backend in Yandex Cloud][yandex-terraform-s3-backend] documentation

[S3 terraform backend][terraform-s3-backend] documentation

```bash
# install tools, link configs
url="https://raw.githubusercontent.com/shishifubing-com/misc-personal-dotfiles/main/scripts/setup.sh"
curl -sSL "${url}" | bash
# export credentials
# they have to be exported when you run terraform commands
# you need to execute the script in your current shell (either `.` or `source`)
. ./variables.sh
# build images
make
# initialize terraform backend
terraform init -reconfigure -backend-config=main.s3.tfbackend
# import service accounts that you created
terraform import module.bucket.yandex_iam_service_account.admin "ajejspdr1h4brif17qo1"
terraform import module.bucket.yandex_iam_service_account.terraform_editor "ajejsd0ei25cgf44irbi"
# you cannot import this one before the first apply, terraform will throw an error
#    The configuration for provider["registry.terraform.io/hashicorp/helm"] depends on values that
#    │ cannot be determined until apply.
#terraform import module.main.yandex_iam_service_account.admin "ajetdgfmmebaiu6nekkl"
# import the bucket (it can take some time)
terraform import module.bucket.yandex_storage_bucket.terraform "shishifubing-com-terraform"
# create the infrastructure (it can take some time)
# it will fail, because you need to setup kubeconfig
terraform apply
# setup kubeconfig
yc init
./setup_kubectl.sh
# create the cluster
terraform apply
# unseal the vault
kubectl exec --stdin=true --tty=true vault-0 -- vault operator init
# go to url https://vault.shishifubing.com and setup the vault

# setup ssh (if you need to)
echo "$(terraform output -raw ssh_config)" >>"${HOME}/.ssh/config"
```

### Helm provider fails to download helm charts and doesn't provide a reason

```
Error: could not download chart: failed to download
"oci://cr.yandex/yc-marketplace/yandex-cloud/yc-alb-ingress/chart"
```

Downloads of `oci://` charts fail if they are not specified properly,
they should be specified like so:

```hcl
version = "v0.1.9"
chart = "chart"
repository = "oci://cr.yandex/yc-marketplace/yandex-cloud/yc-alb-ingress"
```

# Documentation

- [Yandex Cloud][yandex-cloud] documentation
- [Yandex terraform provider][yandex-terraform] documentation
- [Packer builder][yandex-packer] documentation
- [Terraform backend in Yandex Cloud][yandex-terraform-s3-backend]
  documentation
- [S3 terraform backend][terraform-s3-backend] documentation
- `*.cloud-init.yml` files - [cloud-init][cloud-init] configuration files

<!-- internal links -->

[networking]: ./modules/main/networking.tf
[setup.sh]: ./packer/setup.sh
[backend]: ./main.s3.tfbackend
[variables.sh]: ./variables.sh
[variables.tf]: ./variables.tf
[packer-variables]: ./packer/variables.pkr.hcl

<!-- external links -->

[github-pages]: https://docs.github.com/en/pages/configuring-a-custom-domain-for-your-github-pages-site/managing-a-custom-domain-for-your-github-pages-site
[cloud-init]: https://cloudinit.readthedocs.io/en/latest/topics/examples.html
[yandex-terraform]: https://registry.tfpla.net/providers/yandex-cloud/yandex/latest/docs
[yandex-packer]: https://developer.hashicorp.com/packer/plugins/builders/yandex
[yandex-cloud]: https://cloud.yandex.ru/docs/tutorials/infrastructure-management/terraform-quickstart
[yandex-terraform-s3-backend]: https://cloud.yandex.com/en-ru/docs/tutorials/infrastructure-management/terraform-state-storage#set-up-backend
[terraform-s3-backend]: https://developer.hashicorp.com/terraform/language/settings/backends/s3
[terraform]: https://www.terraform.io/
[helm]: https://helm.sh/
[yc]: https://cloud.yandex.com/en/docs/cli/quickstart
[kubectl]: https://kubernetes.io/docs/reference/kubectl/
[packer]: https://developer.hashicorp.com/packer/docs/intro
[gitversion]: https://gitversion.net

<!-- BEGIN_TF_DOCS -->

## Requirements

| Name                                                                        | Version |
| --------------------------------------------------------------------------- | ------- |
| <a name="requirement_terraform"></a> [terraform](#requirement_terraform)    | >= 0.13 |
| <a name="requirement_helm"></a> [helm](#requirement_helm)                   | 2.8.0   |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement_kubernetes) | 2.16.1  |
| <a name="requirement_yandex"></a> [yandex](#requirement_yandex)             | 0.84.0  |

## Providers

No providers.

## Modules

| Name                                                     | Source            | Version |
| -------------------------------------------------------- | ----------------- | ------- |
| <a name="module_bucket"></a> [bucket](#module_bucket)    | ./modules/bucket  | n/a     |
| <a name="module_cluster"></a> [cluster](#module_cluster) | ./modules/cluster | n/a     |
| <a name="module_main"></a> [main](#module_main)          | ./modules/main    | n/a     |

## Resources

No resources.

## Inputs

| Name                                                                                                | Description                                    | Type     | Default                        | Required |
| --------------------------------------------------------------------------------------------------- | ---------------------------------------------- | -------- | ------------------------------ | :------: |
| <a name="input_authorized_key"></a> [authorized_key](#input_authorized_key)                         | authorized key for yandex cloud                | `any`    | n/a                            |   yes    |
| <a name="input_authorized_key_bucket"></a> [authorized_key_bucket](#input_authorized_key_bucket)    | authorized key for the bucket                  | `any`    | n/a                            |   yes    |
| <a name="input_cloud_id"></a> [cloud_id](#input_cloud_id)                                           | cloud id in yandex cloud                       | `string` | `"b1g1vmf1q6kf4ap0d710"`       |    no    |
| <a name="input_domain"></a> [domain](#input_domain)                                                 | domain for public Cloud DNS                    | `string` | `"shishifubing.com"`           |    no    |
| <a name="input_domain_internal"></a> [domain_internal](#input_domain_internal)                      | domain for internal Cloud DNS                  | `string` | `"internal"`                   |    no    |
| <a name="input_domain_top_redirect"></a> [domain_top_redirect](#input_domain_top_redirect)          | redirect for the top public DNS domain (CNAME) | `string` | `"shishifubing-com.github.io"` |    no    |
| <a name="input_folder_id"></a> [folder_id](#input_folder_id)                                        | folder id in Yandex Cloud                      | `string` | `"b1gt03ltb5rv3iieiuv9"`       |    no    |
| <a name="input_folder_id_bucket"></a> [folder_id_bucket](#input_folder_id_bucket)                   | bucket folder id in Yandex Cloud               | `string` | `"b1gk0hd1lkhbe6qj3u2s"`       |    no    |
| <a name="input_kubernetes_config_path"></a> [kubernetes_config_path](#input_kubernetes_config_path) | path to the kubernetes config file             | `string` | `"~/.kube/config"`             |    no    |
| <a name="input_kubernetes_version"></a> [kubernetes_version](#input_kubernetes_version)             | kubernetes version                             | `string` | `"1.23"`                       |    no    |
| <a name="input_static_key_bucket"></a> [static_key_bucket](#input_static_key_bucket)                | secret key for the bucket admin account        | `any`    | n/a                            |   yes    |
| <a name="input_static_key_id_bucket"></a> [static_key_id_bucket](#input_static_key_id_bucket)       | key id for the bucket admin account            | `any`    | n/a                            |   yes    |
| <a name="input_user_server"></a> [user_server](#input_user_server)                                  | n/a                                            | `string` | `"shishifubing"`               |    no    |
| <a name="input_zone"></a> [zone](#input_zone)                                                       | yandex cloud zone                              | `string` | `"ru-central1-a"`              |    no    |

## Outputs

| Name                                                                          | Description |
| ----------------------------------------------------------------------------- | ----------- |
| <a name="output_access"></a> [access](#output_access)                         | n/a         |
| <a name="output_bastion_domain"></a> [bastion_domain](#output_bastion_domain) | n/a         |
| <a name="output_bastion_user"></a> [bastion_user](#output_bastion_user)       | n/a         |
| <a name="output_cloud_id"></a> [cloud_id](#output_cloud_id)                   | n/a         |
| <a name="output_cluster_id"></a> [cluster_id](#output_cluster_id)             | n/a         |
| <a name="output_domain"></a> [domain](#output_domain)                         | n/a         |
| <a name="output_folder_id"></a> [folder_id](#output_folder_id)                | n/a         |
| <a name="output_master_domain"></a> [master_domain](#output_master_domain)    | n/a         |
| <a name="output_ssh_config"></a> [ssh_config](#output_ssh_config)             | n/a         |

<!-- END_TF_DOCS -->
