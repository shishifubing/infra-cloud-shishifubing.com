resource "helm_release" "ingress_controller" {
  name        = "ingresscontroller"
  description = "nginx ingress controller"

  namespace       = kubernetes_namespace.ingress.metadata.0.name
  atomic          = true
  cleanup_on_fail = true
  lint            = true

  version    = "v0.1.9"
  chart      = "chart"
  repository = "oci://cr.yandex/yc-marketplace/yandex-cloud/yc-alb-ingress"

  # I cannot use `set` or `set_sensitive` - the helm provider fucks up the
  # formatting somehow
  values = [
    "saKeySecretKey: '${jsonencode(var.ingress_authorized_key)}'"
  ]

  set {
    name  = "folderId"
    value = var.folder_id
  }

  set {
    name  = "clusterId"
    value = var.cluster_id
  }

}
