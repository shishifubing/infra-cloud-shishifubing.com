resource "yandex_storage_bucket" "terraform" {
  bucket     = var.name
  access_key = yandex_iam_service_account_static_access_key.terraform.access_key
  secret_key = yandex_iam_service_account_static_access_key.terraform.secret_key

  default_storage_class = "ICE"

  max_size = var.max_size
  versioning {
    enabled = true
  }
}
