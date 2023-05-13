# Создание SSH-ключа
resource "openstack_compute_keypair_v2" "key_tf" {
  name       = "key_tf"
  region     = var.region
  public_key = var.public_key
}

# Запрос ID внешней сети по имени
data "openstack_networking_network_v2" "external_net" {
  name = "external-network"
}

# Создание роутера
resource "openstack_networking_router_v2" "router_tf" {
  name                = "router_tf"
  external_network_id = data.openstack_networking_network_v2.external_net.id
}

# Создание сети
resource "openstack_networking_network_v2" "network_tf" {
  name = "network_tf"
}

# Создание подсети
resource "openstack_networking_subnet_v2" "subnet_tf" {
  network_id = openstack_networking_network_v2.network_tf.id
  name       = "subnet_tf"
  cidr       = var.subnet_cidr
}

# Подключение роутера к подсети
resource "openstack_networking_router_interface_v2" "router_interface_tf" {
  router_id = openstack_networking_router_v2.router_tf.id
  subnet_id = openstack_networking_subnet_v2.subnet_tf.id
}

# Поиск ID образа (из которого будет создан сервер) по его имени
data "openstack_images_image_v2" "ubuntu_image" {
  most_recent = true
  visibility  = "public"
  name        = "Ubuntu 20.04 LTS 64-bit"
}

# Создание уникального имени флейвора
resource "random_string" "random_name_server" {
  length  = 16
  special = false
}

# Создание конфигурации сервера с 1 ГБ RAM и 1 vCPU
# Параметр disk = 0  делает сетевой диск загрузочным
resource "openstack_compute_flavor_v2" "flavor_server" {
  name      = "server-${random_string.random_name_server.result}"
  ram       = "1024"
  vcpus     = "1"
  disk      = "0"
  is_public = "false"
}

# Создание сетевого загрузочного диска размером 5 ГБ из образа
resource "openstack_blockstorage_volume_v3" "volume_server" {
  name                 = "volume-for-server1"
  size                 = "10"
  image_id             = data.openstack_images_image_v2.ubuntu_image.id
  volume_type          = var.volume_type
  availability_zone    = var.az_zone
  enable_online_resize = true
  lifecycle {
    ignore_changes = [image_id]
  }
}

# Создание сервера
resource "openstack_compute_instance_v2" "server_tf" {
  name              = "server_tf"
  flavor_id         = openstack_compute_flavor_v2.flavor_server.id
  key_pair          = openstack_compute_keypair_v2.key_tf.id
  availability_zone = var.az_zone
  network {
    uuid = openstack_networking_network_v2.network_tf.id
  }
  block_device {
    uuid             = openstack_blockstorage_volume_v3.volume_server.id
    source_type      = "volume"
    destination_type = "volume"
    boot_index       = 0
  }
  vendor_options {
    ignore_resize_confirmation = true
  }
  lifecycle {
    ignore_changes = [image_id]
  }
}

# Создание публичного IP-адреса
resource "openstack_networking_floatingip_v2" "fip_tf" {
  pool = "external-network"
}

# Привязка публичного IP-адреса к серверу
resource "openstack_compute_floatingip_associate_v2" "fip_tf" {
  floating_ip = openstack_networking_floatingip_v2.fip_tf.address
  instance_id = openstack_compute_instance_v2.server_tf.id
}

output "server_outputs" {
  value = "ssh root@${openstack_networking_floatingip_v2.fip_tf.address}"
}