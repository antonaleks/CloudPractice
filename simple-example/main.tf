# Инициализация Terraform и хранения Terraform State
terraform {
required_version = ">= 0.14.0"
  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "~> 1.49.0"
    }
  }
}

# Инициализация провайдера OpenStack
provider "openstack" {
  auth_url    = "https://api.selvpc.ru/identity/v3"
  domain_name = ""
  tenant_id   = ""
  user_name   = ""
  password    = ""
  region      = "ru-3"
}

# Создание сети
resource "openstack_networking_network_v2" "network_tf" {
  name = "network_tf"
}

# Создание подсети
resource "openstack_networking_subnet_v2" "subnet_tf" {
  name = "network_tf"
  network_id = openstack_networking_network_v2.network_tf.id
  cidr = "10.0.0.0/24"
}


# Создание сетевых портов
resource "openstack_networking_port_v2" "private_port" {
  name       = "test-eth0"
  network_id = openstack_networking_network_v2.network_tf.id
  fixed_ip {
    ip_address = "10.0.0.10"
    subnet_id = openstack_networking_subnet_v2.subnet_tf.id
  }
}

output "tf_output" {
  value = openstack_networking_network_v2.network_tf.id
}