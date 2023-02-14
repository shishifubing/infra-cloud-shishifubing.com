# main module

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

| Name                                                                                                                                                                     | Type        |
| ------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | ----------- |
| [yandex_compute_instance.bastion](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/compute_instance)                                    | resource    |
| [yandex_dns_recordset.bastion](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/dns_recordset)                                          | resource    |
| [yandex_dns_recordset.master](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/dns_recordset)                                           | resource    |
| [yandex_dns_recordset.master_external](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/dns_recordset)                                  | resource    |
| [yandex_dns_recordset.public](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/dns_recordset)                                           | resource    |
| [yandex_dns_recordset.public_www](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/dns_recordset)                                       | resource    |
| [yandex_dns_zone.internal](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/dns_zone)                                                   | resource    |
| [yandex_dns_zone.public](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/dns_zone)                                                     | resource    |
| [yandex_iam_service_account.admin](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/iam_service_account)                                | resource    |
| [yandex_iam_service_account.editor](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/iam_service_account)                               | resource    |
| [yandex_iam_service_account.viewer](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/iam_service_account)                               | resource    |
| [yandex_kms_symmetric_key.cluster](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/kms_symmetric_key)                                  | resource    |
| [yandex_kubernetes_cluster.default](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/kubernetes_cluster)                                | resource    |
| [yandex_kubernetes_node_group.default](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/kubernetes_node_group)                          | resource    |
| [yandex_lb_network_load_balancer.cluster_master](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/lb_network_load_balancer)             | resource    |
| [yandex_lb_target_group.cluster_master](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/lb_target_group)                               | resource    |
| [yandex_resourcemanager_folder_iam_binding.admin](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/resourcemanager_folder_iam_binding)  | resource    |
| [yandex_resourcemanager_folder_iam_binding.editor](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/resourcemanager_folder_iam_binding) | resource    |
| [yandex_resourcemanager_folder_iam_binding.viewer](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/resourcemanager_folder_iam_binding) | resource    |
| [yandex_vpc_address.cluster_master](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/vpc_address)                                       | resource    |
| [yandex_vpc_gateway.cluster](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/vpc_gateway)                                              | resource    |
| [yandex_vpc_network.default](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/vpc_network)                                              | resource    |
| [yandex_vpc_route_table.cluster](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/vpc_route_table)                                      | resource    |
| [yandex_vpc_security_group.allow_incoming](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/vpc_security_group)                         | resource    |
| [yandex_vpc_security_group.allow_outgoing](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/vpc_security_group)                         | resource    |
| [yandex_vpc_subnet.cluster](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/vpc_subnet)                                                | resource    |
| [yandex_vpc_subnet.default](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/vpc_subnet)                                                | resource    |
| [yandex_compute_image.image_base](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/data-sources/compute_image)                                    | data source |

## Inputs

| Name                                                                                       | Description                                    | Type          | Default                                                                                                                                     | Required |
| ------------------------------------------------------------------------------------------ | ---------------------------------------------- | ------------- | ------------------------------------------------------------------------------------------------------------------------------------------- | :------: |
| <a name="input_authorized_key_path"></a> [authorized_key_path](#input_authorized_key_path) | path to the authorized key file                | `any`         | n/a                                                                                                                                         |   yes    |
| <a name="input_cloud_id"></a> [cloud_id](#input_cloud_id)                                  | cloud id for Yandex Cloud                      | `any`         | n/a                                                                                                                                         |   yes    |
| <a name="input_domain"></a> [domain](#input_domain)                                        | domain for public Cloud DNS                    | `any`         | n/a                                                                                                                                         |   yes    |
| <a name="input_domain_internal"></a> [domain_internal](#input_domain_internal)             | domain for internal Cloud DNS                  | `any`         | n/a                                                                                                                                         |   yes    |
| <a name="input_domain_top_redirect"></a> [domain_top_redirect](#input_domain_top_redirect) | redirect for the top public DNS domain (CNAME) | `any`         | n/a                                                                                                                                         |   yes    |
| <a name="input_folder_id"></a> [folder_id](#input_folder_id)                               | folder id for Yandex Cloud                     | `any`         | n/a                                                                                                                                         |   yes    |
| <a name="input_image_family"></a> [image_family](#input_image_family)                      | dictionary of image families                   | `map(string)` | <pre>{<br> "base": "debian-11-base",<br> "nginx": "debian-11-nginx",<br> "runner": "debian-11-runner",<br> "source": "debian-11"<br>}</pre> |    no    |
| <a name="input_kubernetes_version"></a> [kubernetes_version](#input_kubernetes_version)    | kubernetes version                             | `any`         | n/a                                                                                                                                         |   yes    |
| <a name="input_ssh_authorized_keys"></a> [ssh_authorized_keys](#input_ssh_authorized_keys) | authorized keys for the cluster nodes          | `any`         | n/a                                                                                                                                         |   yes    |
| <a name="input_user_ci"></a> [user_ci](#input_user_ci)                                     | ci user for all servers                        | `string`      | `"ci"`                                                                                                                                      |    no    |
| <a name="input_user_server"></a> [user_server](#input_user_server)                         | admin user for all servers                     | `any`         | n/a                                                                                                                                         |   yes    |
| <a name="input_zone"></a> [zone](#input_zone)                                              | yandex cloud zone                              | `any`         | n/a                                                                                                                                         |   yes    |

## Outputs

| Name                                                                 | Description               |
| -------------------------------------------------------------------- | ------------------------- |
| <a name="output_cluster"></a> [cluster](#output_cluster)             | kubernetes cluster object |
| <a name="output_user_server"></a> [user_server](#output_user_server) | n/a                       |

<!-- END_TF_DOCS -->
