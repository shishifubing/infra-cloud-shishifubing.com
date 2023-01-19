variable "name" {
  description = "name of the bucket"
}

variable "folder_id" {
  description = "yandex cloud folder_id"
}

variable "max_size" {
  description = "max size of the bucket (bytes)"
  type        = number
}
