# Пул Облачной платформы
variable "region" {
  default = "ru-3"
}

# Значение SSH-ключа для доступа к облачному серверу
variable "public_key" {
  default = ""
}

# Сегмент пула
variable "az_zone" {
  default = "ru-3a"
}

# Тип сетевого диска, из которого создается сервер
variable "volume_type" {
  default = "basic.ru-3a"
}

# CIDR подсети
variable "subnet_cidr" {
  default = "10.10.0.0/24"
}