# cluster module

<!-- BEGIN_TF_DOCS -->

## Requirements

No requirements.

## Providers

| Name                                                                  | Version |
| --------------------------------------------------------------------- | ------- |
| <a name="provider_helm"></a> [helm](#provider_helm)                   | n/a     |
| <a name="provider_kubernetes"></a> [kubernetes](#provider_kubernetes) | n/a     |
| <a name="provider_yandex"></a> [yandex](#provider_yandex)             | n/a     |

## Modules

No modules.

## Resources

| Name                                                                                                                                                                                | Type     |
| ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------- |
| [helm_release.ingress_controller](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release)                                                             | resource |
| [helm_release.vault](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release)                                                                          | resource |
| [kubernetes_namespace.namespaces](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace)                                                     | resource |
| [yandex_iam_service_account.ingress](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/iam_service_account)                                         | resource |
| [yandex_iam_service_account.vault](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/iam_service_account)                                           | resource |
| [yandex_iam_service_account_key.ingress](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/iam_service_account_key)                                 | resource |
| [yandex_iam_service_account_key.vault](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/iam_service_account_key)                                   | resource |
| [yandex_kms_symmetric_key.vault](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/kms_symmetric_key)                                               | resource |
| [yandex_kms_symmetric_key_iam_binding.vault](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/kms_symmetric_key_iam_binding)                       | resource |
| [yandex_resourcemanager_folder_iam_binding.alb_editor](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/resourcemanager_folder_iam_binding)        | resource |
| [yandex_resourcemanager_folder_iam_binding.certificate_admin](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/resourcemanager_folder_iam_binding) | resource |
| [yandex_resourcemanager_folder_iam_binding.compute_viewer](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/resourcemanager_folder_iam_binding)    | resource |
| [yandex_resourcemanager_folder_iam_binding.storage_editor](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/resourcemanager_folder_iam_binding)    | resource |
| [yandex_resourcemanager_folder_iam_binding.vpc_publicAdmin](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/resourcemanager_folder_iam_binding)   | resource |

## Inputs

| Name                                                                                                      | Description                           | Type                                                                                                                                                       | Default | Required |
| --------------------------------------------------------------------------------------------------------- | ------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------- | ------- | :------: |
| <a name="input_cluster_id"></a> [cluster_id](#input_cluster_id)                                           | yandex cloud cluster id               | `any`                                                                                                                                                      | n/a     |   yes    |
| <a name="input_folder_id"></a> [folder_id](#input_folder_id)                                              | yandex cloud folder id                | `any`                                                                                                                                                      | n/a     |   yes    |
| <a name="input_namespaces"></a> [namespaces](#input_namespaces)                                           | dictionary of namespaces for services | <pre>object({<br> vault = optional(string, "vault")<br> ingress = optional(string, "ingress")<br> monitoring = optional(string, "monitoring")<br> })</pre> | `{}`    |    no    |
| <a name="input_vault_backend_static_key"></a> [vault_backend_static_key](#input_vault_backend_static_key) | s3 static key for vault               | `any`                                                                                                                                                      | n/a     |   yes    |
| <a name="input_vault_bucket_name"></a> [vault_bucket_name](#input_vault_bucket_name)                      | vault's s3 bucket name                | `any`                                                                                                                                                      | n/a     |   yes    |
| <a name="input_zone"></a> [zone](#input_zone)                                                             | yandex cloud zone                     | `any`                                                                                                                                                      | n/a     |   yes    |

## Outputs

No outputs.

<!-- END_TF_DOCS -->
