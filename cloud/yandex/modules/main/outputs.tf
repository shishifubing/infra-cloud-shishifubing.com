output "cluster_id" {
  value = yandex_kubernetes_cluster.default.id
}

output "user_server" {
  value = var.user_server
}

output "cluster_ingress_authorized_key" {
  value     = yandex_iam_service_account_key.cluster_ingress
  sensitive = true
}
