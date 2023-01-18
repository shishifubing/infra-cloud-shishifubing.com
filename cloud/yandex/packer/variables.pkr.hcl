variable "version" {
  description = "image version"
}

variable "use_nat" {
  description = <<-EOT
    whether to use nat
    (nat is required if the packer client is outside of the network)
  EOT
  type        = bool
  default     = true
}

variable "setup_script_path" {
  description = "path to the setup script"
  default = "${env("DOTFILES")}/scripts/setup.sh"
}

variable "folder_id" {
  description = "yandex cloud folder id"
  default     = "b1gkrp2c8oqlmgsedd9t"
}

variable "cloud_id" {
  description = "yandex cloud cloud id"
  default     = "b1g1vmf1q6kf4ap0d710"
}

variable "oauth_key" {
  description = "oauth key to setup yc on the bastion server"
  sensitive   = true
}

variable "zone" {
  description = "yandex cloud zone"
  default     = "ru-central1-a"
}

variable "user_server" {
  description = "admin user for all servers"
  default     = "shishifubing"
}

variable "ssh_key_connection" {
  description = "private key used to connect to the instance during build"
  default     = "~/.ssh/id_main"
}
