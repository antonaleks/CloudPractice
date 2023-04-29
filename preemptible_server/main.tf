

# Инициализация провайдера Openstack
provider "openstack" {
  user_name           = var.user_name
  tenant_name         = var.project_name
  password            = var.user_password
  project_domain_name = regex("[[:digit:]]+$", var.sel_token)
  user_domain_name    = regex("[[:digit:]]+$", var.sel_token)
  auth_url            = var.os_auth_url
  region              = substr(var.server_zone, 0, 4)
}

# Создание прерываемого сервера.
module "preemptible_server" {
  source = "../../../modules/vpc/server_remote_root_disk"

  server_name            = var.server_name
  server_zone            = var.server_zone
  server_vcpus           = var.server_vcpus
  server_ram_mb          = var.server_ram_mb
  server_root_disk_gb    = var.server_root_disk_gb
  server_volume_type     = var.server_volume_type
  server_image_name      = var.server_image_name
  server_ssh_key         = file("~/.ssh/id_rsa.pub")

  # Для смены прерываемого сервера на обычный используйте
  # переменную server_no_preemptible_tag:
  # server_preemptible_tag = var.server_no_preemptible_tag
  server_preemptible_tag = var.server_preemptible_tag
}
