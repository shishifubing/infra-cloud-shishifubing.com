resource "kubernetes_namespace" "monitoring" {
  metadata {
    name = var.namespace_monitoring
  }
}

resource "kubernetes_namespace" "ingress" {
  metadata {
    name = var.namespace_ingress
  }
}


resource "kubernetes_namespace" "vault" {
  metadata {
    name = var.namespace_vault
  }
}
