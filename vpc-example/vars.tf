# Пул Облачной платформы
variable "region" {
  default = "ru-7"
}

# Значение SSH-ключа для доступа к облачному серверу
variable "public_key" {
  default = ""
}

# Сегмент пула
variable "az_zone" {
  default = "ru-7a"
}

# Тип сетевого диска, из которого создается сервер
variable "volume_type" {
  default = "basic.ru-7a"
}

# CIDR подсети
variable "subnet_cidr" {
  default = "10.10.0.0/24"
}

# Sensitive block
variable "domain_name" {
  sensitive = true
}

variable "tenant_id" {
  sensitive = true
}

variable "user_name" {
  sensitive = true
}

variable "password" {
  sensitive = true
}