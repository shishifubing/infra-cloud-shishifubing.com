locals {
  keys_path           = "${path.module}/packer/authorized_keys"
  ssh_authorized_keys = <<-EOT
    root:${file("${local.keys_path}/id_ci.pub")}
    root:${file("${local.keys_path}/id_main.pub")}
    root:${file("${local.keys_path}/id_rsa.pub")}
  EOT
}

# manage the s3 bucket
module "bucket" {
  source = "./modules/bucket"
  providers = {
    yandex = yandex.bucket
  }

  folder_id          = var.folder_id_bucket
  terraform_name     = "${replace(var.domain, ".", "-")}-terraform"
  vault_name         = "${replace(var.domain, ".", "-")}-vault"
  vault_max_size     = 1024 * 1024 * 300 # 300 megabytes
  terraform_max_size = 1024 * 1024 * 300 # 300 megabytes
}

# setup infrastructure, create a kubernetes cluster
module "main" {
  source = "./modules/main"

  folder_id           = var.folder_id
  cloud_id            = var.cloud_id
  authorized_key_path = var.authorized_key
  zone                = var.zone
  domain              = var.domain
  domain_internal     = var.domain_internal
  domain_top_redirect = var.domain_top_redirect
  kubernetes_version  = var.kubernetes_version
  ssh_authorized_keys = local.ssh_authorized_keys
  user_server         = var.user_server
}

# setup kubectl if `kubectl cluster-info` fails
resource "null_resource" "check_kubeconfig" {
  provisioner "local-exec" {
    command = <<-EOT
      set -Eeuxo pipefail
      {
        kubectl config use-context "${module.main.cluster_id}"
        kubectl cluster-info
      } || ${path.module}/setup_kubectl.sh \
        "${var.domain}"                    \
        "${var.cloud_id}"                  \
        "${var.folder_id}"                 \
        "${module.main.cluster_id}"        \
        "${var.user_server}"
    EOT
  }
}

# setup the kubernetes cluster
module "cluster" {
  source = "./modules/cluster"
  depends_on = [
    null_resource.check_kubeconfig
  ]

  ingress_authorized_key = module.main.cluster_ingress_authorized_key
  folder_id              = var.folder_id
  cluster_id             = module.main.cluster_id
  vault_authorized_key   = ""
  vault_kms_key_id       = ""
}
