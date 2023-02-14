# bucket module

<!-- BEGIN_TF_DOCS -->

## Requirements

No requirements.

## Providers

| Name                                                      | Version |
| --------------------------------------------------------- | ------- |
| <a name="provider_yandex"></a> [yandex](#provider_yandex) | n/a     |

## Modules

No modules.

## Resources

| Name                                                                                                                                                                                 | Type     |
| ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | -------- |
| [yandex_iam_service_account.admin](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/iam_service_account)                                            | resource |
| [yandex_iam_service_account.terraform_editor](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/iam_service_account)                                 | resource |
| [yandex_iam_service_account.vault_editor](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/iam_service_account)                                     | resource |
| [yandex_iam_service_account_static_access_key.admin](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/iam_service_account_static_access_key)        | resource |
| [yandex_iam_service_account_static_access_key.vault_editor](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/iam_service_account_static_access_key) | resource |
| [yandex_resourcemanager_folder_iam_binding.admin](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/resourcemanager_folder_iam_binding)              | resource |
| [yandex_resourcemanager_folder_iam_binding.storage_editor](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/resourcemanager_folder_iam_binding)     | resource |
| [yandex_storage_bucket.terraform](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/storage_bucket)                                                  | resource |
| [yandex_storage_bucket.vault](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/storage_bucket)                                                      | resource |

## Inputs

| Name                                                                                    | Description                    | Type     | Default | Required |
| --------------------------------------------------------------------------------------- | ------------------------------ | -------- | ------- | :------: |
| <a name="input_folder_id"></a> [folder_id](#input_folder_id)                            | yandex cloud folder_id         | `any`    | n/a     |   yes    |
| <a name="input_terraform_max_size"></a> [terraform_max_size](#input_terraform_max_size) | max size of the bucket (bytes) | `number` | n/a     |   yes    |
| <a name="input_terraform_name"></a> [terraform_name](#input_terraform_name)             | name of the terraform bucket   | `any`    | n/a     |   yes    |
| <a name="input_vault_max_size"></a> [vault_max_size](#input_vault_max_size)             | max size of the bucket (bytes) | `number` | n/a     |   yes    |
| <a name="input_vault_name"></a> [vault_name](#input_vault_name)                         | name of the terraform bucket   | `any`    | n/a     |   yes    |

## Outputs

| Name                                                                                                     | Description                        |
| -------------------------------------------------------------------------------------------------------- | ---------------------------------- |
| <a name="output_vault_editor_static_key"></a> [vault_editor_static_key](#output_vault_editor_static_key) | static access key for vault editor |

<!-- END_TF_DOCS -->
