variable "domain_name" {
  description = "Domain name for OpenStack authentication"
  type        = string
}

variable "tenant_id" {
  description = "Tenant (project) ID"
  type        = string
}

variable "user_name" {
  description = "OpenStack username"
  type        = string
}

variable "password" {
  description = "OpenStack password"
  type        = string
  sensitive   = true
}

variable "region" {
  default = "ru-7"
}

variable "keypair_name" {
  description = "SSH key pair"
  type        = string
  default = "keypair-tf"
}

variable "keypair_public_key" {
  description = "SSH public key pair"
  type        = string
  default     = "~/.ssh/id_rsa.pub"
}

variable "network_name" {
  description = "Network name"
  type        = string
  default     = "network_tf"
}

variable "server_name" {
  description = "Server name"
  type        = string
  default     = "todo-app"
}

### ATTENTION!!! Do not edit this block, please.
variable "server_zone" {
  type        = string
  description = "The name of the Selectel's pool."

  default = "ru-7a"

  validation {
    condition     = can(regex("ru-7a", var.server_zone))
    error_message = "Preemtible servers are available in ru-7a pool only."
  }
}

variable "server_vcpus" {
  default = 1
}

variable "server_ram_mb" {
  default = 2048
}

variable "server_root_disk_gb" {
  default = 10
}

variable "server_volume_type" {
  default = "basic.ru-7a"
}

variable "server_image_name" {
  description = "Server image name"
  type        = string
  default     = "Ubuntu 22.04 LTS 64-bit"
}

variable "server_preemptible_tag" {
  description = "is preemptible"
  default = ["preemptible"]
}

variable "server_no_preemptible_tag" {
  default = []
}

variable "inventory_template" {
  description = "Ansible inventory"
  type        = string
  default     = "./resources/inventory.tmpl"
}