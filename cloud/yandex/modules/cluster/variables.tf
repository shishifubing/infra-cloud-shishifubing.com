variable "namespace_monitoring" {
  description = "namespace for monitoring"
  default     = "monitoring"
}

variable "namespace_ingress" {
  description = "namespace for the cluster ingress"
  default     = "ingress"
}

variable "namespace_vault" {
  description = "namespace for Vault"
  default     = "vault"
}

variable "ingress_authorized_key" {
  sensitive   = true
  description = "authorized key for the cluster ingress"
}

variable "vault_authorized_key" {
  sensitive   = true
  description = "authorized key for Vault"
}

variable "vault_kms_key_id" {
  sensitive   = true
  description = "id of the KMS key for Vault"
}


variable "folder_id" {
  description = "yandex cloud folder id"
}

variable "cluster_id" {
  description = "yandex cloud cluster id"
}
