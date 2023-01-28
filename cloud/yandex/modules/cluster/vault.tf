resource "helm_release" "vault" {
  name        = "vault"
  description = "vault"

  namespace       = kubernetes_namespace.vault.metadata.0.name
  atomic          = true
  cleanup_on_fail = true
  lint            = true

  version    = "0.19.0-1"
  chart      = "vault"
  repository = "oci://cr.yandex/yc-marketplace/yandex-cloud/vault/chart"

  # I cannot use `set` or `set_sensitive` - the helm provider fucks up the
  # formatting somehow
  values = [
    "yandexKmsAuthJson: '${jsonencode(var.vault_authorized_key)}'"
  ]

  set_sensitive {
    name  = "yandexKmsKeyId"
    value = var.vault_kms_key_id
  }

  set_sensitive {
    name = "extraEnvironmentVars"
    type = "auto"
    value = jsonencode({
      AWS_S3_BUCKET = ""
    })
  }

}
